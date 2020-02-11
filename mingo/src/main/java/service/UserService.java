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
	public UserVO naverLoginProcess(UserVO vo) {
		return userDao.naverLoginProcess(vo);
	}
	//회원가입
	public int joinProcess(UserVO vo) {
		return userDao.joinProcess(vo);
	}
	//네이버 회원가입
	public int naverJoinProcess(UserVO vo) {
		return userDao.naverJoinProcess(vo);
	}
	
	//이메일 중복체크
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
	public int step1_process(String email) {
		return userDao.step1_process(email);
	}

	
	//비밀번호 updateForm 
	public UserVO findPwd_step2(UserVO vo) { 
		return userDao.findPwd_step2(vo); 
	}
	
	//비밀번호 update
	public int step2_process(UserVO vo) {
		return userDao.step2_process(vo);
	}
	public int updatePwd(int user_id, String password) {
		return userDao.updatePwd(user_id,password);
	}
	
}
