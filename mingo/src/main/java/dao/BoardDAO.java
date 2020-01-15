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
}
