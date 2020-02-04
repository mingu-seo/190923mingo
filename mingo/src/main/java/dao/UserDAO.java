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
	public int emailCheck(String email) {
		return sqlSession.selectOne("userMapper.emailCheck", email);
	}

	/* 닉네임 중복체크 */
	public int nicknameCheck(String nickname) {
		return sqlSession.selectOne("userMapper.nicknameCheck", nickname);
	}

	/* 아이디찾기 결과 */
	public String findId_step2(UserVO vo) {
		return sqlSession.selectOne("userMapper.findId_step2", vo);
	}

	/* 비밀번호찾기 step1 */
	public UserVO findPwd_step2(UserVO vo) {
		return sqlSession.selectOne("userMapper.findPwd_step2", vo);
	}

	
	// 비밀번호 updateForm 
	public UserVO updatePwdForm(int user_id) { 
		return sqlSession.selectOne("userMapper.updatePwdForm", user_id); 
	}
	 

	/* 비밀번호 update */
	public int updatePwd(UserVO vo) {
		return sqlSession.update("userMapper.updatePwd", vo);
	}
}