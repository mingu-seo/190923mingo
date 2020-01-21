package controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.UserService;
import vo.UserVO;

@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	
	//로그인 폼
	@RequestMapping("/loginForm.do")
	public String loginForm()  {
		return "login/loginForm";
	}
	//로그인 처리
	@RequestMapping("/loginProcess.do")
	public String loginProcess(Model model, UserVO vo, HttpServletRequest request) {
		UserVO uv = userService.loginProcess(vo);
		if (uv == null) {
			String msg = "잘못된 회원정보 입니다.";
			String url = "/loginForm.do";
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "include/alert";
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("userVO", vo);
			return "redirect:/main/goMain.do";
		}
	}
	
	//회원가입 폼
	@RequestMapping("/joinForm.do")
	public String joinForm() {
		return "join/joinForm";
	}
	
	//회원가입 처리
	@RequestMapping("/joinProcess.do")
	public String joinProcess(Model model,UserVO vo,HttpServletRequest request) {
		 userService.joinProcess(vo);
		return "redirect:/login/loginForm.do";
	}
	//	로그아웃 
	@RequestMapping("/logout.do")
	public String logout() {
		return "redirect:/main/goMain.do";
	}
	
	//아이디 찾기 step1
	@RequestMapping("/findId_step1.do")
	public String findId_step1() {
		return"findUser/findId_step1";
	}
	
	//step1 처리
	@RequestMapping("/id_step1_process.do")
	public String id_step1_process(Model model,UserVO vo,HttpServletRequest request) {
		userService.id_step1_process(vo);
		return"redirect:/findId_step2.do";
	}
	
	//아이디 찾기 step2
	@RequestMapping("/findId_step2.do")
	public String findId_step2() {
		return "findUser/findId_step2";
	}
	//비밀번호 찾기 step1
	@RequestMapping("/findPwd_step1.do")
	public String findPwd_step1() {
		return "findUser/findPwd_step1";
	}
	//step1 처리
	@RequestMapping("/pwd_step1_process.do")
	public String pwd_step1_process(Model model,UserVO vo,HttpServletRequest request) {
		userService.pwd_step1_process(vo);
		return"redirect:/findPwd_step2";
	}
	
	//비밀번호 찾기 step2
	@RequestMapping("/findPwd_step2.do")
	public String findPwd_step2() {
		return "findUser/findPwd_step2";
	}
	
	//회원 유형 선택 
	@RequestMapping("/join_step1.do")
	public String joinFormStep1() {
		return "/join/join_step1";
	}
	
	//회원가입 유형 선택 
	@RequestMapping("/join_step2.do")
	public String joinFormEmailStep2() {
		return "/join/join_step2";
	}
}
