package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.BoardDAO;
import vo.BoardCommentVO;
import vo.BoardLikeVO;
import vo.BoardVO;



@Service
public class BoardService {

	@Autowired
	BoardDAO boardDAO;

	public List<BoardVO> list(BoardVO vo) {

		List<BoardVO> list = boardDAO.list(vo);
		return list;
	}

	public int[] boardCount(BoardVO vo) {
		int listcount = boardDAO.count(vo); // 전체 갯수
		int totalpage = listcount / 10; // 총페이지수
		if (listcount % 10 > 0)
			totalpage++;

		int[] pagecount = new int[2];
		pagecount[0] = listcount;
		pagecount[1] = totalpage;

		return pagecount;
	}
	
	public int insert(BoardVO vo) {
		int r = boardDAO.insert(vo);
		
		return r;
	}
	public BoardVO detail(int board_id) {
		// 조회수 증가
		boardDAO.readcount(board_id);
		return boardDAO.view(board_id);
	}
	public BoardVO view(int board_id) {
		BoardVO vo = boardDAO.view(board_id);
		return vo;
	}
	public int update(BoardVO vo) {
		return boardDAO.update(vo);
	}
	public int delete(int board_id) {
		return boardDAO.delete(board_id); 
	}
	public List<BoardCommentVO> clist(BoardCommentVO cvo) {

		List<BoardCommentVO> clist = boardDAO.clist(cvo);
		return clist;
	}
	public int writeComment(BoardCommentVO cvo) {
		int r = boardDAO.writeComment(cvo);
		boardDAO.refUpdate(r);
		return r;
	}
	public int replyProcess(BoardCommentVO cvo) {
		//원글의 seq보다 크고 ref가 같은 모든 글을 seq+1을 해줘야 함.
		//vo에다가 ref=원글의 ref를, lev=원글의 lev+1, seq=원글의 seq+1을 
		//insert해주면 됨.
		 boardDAO.replySeq(cvo);
		// lev , seq 1증가     ref는 jsp 있기에 자동으로 들어옴 
		cvo.setLev(cvo.getLev()+1);
		cvo.setSeq(cvo.getSeq()+1);
		
		return boardDAO.replyInsert(cvo);
	}
	
	public int replyDeleteProcess(BoardCommentVO cvo) {
		//id에 해당하는 comment 객체를 얻어온다.
		int result=0;
		BoardCommentVO comment = null;
		int isRereExist = 0;
		comment = boardDAO.getReply(cvo.getBoard_comment_id());
		int level = comment.getLev();
		isRereExist = boardDAO.isRereExist(comment);
		
		//대댓글들이 달려있는데 삭제시키는 경우
		//자기자신을 삭제할때 화면에는 댓글이 표시되도록 하되, 삭제된 게시물이라고 알려준다.
		if( isRereExist > 0) {
			//board의 리플 갯수를 하나 내린다.
			//is_deleted 컬럼에 1 설정한다.
			boardDAO.downReplyNum(comment.getBoard_id());
			result = boardDAO.updateRemoved(comment.getBoard_comment_id());
		}else { //그냥 지운다.
			
			
			//board의 리플 갯수를 하나 내린다.
			boardDAO.downReplyNum(comment.getBoard_id());
			
			//해당 id의 reply 로우를 삭제한다.
			result = boardDAO.replyDelete(comment); 
			
			//원글이랑 ref가 같고 seq가 큰 모든 글을 seq-1 해준다.
			boardDAO.replySeqDown(comment);
		}
		
		return result;
	}
	
	public int listCount(int board_id) {
		return boardDAO.listCount(board_id);
	}

	

	public void refreshDB(int board_id) {
		//해당 board_id에 가져오는 리플들 리스트중에서
		// is_deleted가 1인것을 가져오고
		List<BoardCommentVO> board_comment_list = boardDAO.getBoardCommentList(board_id);
		// 대댓글이 달려있는지 검사하고(ref가 같으면서 seq+1, lev+1이 없는경우)
		for( BoardCommentVO i : board_comment_list) {
			//대댓글이 존재하면
			System.out.println(i.getBoard_comment_id());
			if(boardDAO.isRereExist(i) > 0) {
				continue;
			}else { //존재하지 않으면 seq넘버 정리하고, 해당 댓글을 삭제한다.
				boardDAO.replyDelete(i);
				
				//원글이랑 ref가 같고 seq가 큰 모든 글을 seq-1 해준다.
				boardDAO.replySeqDown(i);
			}
		}
		
	}


	public int upLikeNum(BoardLikeVO vo) {
		
		BoardLikeVO blvo = boardDAO.checkLike(vo); //board_id user_id체크값
		int num = 0;
		if (blvo == null) { //값이 없으면   좋아요 버튼
			boardDAO.insertLike(vo); //추가
			if (vo.getType() == 1) {// type이 1이면
				num = boardDAO.getLikeNum(vo.getBoard_id());// type1 카운트
			} else {
				num = boardDAO.getDislikeNum(vo.getBoard_id()); //type2 카운트
			}
		} else { //싫어요 버튼
			if (blvo.getType() == vo.getType()) { //dbtype과 사용자type이 같으면
				boardDAO.deleteLike(vo); //삭제
				if (vo.getType() == 1) {
					num = boardDAO.getLikeNum(vo.getBoard_id());
				} else {
					num = boardDAO.getDislikeNum(vo.getBoard_id());
				}
			} else { //type이 -1일 떄
				num = -1;
			}
		}
		boardDAO.updateLikeNum(vo.getBoard_id()); //like_num업데이트
		
		return num;
	}

	public int upBadNum(BoardLikeVO vo) {
		boardDAO.insertBad(vo);
		int num = boardDAO.getDislikeNum(vo.getBoard_id());
		return num;
	}
	

}
