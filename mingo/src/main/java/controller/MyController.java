package controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import dao.MyDAO;
import service.MyService;
import util.FileUtil;
import vo.BoardVO;
import vo.CafeRateVO;
import vo.CafeVO;
import vo.CollectCafeVO;
import vo.PageInfo;
import vo.ReviewVO;
import vo.UserCommand;
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
		UserVO userVO = myService.viewUserInfo(user_id); //userVO객체
		String password = request.getParameter("password"); // raw 비밀번호(전달된 비번)
		
		Map idPwd = new HashMap<String, String>();
		idPwd.put("id", user_id);
		idPwd.put("pwd", password);
		
		int result=0;
		if( myDao.findUser(idPwd) != null) {
			result=1;
		};
//		String dbPwd = userVO.getPassword(); //encoding된 암호(원래 비번)
//		
//		if(password.equals(dbPwd)) {
//			result=1;
//		} else{
//			result=0; 
//		}
		model.addAttribute("userVO", userVO);
		model.addAttribute("pwdResult", result);
		return "mypage/myAjax"; 
	}
	@RequestMapping("/myUserModifyPassword.do")
	public String myUserModifyPassword( HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO vo = (UserVO) session.getAttribute("userVO");
		vo.setPassword(request.getParameter("password"));
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
	
	
	@RequestMapping("/myCafe.do")
	public String myCafe(Model model, UserVO vo, HttpServletRequest request) {
		return "mypage/myMyCafe";
	}
	@RequestMapping("/myCafeAjax.do")
	public String myCafeAjax(Model model, UserVO vo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO vo1 = (UserVO) session.getAttribute("userVO");
		int user_id = vo1.getUser_id();
		String url;	
		
		// 기본정보 조회  
		CafeVO cafe = myService.viewCafe(user_id);
		if(cafe != null) {
			model.addAttribute("cafe", cafe);
			//종합 평점 조회
			int cafe_id = cafe.getCafe_id();
			CafeRateVO cafeRate = myService.viewCafeRate(cafe_id);   
			model.addAttribute("cafeRate", cafeRate);
			url = "mypage/myCafeAjax";
		} else {
			url = "mypage/myCafeRegistAjax";
		}

		return url;
	}
	
	@RequestMapping("/cafeMenuForm.do")
	public String cafeMenuForm(HttpServletRequest request, Model model) {
		model.addAttribute("menu_num", request.getParameter("menu_num"));
		System.out.println("메뉴 추가 실행!!");
		return "mypage/cafeMenuForm";   
	}  
	@RequestMapping("/cafeProductForm.do")
	public String cafeProductForm(HttpServletRequest request, Model model) {
		model.addAttribute("product_num", request.getParameter("product_num"));
		System.out.println("상품 추가 실행!!");
		return "mypage/cafeProductForm";   
	}  
	@RequestMapping("/cafeCafeImageForm.do")
	public String cafeCafeImageForm(HttpServletRequest request, Model model) {
		model.addAttribute("cafeImage_num", request.getParameter("cafeImage_num"));
		System.out.println("사진 추가 실행!!");
		return "mypage/cafeImageForm";   
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
		System.out.println("유저아이디 : " + user_id);
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		int myReview_num = myService.countMyReview(user_id);
		System.out.println("내 리뷰 개수 : " + myReview_num);
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
	public String updateUserForm(Model model,HttpSession session) {
		if(session.getAttribute("userVO") != null) {
			UserVO vo = (UserVO) session.getAttribute("userVO");
			model.addAttribute("userVO",vo);
			return "mypage/myModifyUserForm";
		}else {
			return "redirect:/goMain.do";
		}
		
	}
	@RequestMapping("/modifyUser.do")
	public String updateUser(Model model,@RequestParam(required = false, value="profile_img")MultipartFile file ,UserVO vo,HttpServletRequest request,HttpSession session) {
		//profile_img, email, nickname, name,birthday, gender, post_code,jibun_address,detail_address, phone_num
		
		//유저가 파일을 선택안하면 file은 널이 아니지만 empty다
		if( file ==null) {
			System.out.println("file널입니다.");
		}else {
			System.out.println("file널 아닙니다.");
		}
		
		if( file.isEmpty()) {
			System.out.println("file is empty");
		}else {
			System.out.println("file is not empty");
		}
		
		if(session.getAttribute("userVO") != null) {
			UserVO uservo = (UserVO)session.getAttribute("userVO");
			
			/* 파일 이름이 공백이 아닐때만 업로드 함 */
			if(!file.isEmpty()) {
				String path = request.getRealPath("/upload");
				FileUtil fu = new FileUtil();
				fu.fileUpload(file, path+"/user/");
				vo.setProfile_image(fu.fileName);
			}else {
				vo.setProfile_image(uservo.getProfile_image());
			}
			vo.setUser_id(uservo.getUser_id());
			
			int result = myDao.modifyMember(vo);
			
			/* 멤버 수정하고 나서 세션에 있는 userVO 업데이트 해줌 */
			session.removeAttribute("userVO");
			UserVO uv = myDao.viewUserInfo( uservo.getUser_id());
			session.setAttribute("userVO", uv);
			
			return "redirect:/myMain.do";
		}
		return "redirect:/myMain.do";
	}
	@RequestMapping("/myMain.do")
	public String myMain(Model model,HttpSession session) {
		UserVO userVO=null;
		if(session.getAttribute("userVO") != null) {
			userVO = (UserVO)session.getAttribute("userVO");
			model.addAttribute("userVO",userVO);
			System.out.println(userVO);
			return "mypage/myUserInfo"; 
			
		}else {
			return "redirect:/goMain.do";
		}
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
	public String myPost(Model model, @RequestParam(required = false, value="page") Integer page, HttpSession session) {
		
		UserVO user = null;
		int user_id = -1;
		if( session.getAttribute("userVO") !=null) {
			user = (UserVO)session.getAttribute("userVO");
			user_id = user.getUser_id();
		}

		if(page == null) {
			page =1;
		}

		/* 객체 생성 */
		List<BoardVO> boardList = new ArrayList<BoardVO>();

		/* 리밋 설정 */
		int limit = 10;

		/* startrow 설정 */
		int startrow = (page - 1) * limit;

		/* 총 리스트 수를 받아옴 */
		int listCount = myDao.countMyPost(user_id);

		/* 회원 목록 가져옴 */
		HashMap tmp = new HashMap();
		tmp.put("startrow", startrow);
		tmp.put("limit", limit);
		tmp.put("user_id", user_id);
		boardList = myDao.getMyBoardList(tmp);

		/* 페이지 정보 계산 */
		int maxPage = listCount / limit;
		if (listCount % limit > 0)
			maxPage++;
		int startPage = (page - 1) / 10 * 10 + 1;
		int endPage = startPage + 10 - 1;
		if (endPage > maxPage)
			endPage = maxPage;

		PageInfo pageInfo = new PageInfo();
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);

		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("boardList", boardList);
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
	public String myCollect(Model model, @RequestParam(required = false, value="page") Integer page, HttpSession session) {
		
		/* 유저 아이디 지정 없을경우 -1 */
		UserVO user = null;
		int user_id = -1;
		if( session.getAttribute("userVO") !=null) {
			user = (UserVO)session.getAttribute("userVO");
			user_id = user.getUser_id();
		}

		if(page == null) {
			page =1;
		}

		/* 객체 생성 */
		List<Map> cafeList = new ArrayList<Map>();

		/* 리밋 설정 */
		int limit = 10;

		/* startrow 설정 */
		int startrow = (page - 1) * limit;

		/* 총 리스트 수를 받아옴 */
		int listCount = myDao.countMyCollect(user_id);

		/* 회원 목록 가져옴 */
		HashMap tmp = new HashMap();
		tmp.put("startrow", startrow);
		tmp.put("limit", limit);
		tmp.put("user_id", user_id);
		cafeList = myDao.getMyCafeList(tmp);

		/* 페이지 정보 계산 */
		int maxPage = listCount / limit;
		if (listCount % limit > 0)
			maxPage++;
		int startPage = (page - 1) / 10 * 10 + 1;
		int endPage = startPage + 10 - 1;
		if (endPage > maxPage)
			endPage = maxPage;

		PageInfo pageInfo = new PageInfo();
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);

		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("cafeList", cafeList);
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
		
		System.out.println("리뷰가 존재하는 카페 개수 : "+cafeRateList.size());
		System.out.println("카페1  : "+cafeRateList.get(0));
		// 찜한 카페가 1개 이상일 때만   
		List<CafeRateVO> list = new ArrayList<CafeRateVO>();
		if (cafeList.size()>0) {  
			for (int j = 0; j < cafeRateList.size(); j++) {
				System.out.println("카페 : "+cafeRateList.get(j));
				if (cafeRateList.get(j)==null) {
					CafeRateVO rateVO = new CafeRateVO();
					rateVO.setCafe_id(cafeList.get(j).getCafe_id());
					rateVO.setCafe_total_avg(0);
					rateVO.setClean_avg(0);
					rateVO.setMood_avg(0);
					rateVO.setPrice_avg(0);
					rateVO.setService_avg(0);
					rateVO.setTaste_avg(0);
					rateVO.setWifi_avg(0);
					rateVO.setRate_num(0);
					list.add(rateVO);
				} else {
					list.add(cafeRateList.get(j));
				}
			}
		}
		model.addAttribute("cafeRateList", list);
		return "mypage/myCollectAjax";    
	}
	
	
	
	
	
}
