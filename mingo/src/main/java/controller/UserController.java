package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import service.UserService;
import vo.UserVO;

@Controller
public class UserController {
	
	
	@RequestMapping("/loginMain.do")
	public String loginMain() {
		return "su/loginMain";
	}
	@RequestMapping("/joinForm.do")
	public String joinForm() {
		return "jeong/joinForm";
	}
	@RequestMapping("/join.do")
	public String join(UserVO vo,  HttpServletRequest request) {
		UserService.joinUser(vo,  request);
		return "redirect:/hong/main.mg";
	}
	@RequestMapping("/findId_step1.do")
	public String findId_step1() {
		return "findUser/findId_step1";
	}
	@RequestMapping("/findId_step2.do")
	public String findId_step2() {
		return "findUser/findId_step2";
	}
}
