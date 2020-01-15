package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import service.UserService;
import vo.UserVO;

@Controller
public class UserController {
	
	
	@RequestMapping("/su/loginMain.mg")
	public String loginMain() {
		return "su/loginMain";
	}
	@RequestMapping("/jeong/joinForm.mg")
	public String joinForm() {
		return "jeong/joinForm";
	}
	@RequestMapping("/jeong/join.mg")
	public String join(UserVO vo,  HttpServletRequest request) {
		UserService.joinUser(vo,  request);
		return "redirect:/hong/main.mg";
	}
}
