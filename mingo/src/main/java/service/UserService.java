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

	public UserVO id_step1_process(UserVO vo) {
		return userDao.id_step1_process(vo);
	}
	public UserVO pwd_step1_process(UserVO vo) {
		return userDao.pwd_step1_process(vo);
	}
	
}
