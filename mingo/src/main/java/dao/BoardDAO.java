package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.BoardVO;
@Repository
public class BoardDAO {
	

		@Autowired
		SqlSessionTemplate sqlSession;
		
		public List<BoardVO> list(BoardVO vo) {
			return sqlSession.selectList("board.list", vo); // mapper 이름 namespace.id
		}
		
		public int count() {
			return sqlSession.selectOne("board.count");
		}
		public int insert(BoardVO vo) {
			return sqlSession.insert("board.insert",vo);
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
}
