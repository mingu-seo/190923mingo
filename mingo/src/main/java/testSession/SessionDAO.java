package testSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.UserVO;

@Repository
public class SessionDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public UserVO viewUser(int user_id) {
		return sqlSession.selectOne("test.selectUser", user_id);
	}

}
