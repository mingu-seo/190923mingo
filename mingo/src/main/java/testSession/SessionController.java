package testSession;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import vo.UserVO;

// 세션에 UserVO 값들을 넣고 테스트를 시작하기 위한 작업 
@Controller
@SessionAttributes("userVO")
public class SessionController {
	
	@Autowired
	private SessionService sessionService;
	@Autowired
	private SessionDAO sessionDao;
	
	
	@RequestMapping("/userSession.do")
	public String userSession(Model model, HttpServletRequest request) {
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		UserVO vo =  sessionService.viewUser(user_id);
		model.addAttribute("userVO", vo);
		
		HttpSession session = request.getSession();
		session.setAttribute("userVO", vo);
		
		return "test/userSession";
	}
	
	
}
