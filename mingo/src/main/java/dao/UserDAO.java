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
	
	/* 아이디 중복체크 */
	public int emailCheck(String email){
		return sqlSession.selectOne("userMapper.emailCheck",email);
	}
	/* 닉네임 중복체크 */
	public int nicknameCheck(String nickname){
		return sqlSession.selectOne("userMapper.nicknameCheck", nickname);
	}
	
	public UserVO id_step1_process(UserVO vo) {
		return sqlSession.selectOne("userMapper.id_step1_process", vo);
	}
	public UserVO pwd_step1_process(UserVO vo) {
		return sqlSession.selectOne("userMapper.pwd_step1_process", vo);
	}
}