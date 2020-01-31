package controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import dao.MyDAO;
import service.MyService;
import vo.BoardVO;
import vo.CafeFacilitiesVO;
import vo.CafeImageVO;
import vo.CafeMenuVO;
import vo.CafeProductVO;
import vo.CafeRateVO;
import vo.CafeServiceVO;
import vo.CafeVO;
import vo.CollectCafeVO;
import vo.LikeBoardVO;
import vo.ReviewVO;
import vo.UserVO;

@Controller
public class MyController {
	
	@Autowired private MyDAO myDao;  
	@Autowired private MyService myService;
	
	
	
	@RequestMapping("/checkPassword.do")
	public String myUserInfo(Model model, UserVO vo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO vo1 = (UserVO) session.getAttribute("userVO");
		int user_id = vo1.getUser_id();
		UserVO userVO = myService.viewUserInfo(user_id);
		String password = request.getParameter("password");
		String dbPwd = userVO.getPassword();
		int result;
		if(password.equals(dbPwd)) {
			result=1;
		} else{
			result=0; 
		}
		model.addAttribute("userVO", userVO);
		model.addAttribute("pwdResult", result);
		return "mypage/myAjax"; 
	}
	@RequestMapping("/myUserModifyPassword.do")
	public String myUserModifyPassword( HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO vo = (UserVO) session.getAttribute("userVO");
		vo.setPassword(request.getParameter("password"));
		System.out.println("비밀번호 : "+request.getParameter("password"));
		myService.myUserModifyPassword(vo);
		return "mypage/myUserModifyForm2"; 
	}  
	@RequestMapping("/myUserModifyForm1.do")
	public String myUserModifyForm1() {
		return "mypage/myUserModifyForm1";
	}
	@RequestMapping("/myUserModifyForm2.do")
	public String myUserModifyForm2() {
		return "mypage/myUserModifyForm2";
	}
	@RequestMapping("/myMain.do")
	public String myMain(Model model, UserVO vo) {
		int user_id = vo.getUser_id();
		UserVO userVO = myService.viewUserInfo(user_id);
		model.addAttribute("userVO", userVO);
		return "mypage/myUserInfo";
	}
	
	@RequestMapping("/myCafe.do")
	public String myCafe(Model model, UserVO vo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO vo1 = (UserVO) session.getAttribute("userVO");
		int user_id = vo1.getUser_id();
		UserVO userVO = myService.viewUserInfo(user_id);
		model.addAttribute("userVO", userVO);
		
		// 기본정보 조회
		CafeVO cafe = myService.viewCafe(user_id);   
		model.addAttribute("cafe", cafe);
		
		//종합 평점 조회
		int cafe_id = cafe.getCafe_id();
		CafeRateVO cafeRate = myService.viewCafeRate(cafe_id);   
		model.addAttribute("cafeRate", cafeRate);
		
		return "mypage/myMyCafe";
	}
	
	@RequestMapping("/myReview.do")
	public String myReview(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO vo = (UserVO) session.getAttribute("userVO");
		int user_id = vo.getUser_id();
		System.out.println("유저 아이디 : " + user_id);
		UserVO userVO = myService.viewUserInfo(user_id);
		List<ReviewVO> reviews = myService.viewReview(user_id);
		model.addAttribute("reviews", reviews);
		
		System.out.println("리뷰 리스트 조회 성공!!");
		List<CafeVO> cafeList = myService.viewCafe(reviews);
		model.addAttribute("cafeList", cafeList);
		return "mypage/myMyReview";
	}
	
	
	@RequestMapping("/modifyUserForm.do")
	public String updateUserForm(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO vo = (UserVO) session.getAttribute("userVO");
		int user_id = vo.getUser_id();
		UserVO userVO = myService.viewUserInfo(user_id);
		return "mypage/myModifyUserForm";
	}
	@RequestMapping("/modifyUser.do")
	public String updateUser(Model model, HttpServletRequest request, UserVO vo) {
		HttpSession session = request.getSession();
		UserVO vo_s = (UserVO)session.getAttribute("userVO");
		vo.setUser_id(vo_s.getUser_id());
		
		System.out.println(vo.getUser_id());
		System.out.println(vo.getGender());
		System.out.println(vo.getName());
		int r = myService.modifyUser(vo);
		return "redirect:/myMain.do";
	}
	
	
	
	@RequestMapping("/deleteUserForm.do")
	public String deleteUserForm() {
		return "mypage/myUserWithdraw";
	}  
	@RequestMapping("/deleteUser.do")
	public String deleteUser(HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO vo = (UserVO) session.getAttribute("userVO");
		int user_id = vo.getUser_id();
		myDao.deleteUser(user_id);
		session.invalidate();
		return "redirect:/goMain.do";
	}
	
	
	
	
	
	@RequestMapping("/myPost.do")
	public String myPost(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO vo = (UserVO) session.getAttribute("userVO");
		int user_id = vo.getUser_id();
		List<BoardVO> boardList = myService.viewBoard(user_id);
		model.addAttribute("boardList", boardList);
		return "mypage/myMyPost";
	}
	
	@RequestMapping("/myCollect.do")
	public String myCollect(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO vo = (UserVO) session.getAttribute("userVO");
		int user_id = vo.getUser_id();
		List<CollectCafeVO> collectList = myService.viewCollect(user_id);
		model.addAttribute("collectList", collectList);
		
		List<CafeVO> cafeList = myService.viewCafeList2(collectList);
		model.addAttribute("cafeList", cafeList);
		List<CafeRateVO> cafeRateList = myService.viewCafeRate2(collectList);
		model.addAttribute("cafeRateList", cafeRateList);
		return "mypage/myCollectCafe";
	}
	
	
	
	
	
}
