package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import test.TestVO;

@Repository
public class MainDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<String> getSigunguList(int sido_code) {
		return sqlSession.selectList("hong.getSigungu", sido_code);
		
	}
	
	public List<String> getDongList(int sigungu_code) {
		return sqlSession.selectList("hong.getDong", sigungu_code);
		
	}

	
	
}
