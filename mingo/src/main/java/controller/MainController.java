package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	//메인으로 이동
	@RequestMapping("/goMain.do")
	public String goMain() {
		
		return "hong/main";
	}
	
	//로그인 페이지로 이동
	@RequestMapping("/goLoginForm.do")
	public String goLoginForm() {
		
		return "su/loginMain";
	}
	@RequestMapping("/joinMember.do")
	public String joinMember() {
		return "jeong/joinForm";
	}
	
}
