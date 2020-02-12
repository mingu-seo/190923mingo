package dao;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.BoardCommentVO;
import vo.BoardLikeVO;
import vo.BoardMetaVO;
import vo.BoardVO;
@Repository
public class BoardDAO {
	

		@Autowired
		SqlSessionTemplate sqlSession;
		
		public List<BoardVO> list(BoardVO vo) {
			return sqlSession.selectList("board.list", vo); // mapper 이름 namespace.id
		}
		
		public int count(BoardVO vo) {
			return sqlSession.selectOne("board.count",vo);
		}
		
		public int insert(BoardVO vo) {
			return sqlSession.insert("board.insert",vo);
		}
		public void refUpdate(int board_comment_id) { 
			sqlSession.update("board.refUpdate",board_comment_id);
		}
		//조회수 증가
		public void readcount(int board_id) {
			sqlSession.update("board.readcount",board_id);
		}
		public BoardVO view(int board_id) {
			return sqlSession.selectOne("board.view",board_id);
		}
		public int update(BoardVO vo) {
			return sqlSession.update("board.update",vo);
		}
		public int delete(int board_id) {
			return sqlSession.delete("board.delete",board_id);
		}
		public List<BoardCommentVO> clist(BoardCommentVO cvo){
			return sqlSession.selectList("board.clist",cvo);
		}
		public int replySeq(BoardCommentVO cvo) {
			return sqlSession.update("board.replySeq",cvo);
		}
		public int replySeqDown(BoardCommentVO cvo) {
			return sqlSession.update("board.replySeqDown",cvo);
		}
		public int replyInsert(BoardCommentVO cvo) {
			sqlSession.update("board.increaseReplyNum",cvo);
			return sqlSession.insert("board.replyInsert",cvo);
		}
		public int writeComment(BoardCommentVO cvo) {
			sqlSession.insert("board.writeComment",cvo);
			sqlSession.update("board.increaseReplyNum",cvo);
			return cvo.getBoard_comment_id();
		}
		public int replyDelete(BoardCommentVO cvo) {
			return sqlSession.delete("board.replyDelete",cvo);
		}
		public int listCount(int board_id) {
			return sqlSession.selectOne("board.countCommentList",board_id);
		}

		

		public BoardCommentVO getReply(int board_comment_id) {
			return sqlSession.selectOne("board.getReply",board_comment_id);
		}


		public void downReplyNum(int board_id) {
			sqlSession.update("board.decreaseReplyNum",board_id);
		}

		//대댓글이 존재하는지 검사하는 함수
		public int isRereExist(BoardCommentVO comment) {
			return sqlSession.selectOne("board.isRereExist", comment);
		}

		public int updateRemoved(int board_comment_id) {
			return sqlSession.update("board.updateRemoved", board_comment_id);  
		}

		public void replyLevDown(BoardCommentVO comment) {
			sqlSession.update("board.replyLevDown",  comment );
			
		}

		public List<BoardCommentVO> getBoardCommentList(int board_id) {
			return sqlSession.selectList("board.getBoardCommentList", board_id);
		}

		public void insertLike(BoardLikeVO vo) {
			sqlSession.insert("board.insertLike", vo);
		}
		public void insertBad(BoardLikeVO vo) {
			sqlSession.insert("board.insertDislike", vo);
		}

		public int getLikeNum(int board_id) {
			return sqlSession.selectOne("board.getLikeNum",board_id);  
		}
		public int getDislikeNum(int board_id) {
			return sqlSession.selectOne("board.getDislikeNum",board_id);  
		}

		public void updateLikeNum(int board_id) {
			sqlSession.update("board.updateLikeNum", board_id);
		}

		public List<BoardMetaVO> getBoardNames() {
			return sqlSession.selectList("board.getBoardNames");
		}
		

		

		

	

		

		


}
