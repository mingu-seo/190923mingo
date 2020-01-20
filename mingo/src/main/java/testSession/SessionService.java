package testSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vo.UserVO;

@Service
public class SessionService {
	
	@Autowired
	private SessionDAO sessionDao;
	
	public UserVO viewUser(int user_id) {
		UserVO userVO = sessionDao.viewUser(user_id);
		return userVO;
	}
}
