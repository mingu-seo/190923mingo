package service;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.UserDAO;
import vo.UserVO;

@Service
public class UserService {

	@Autowired
	UserDAO userDao;

	public UserVO loginProcess(UserVO vo) {
		return userDao.loginProcess(vo);
	}
	public int joinProcess(UserVO vo) {
		return userDao.joinProcess(vo);
	}
	
	public int emailCheck(UserVO vo) {
		return userDao.emailCheck(vo);
	}

	public UserVO id_step1_process(UserVO vo) {
		return userDao.id_step1_process(vo);
	}
	public UserVO pwd_step1_process(UserVO vo) {
		return userDao.pwd_step1_process(vo);
	}
	
}
