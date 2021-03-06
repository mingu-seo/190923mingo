package dao;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.UserVO;

@Repository
public class UserDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	//로그인
	public UserVO loginProcess(UserVO vo) {
		return sqlSession.selectOne("userMapper.loginProcess", vo);
	}
	//네이버 로그인
	public UserVO naverLoginProcess(UserVO vo) {
		return sqlSession.selectOne("userMapper.naverLoginProcess", vo);
	}
	//회원가입 처리
	public int joinProcess(UserVO vo) {
		return sqlSession.insert("userMapper.joinProcess", vo);
	}
	
	/* 네이버 회원가입 */
	public int naverJoinProcess(UserVO vo) {
		return sqlSession.insert("userMapper.naverJoinProcess", vo);
	}
	/* 카카오 회원가입 */
	public int kakaoJoinProcess(UserVO vo) {
		return sqlSession.insert("userMapper.kakaoJoinProcess", vo);
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

	/* 비밀번호찾기 step1 처리 */
	public int step1_process(String email) {
		int user_id = sqlSession.selectOne("userMapper.step1_process", email);
		
		return user_id;
		
		
	}

	
	// 비밀번호 updateForm 
	public UserVO findPwd_step2(UserVO vo ) { 
		return sqlSession.selectOne("userMapper.findPwd_step2", vo); 
	}
	 

	/* 비밀번호 update */
	public int step2_process(UserVO vo) {
		return sqlSession.update("userMapper.step2_process", vo);
	}

	public int updatePwd(int user_id, String password) {
		Map param = new HashMap<String, Object>();
		param.put("user_id", user_id);
		param.put("password", password);
		return sqlSession.update("userMapper.updatePwd", param);
	}
}