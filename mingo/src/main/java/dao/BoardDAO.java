package dao;


import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.BoardCommentVO;
import vo.BoardVO;
import vo.LikeBoardVO;
@Repository
public class BoardDAO {
	

		@Autowired
		SqlSessionTemplate sqlSession;
		
		public List<BoardVO> list(BoardVO vo) {
			return sqlSession.selectList("board.list", vo); 
		}
		
		public int count(int type) {
			return sqlSession.selectOne("board.count",type);
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
		public int replyInsert(BoardCommentVO cvo) {
			return sqlSession.insert("board.replyInsert",cvo);
		}
		public int writeComment(BoardCommentVO cvo) {
			sqlSession.insert("board.writeComment",cvo);
			return cvo.getBoard_comment_id();
		}
		public int replyDelete(int board_comment_id) {
			return sqlSession.delete("board.replyDelete",board_comment_id);
		}
		public int listCount(int board_id) {
			return sqlSession.selectOne("board.countCommentList",board_id);
		}
		public int likeBoard(LikeBoardVO lvo) {
			int r = sqlSession.insert("board.likeBoard", lvo);
			return r;
		}
		public int likeBoardCancel(LikeBoardVO lvo) {
			sqlSession.delete("board.likeBoardCancel", lvo);
			return 1;
		}
		

}
