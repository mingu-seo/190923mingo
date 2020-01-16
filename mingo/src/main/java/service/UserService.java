package service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.UserDAO;
import vo.UserVO;

@Service
public class UserService {

	@Autowired
	UserDAO userDao;

	public static void joinUser(UserVO vo, HttpServletRequest request) {
		// TODO Auto-generated method stub
		
	}

	
}
