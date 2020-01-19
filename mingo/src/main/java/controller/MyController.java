package controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import dao.MyDAO;
import service.MyService;
import vo.CafeFacilitiesVO;
import vo.CafeImageVO;
import vo.CafeMenuVO;
import vo.CafeProductVO;
import vo.CafeRateVO;
import vo.CafeServiceVO;
import vo.CafeVO;
import vo.ReviewVO;
import vo.UserVO;

@Controller
public class MyController {
	
	@Autowired private MyDAO myDao;  
	@Autowired private MyService myService;
	 
	@RequestMapping("/myMain.do")
	public String myMain(Model model, UserVO vo) {
		int user_id = vo.getUser_id();
		UserVO userVO = myService.viewUserInfo(user_id);
		model.addAttribute("userVO", userVO);
		return "mypage/myUserInfo";
	}
	
	@RequestMapping("/myCafe.do")
	public String myCafe(Model model, UserVO vo) {
		int user_id = vo.getUser_id();
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
	@RequestMapping("/myPost.do")
	public String myPost() {
		return "mypage/myMyPost";
	}
	
}
