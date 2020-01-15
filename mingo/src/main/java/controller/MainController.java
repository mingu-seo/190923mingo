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
	
	//회원 가입 페이지로 이동
	@RequestMapping("/joinMember.do")
	public String joinMember() {
		return "jeong/joinForm";
	}
	
	//카페 검색결과 
	@RequestMapping("/listCafe.do")
	public String listCafe() {
		return "hong/searchResult";
	}
	
	//랭킹 통계 페이지로 이동
	@RequestMapping("/rankCafe.do")
	public String rankCafe() {
		return "hong/rankMain";
	}
	//게시판으로 이동
	@RequestMapping("/listBoard.do")
	public String listBoard() {
		return "hong/boardMain";
	}
	
}
