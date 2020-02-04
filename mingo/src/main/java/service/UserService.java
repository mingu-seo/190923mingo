package service;






import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.UserDAO;
import vo.UserVO;

@Service
public class UserService {

	@Autowired
	private UserDAO userDao;

	public UserVO loginProcess(UserVO vo) {
		return userDao.loginProcess(vo);
	}
	public int joinProcess(UserVO vo) {
		return userDao.joinProcess(vo);
	}
	
	//아이디 중복체크
	public int emailCheck(String email) {
		return userDao.emailCheck(email);
	}
	//닉네임 중복체크
	public int nicknameCheck(String nickname) {
		return userDao.nicknameCheck(nickname);
	}

	//아이디찾기
	public String findId_step2(UserVO vo) {
		return userDao.findId_step2(vo);
	}
	
	//비밀번호찾기 step1 
	public UserVO findPwd_step2(UserVO vo) {
		return userDao.findPwd_step2(vo);
	}

	
	//비밀번호 updateForm 
	public UserVO updatePwdForm(int user_id) { 
		return userDao.updatePwdForm(user_id); 
	}
	
	//비밀번호 update
	public int updatePwd(UserVO vo) {
		return userDao.updatePwd(vo);
	}
	
}
