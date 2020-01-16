package dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.UserVO;


@Repository
public class UserDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int joinUser(UserVO vo) {
		return sqlSession.insert("mingo.loginMain", vo);
	}
}