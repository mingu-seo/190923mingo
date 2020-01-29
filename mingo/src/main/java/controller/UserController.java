package controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import service.UserService;
import vo.UserVO;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
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
			return "redirect:/goMain.do";
		}
	}
	
	//회원가입 폼 -일반회원
	@RequestMapping("/joinForm.do")
	public String joinForm() {
		return "join/joinForm";
	}
	
	//회원가입 폼 - 사장님회원
	@RequestMapping("/joinForm_host.do")
	public String joinForm_host() {
		return "join/joinForm_host";
	}
	
	//회원가입 처리
	@RequestMapping("/joinProcess.do")
	public String joinProcess(Model model,UserVO vo) {
		 int r =userService.joinProcess(vo);
		 String msg ="";
		 String url ="";
		 if (r > 0) {
			 msg = "가입되셨습니다.";
			 url = "/loginForm.do";
		 } else {
			 msg = "회원가입 실패";
			 url = "/join_step1.do";
		 }
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "include/alert";
	}
	
	//이메일 중복체크
	@RequestMapping("/emailCheck.do")
	public String emailCheck(Model model, @RequestParam("email") String email) {
		int result = userService.emailCheck(email);
		model.addAttribute("value", result);
		return "include/return";
		
	}
	//닉네임 중복체크
	@RequestMapping("/nicknameCheck.do")
	public String nicknameCheck(Model model, @RequestParam("nickname") String nickname) {
		int result = userService.nicknameCheck(nickname);
		model.addAttribute("value", result);
		return "include/return";
		
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
