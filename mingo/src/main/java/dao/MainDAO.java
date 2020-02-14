package dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.BoardVO;
import vo.CafeCommand;
import vo.CafeVO;
import vo.ReviewVO;
import vo.UserVO;

@Repository
public class MainDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public List<Map> getSigunguList(int sido_code) {
		return sqlSession.selectList("main.getSigungu", sido_code);
		
	}
	
	public List<Map> getDongList(int sigungu_code) {
		return sqlSession.selectList("main.getDong", sigungu_code);
		
	}

	/* 4가지 옵션을 이용하여 찾는 함수 */
	public List<CafeVO> getCafeList(CafeCommand cafeTmp) {
		
		return sqlSession.selectList("main.getCafeList", cafeTmp);
	}
	
	/* 필터만 이용하여 찾는 함수 */
	public List<CafeVO> getCafeList2(CafeCommand cafeTmp) {
		
		return sqlSession.selectList("main.getCafeList2", cafeTmp);
	}

	public List<BoardVO> getBoardList(int boardType) {
		return sqlSession.selectList("main.getBoardList",boardType);
	}

	public List<Map> getReviewList() {
		return sqlSession.selectList("main.getReviewList");
	}

	public int getCafeListCount(CafeCommand cafeCommand) {
		return sqlSession.selectOne("main.getCafeListCount",cafeCommand);
	}

	public List<String> getSidoList() {
		return sqlSession.selectList("main.getSido");
	}
	
	

	
	
	
}
