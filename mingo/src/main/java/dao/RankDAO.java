package dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.RankCommand;

@Repository
public class RankDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Map> getCafeRankList(RankCommand tmp) {
		return sqlSession.selectList("hong.getCafeRankList", tmp);
	}

	public int getCafeRankCount(RankCommand tmp) {
		return sqlSession.selectOne("hong.getCafeRankCount",tmp);
	}

}
