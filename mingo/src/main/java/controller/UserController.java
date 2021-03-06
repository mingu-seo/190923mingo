package controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import service.UserService;
import vo.UserVO;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	// 로그인 폼
	@RequestMapping("/loginForm.do")
	public String loginForm() {
		return "login/loginForm";
	}
	
	
   // 네이버 로그인 폼
  
   @RequestMapping("/naverLoginProcess.do")
   public String naverLoginProcess(Model model, UserVO vo, HttpServletRequest request) { 
	   UserVO uv = userService.naverLoginProcess(vo);
		if (uv == null) {
			String msg = "회원가입을 해주세요.";
			String url = "/loginForm.do";
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "include/alert";
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("userVO", uv);
			//return "redirect:/goMain.do";
			String msg = "로그인되었습니다..";
			String url = "/goMain.do";
			model.addAttribute("cmd", "parentMove");
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "include/alert";
		} 
	}
 

	// 로그인 처리
	@RequestMapping("/loginProcess.do")
	public String loginProcess(Model model, UserVO vo, HttpServletRequest request) {
		UserVO uv = userService.loginProcess(vo);
		if (uv == null) {
			String msg = "잘못된 회원정보입니다.";
			String url = "/loginForm.do";
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "include/alert";
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("userVO", uv);
			return "redirect:/goMain.do";
		}
	}

	// 회원가입 폼 -일반회원
	@RequestMapping("/joinForm.do")
	public String joinForm() {
		return "join/joinForm";
	}

	// 회원가입 폼 - 사장님회원
	@RequestMapping("/joinForm_host.do")
	public String joinForm_host() {
		return "join/joinForm_host";
	}
	
	
	// 회원가입 처리
	@RequestMapping("/joinProcess.do")
	public String joinProcess(Model model, UserVO vo) {
		int r = userService.joinProcess(vo);
		String msg = "";
		String url = "";
		if (r > 0) {
			msg = "가입되었습니다.";
			url = "/loginForm.do";
		} else {
			msg = "회원가입 실패";
			url = "/join_step1.do";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "include/alert";
	}
	// 회원가입 처리
		@RequestMapping("/joinProcess2.do")
		public String joinProcess2(Model model, UserVO vo) {
			
			int r = userService.joinProcess(vo);
			//가입을 시킨뒤 해당 business_num이 cafe_id에 종속되는지 확인해야함
			
			//또한 해당 cafe테이블에 manager_id를 등록해야함
			String msg = "";
			String url = "";
			if (r > 0) {
				msg = "가입되었습니다.";
				url = "/loginForm.do";
			} else {
				msg = "회원가입 실패";
				url = "/join_step1.do";
			}
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "include/alert";
		}
	// 네이버 처리
	@RequestMapping("/naverJoinProcess.do")
	public String naverJoinProcess(Model model, UserVO vo) {
		int r = userService.naverJoinProcess(vo);
		String msg = "";
		String url = "";
		if (r > 0) {
			msg = "가입되었습니다.";
			url = "/loginForm.do";
			
		} else {
			msg = "회원가입 실패";
			url = "/join_step1.do";
		}
		model.addAttribute("cmd", "parentMove");
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "include/alert";
	}
	// 카카오 처리
	@RequestMapping("/kakaoJoinProcess.do")
	public String kakaoJoinProcess(Model model, UserVO vo) {
		int r = userService.kakaoJoinProcess(vo);
		String msg = "";
		String url = "";
		if (r > 0) {
			msg = "가입되었습니다.";
			url = "/loginForm.do";
			
		} else {
			msg = "회원가입 실패";
			url = "/join_step1.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "include/alert";
	}

	// 이메일 중복체크
	@RequestMapping("/emailCheck.do")
	public String emailCheck(Model model, @RequestParam("email") String email) {
		int result = userService.emailCheck(email);
		model.addAttribute("value", result);
		return "include/return";

	}

	// 닉네임 중복체크
	@RequestMapping("/nicknameCheck.do")
	public String nicknameCheck(Model model, @RequestParam("nickname") String nickname, HttpSession session) {
		if(session.getAttribute("userVO") !=null) {
			UserVO nowUser = (UserVO)session.getAttribute("userVO");
			if( nowUser.getNickname().equals(nickname)) {
				model.addAttribute("value", 0);
				return "include/return"; 
			}else {
				int result = userService.nicknameCheck(nickname);
				model.addAttribute("value", result);
				return "include/return";
			}
		
		}else {
			int result = userService.nicknameCheck(nickname);
			model.addAttribute("value", result);
			return "include/return";
			
		}
		
		
		

	}

	// 로그아웃
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "login/logout";
	}

	// 아이디 찾기 step1
	@RequestMapping("/findId_step1.do")
	public String findId_step1() {
		return "findUser/findId_step1";
	}

	// 아이디 찾기 step2
	@RequestMapping("/findId_step2.do")
	public String findId_step2(Model model, UserVO vo) {
		String rs = userService.findId_step2(vo);
		if (rs == null) {
			String msg = "일치하는 회원이 없습니다.";
			String url = "/loginForm.do";
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "include/alert";
		} else {
			model.addAttribute("email", rs);
			return "findUser/findId_step2";
		}
	}
    
	// 비밀번호 찾기 step1 form
	@RequestMapping("/findPwd_step1.do")
	public String findPwd_step1() {
		return "findUser/findPwd_step1";
	}

	// 비밀번호 찾기 step1 process 
	@RequestMapping("/step1_process.do")
	public String step1_process(Model model, @RequestParam("email") String email) {
		int user_id = userService.step1_process(email);
		model.addAttribute("user_id", user_id);
		return "findUser/findPwd_step2";
	}

	

	
	 //비밀번호 step2 form
	@RequestMapping("/findPwd_step2.do") 
	public String findPwd_step2(Model model,UserVO vo, HttpServletRequest request) {
	  userService.findPwd_step2(vo); 
	  model.addAttribute(vo); 
	  return "findUser/findPwd_step2"; 
	  }
	 

	// 비밀번호 step2 process
	@RequestMapping("/step2_process.do")
	public String step2_process(Model model, @RequestParam("user_id") int user_id, @RequestParam("password") String password) {
		int r = userService.updatePwd(user_id,password);
		String msg = "";
		String url = "";
		if (r > 0) {
			msg = "변경 되었습니다.";
			url = "/loginForm.do";
		} else {
			msg = "변경 실패";
			url = "/findPwd_step1.do";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "include/alert";
	}
	
	

	// 회원 유형 선택

	@RequestMapping("/join_step1.do")
	public String joinFormStep1() {
		return "/join/join_step1";
	}

	// 회원가입 유형 선택
	@RequestMapping("/join_step2.do")
	public String joinFormEmailStep2() {
		return "/join/join_step2";
	}
	
	//네이버 로그인
	@RequestMapping("/naverLogin.do")
	public String naverLogin() {
		
		return "login/naverLogin";
	}
	
	@RequestMapping("/callback.do")
	public String callback(HttpSession session) {
		
		return "login/callback";
	}
	
	@RequestMapping("/adminLoginProcess.do")
	public String adminLoginProcess(Model model, @RequestParam("email") String email,
			@RequestParam("password") String password, HttpServletRequest request) {
		Map uv = new HashMap<String, String>();
		uv.put("id", "admin");
		uv.put("password", "admin");

		if ("admin".equals(email) || "admin".equals(password)) {
			HttpSession session = request.getSession();
			UserVO tmp = new UserVO();
			tmp.setUser_id(-999);
			tmp.setName("운영자");
			tmp.setNickname("운영자");
			tmp.setEmail("admin");
			tmp.setPassword("admin");
			tmp.setType(3);
			session.setAttribute("admin", tmp );

			return "redirect:/adminMain.do";
		} else {
			String msg = "권한이 없습니다.";
			String url = "/adminLoginForm.do";
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "include/alert";
		}

	}
	
	
}
