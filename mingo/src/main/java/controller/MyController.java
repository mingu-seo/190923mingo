package controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		return "mypage/myMyReview";
	}  
	@RequestMapping("/myReviewAjax.do")
	public String myReviewAjax(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO vo = (UserVO) session.getAttribute("userVO");
		int user_id = vo.getUser_id();
		System.out.println("전송된 현재 페이지 : " + request.getParameter("currentPage"));
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		int myReview_num = myService.countMyReview(user_id);
		model.addAttribute("myReview_num", myReview_num);
		
		int maxPage = (myReview_num-1)/5+1;
		int beginIndex = (currentPage-1)*5;
		int beginPage = ((currentPage-1)/5)*5+1;
		int endPage;
		if(maxPage-currentPage<4) {  
			endPage = maxPage;
		} else {
			endPage = ((currentPage-1)/5)+5;
		}
		model.addAttribute("maxPage", maxPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("beginPage", beginPage);
		model.addAttribute("endPage", endPage);	
		
		System.out.println("최대: " +maxPage+ ".../...현재 :" +currentPage+ ".../...시작 : " + beginPage + ".../...마지막 : " +endPage );
		
		Map<String, Integer> reviewMap = new HashMap<String, Integer>();
		reviewMap.put("currentPage", currentPage);
		reviewMap.put("user_id", user_id);
		reviewMap.put("beginIndex", beginIndex);
		
		List<ReviewVO> reviews = myService.viewMyReview(reviewMap);
		model.addAttribute("reviews", reviews);
		
		List<CafeVO> cafeList = myService.viewCafe(reviews);
		model.addAttribute("cafeList", cafeList);
		
		return "mypage/myReviewAjax";
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
		return "mypage/myMyPost";
	}
	@RequestMapping("/myPostAjax.do")
	public String myPostAjax(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO vo = (UserVO) session.getAttribute("userVO");
		int user_id = vo.getUser_id();
		
		int myPost_num = myService.countMyPost(user_id);
		model.addAttribute("myPost_num", myPost_num);
		
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		int maxPage = (myPost_num-1)/5+1;
		int beginIndex = (currentPage-1)*5;
		int beginPage = ((currentPage-1)/5)*5+1;
		int endPage;
		if(maxPage-currentPage<4) {  
			endPage = maxPage;
		} else {
			endPage = ((currentPage-1)/5)+5;
		}
		model.addAttribute("maxPage", maxPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("beginPage", beginPage);
		model.addAttribute("endPage", endPage);	
		
		System.out.println("최대: " +maxPage+ ".../...현재 :" +currentPage+ ".../...시작 : " + beginPage + ".../...마지막 : " +endPage );
		
		Map<String, Integer> boardMap = new HashMap<String, Integer>();
		boardMap.put("currentPage", currentPage);
		boardMap.put("user_id", user_id);
		boardMap.put("beginIndex", beginIndex);
		
		List<BoardVO> boardList  = myService.viewMyPost(boardMap);
		model.addAttribute("boardList", boardList);
		
		
		return "mypage/myMyPostAjax";
	}
	
	@RequestMapping("/myCollect.do")
	public String myCollect(Model model, HttpServletRequest request) {
		return "mypage/myCollectCafe";
	}
	@RequestMapping("/myCollectAjax.do")
	public String myCollectAjax(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO vo = (UserVO) session.getAttribute("userVO");
		int user_id = vo.getUser_id();

		int myCollect_num = myService.countMyCollect(user_id);
		model.addAttribute("myCollect_num", myCollect_num);
		
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		int maxPage = (myCollect_num-1)/5+1;
		int beginIndex = (currentPage-1)*5;
		int beginPage = ((currentPage-1)/5)*5+1;
		int endPage;
		if(maxPage-currentPage<4) {  
			endPage = maxPage;
		} else {
			endPage = ((currentPage-1)/5)+5;
		}
		model.addAttribute("maxPage", maxPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("beginPage", beginPage);
		model.addAttribute("endPage", endPage);	
		
		System.out.println("최대: " +maxPage+ ".../...현재 :" +currentPage+ ".../...시작 : " + beginPage + ".../...마지막 : " +endPage );
		
		Map<String, Integer> collectMap = new HashMap<String, Integer>();
		collectMap.put("currentPage", currentPage);
		collectMap.put("user_id", user_id);
		collectMap.put("beginIndex", beginIndex);
		
		List<CollectCafeVO> collectList = myService.viewMyCollect(collectMap);
		model.addAttribute("collects", collectList);
		
		List<CafeVO> cafeList = myService.viewCafeList2(collectList);
		model.addAttribute("cafeList", cafeList);
		
		List<CafeRateVO> cafeRateList = myService.viewCafeRate2(collectList);
		model.addAttribute("cafeRateList", cafeRateList);
		return "mypage/myCollectAjax";
	}
	
	
	
	
	
}
