package dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.UserVO;


@Repository
public class UserDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public UserVO loginProcess(UserVO vo) {
		return sqlSession.selectOne("userMapper.loginProcess", vo);
	}
	public int joinProcess(UserVO vo) {
		return sqlSession.insert("userMapper.joinProcess", vo);
	}
	public UserVO id_step1_process(UserVO vo) {
		return sqlSession.selectOne("userMapper.id_step1_process", vo);
	}
	public UserVO pwd_step1_process(UserVO vo) {
		return sqlSession.selectOne("userMapper.pwd_step1_process", vo);
	}
}