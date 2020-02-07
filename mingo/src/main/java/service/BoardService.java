package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.BoardDAO;
import vo.BoardCommentVO;
import vo.BoardVO;
import vo.LikeBoardVO;



@Service
public class BoardService {

	@Autowired
	BoardDAO boardDAO;

	public List<BoardVO> list(BoardVO vo) {

		List<BoardVO> list = boardDAO.list(vo);
		return list;
	}

	public int[] boardCount(int type) {
		int listcount = boardDAO.count(type); // 전체 갯수
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
	public int replyDelete(int board_comment_id) {
		return boardDAO.replyDelete(board_comment_id); 
	}
	public int listCount(int board_id) {
		return boardDAO.listCount(board_id);
	}
	public int registLike(LikeBoardVO vo) {
		return boardDAO.registLike(vo);
	}
	public int deleteLike(LikeBoardVO vo) {
		int r = boardDAO.deleteLike(vo);
		return r;
	}
}
