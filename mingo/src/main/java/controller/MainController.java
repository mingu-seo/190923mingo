package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	//메인으로 이동
	@RequestMapping("/goMain.mg")
	public String goMain() {
		
		return "hong/main";
	}
	public static void main(String[] args) {
		MainController a;
		
	}
	//로그인 페이지로 이동
	@RequestMapping("/goLoginForm.mg")
	public String goLoginForm() {
		
		return "su/loginMain";
	}
	@RequestMapping("/joinMember")
	public String joinMember() {
		return "jeong/joinForm";
	}
	
}
