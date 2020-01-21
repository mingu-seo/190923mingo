package dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.CafeVO;

@Repository
public class MainDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public List<Map> getSigunguList(int sido_code) {
		return sqlSession.selectList("hong.getSigungu", sido_code);
		
	}
	
	public List<Map> getDongList(int sigungu_code) {
		return sqlSession.selectList("hong.getDong", sigungu_code);
		
	}

	public List<CafeVO> getCafeList(CafeVO cafeTmp) {
		return sqlSession.selectList("hong.getCafeList", cafeTmp);
	}

	public List<CafeVO> getCafeListByScore(CafeVO cafeTmp) {
		
		return sqlSession.selectList("hong.getCafeListByScore", cafeTmp);
	}

	
	
}
