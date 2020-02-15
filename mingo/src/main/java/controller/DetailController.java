package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import dao.DetailDAO;
import service.DetailService;
import vo.CafeFacilitiesVO;
import vo.CafeImageVO;
import vo.CafeMenuVO;
import vo.CafeProductVO;
import vo.CafeRateVO;
import vo.CafeServiceVO;
import vo.CafeVO;
import vo.CollectCafeVO;
import vo.LikeCafeVO;
import vo.ReviewVO;
import vo.UserVO;

@Controller
public class DetailController {
	
    @Autowired private DetailDAO detailDao;
    @Autowired private DetailService detailService;
	
    // 카페 정보 조회
	@RequestMapping("/detailView.do")
	public String detailView(Model model, HttpServletRequest request) {
		int cafe_id = Integer.parseInt(request.getParameter("cafe_id"));
		
		HttpSession session = request.getSession();
		UserVO vo1 = (UserVO) session.getAttribute("userVO");
		
		if(vo1!=null) {
			int user_id = vo1.getUser_id();
			//좋아요 상태 조회
			Map<String, Integer> map1 = new HashMap<String, Integer>();  
			map1.put("user_id", user_id);
			map1.put("cafe_id", cafe_id);
			int likeCafe = detailService.viewLikeCafe(map1);
			model.addAttribute("likeCafe", likeCafe);
			
			//카페 찜 상태 조회
			Map<String, Integer> map2 = new HashMap<String, Integer>();  
			map2.put("user_id", user_id);
			map2.put("cafe_id", cafe_id);
			int collectCafe = detailService.viewCollectCafe(map2);
			model.addAttribute("collectCafe", collectCafe);
		}
		
		
		
		// 기본정보 조회
		CafeVO cafe = detailService.viewCafe(cafe_id);   
		model.addAttribute("cafe", cafe);
		
		//메뉴 조회
		List<CafeMenuVO> menu = detailService.viewMenu(cafe_id);
		if(menu.size()==0) {
			int menu_result = 0;
			model.addAttribute("menu_result", menu_result);
		}
		model.addAttribute("menuList", menu);
		
		//상품 조회
		List<CafeProductVO> product = detailService.viewProduct(cafe_id);
		if(product.size()==0) {
			int product_result = 0;
			model.addAttribute("product_result", product_result);
		}
		model.addAttribute("productList", product);
		
		//서비스 조회
		CafeServiceVO service = detailService.viewService(cafe_id);
		int service_result = 0;
		if(service!=null) {
			service_result = 1;
			model.addAttribute("service_result", service_result);
		}
		
		
		model.addAttribute("service", service);
		
		//시설 및 분위기
		CafeFacilitiesVO facilities = detailService.viewFacilities(cafe_id);
		
		
		model.addAttribute("facilities", facilities);
		
		// 사진 조회
		List<CafeImageVO> imgList = detailService.viewCafeImages(cafe_id);
		if(imgList.size()==0) {
			int image_result = 0;
			model.addAttribute("image_result", image_result);
		}
		model.addAttribute("imgList", imgList);
		
		//종합 평점 조회
		CafeRateVO cafeRate = detailService.viewCafeRate(cafe_id);  
		System.out.println("확인확인"+cafeRate);
		if(cafeRate==null) {
			CafeRateVO cafeRate2 = new CafeRateVO();
			cafeRate2.setCafe_id(cafe_id);
			cafeRate2.setRate_num(0);
			cafeRate2.setClean_avg(0);
			cafeRate2.setMood_avg(0);
			cafeRate2.setWifi_avg(0);
			cafeRate2.setPrice_avg(0);
			cafeRate2.setTaste_avg(0);
			cafeRate2.setService_avg(0);
			cafeRate2.setCafe_total_avg(0);
			model.addAttribute("cafeRate", cafeRate2);
		} else {
			model.addAttribute("cafeRate", cafeRate);
		}
		return "cafe/cafeDetail";
	}
	
	// 내 리뷰만 조회
	@RequestMapping("/viewMyReviewForm.do")
	public String viewMyReviewForm(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO vo1 = (UserVO) session.getAttribute("userVO");
		int user_id = vo1.getUser_id();
		int cafe_id = Integer.parseInt(request.getParameter("cafe_id"));
		ReviewVO vo = new ReviewVO();
		vo.setUser_id(user_id);
		vo.setCafe_id(cafe_id);
		ReviewVO reviewVO = detailService.viewMyReview2(vo);
		model.addAttribute("reviewVO", reviewVO);
		return "cafe/viewMyReviewForm";	
	}
	
	// 리뷰 조회
	@RequestMapping("/reviewViewForm.do")
	public String reviewViewForm(Model model, HttpServletRequest request) {
		int cafe_id = Integer.parseInt(request.getParameter("cafe_id"));
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		CafeRateVO cafeRate = detailService.viewCafeRate(cafe_id);   
		model.addAttribute("cafeRate", cafeRate);
		
		int maxPage = (cafeRate.getRate_num()-1)/5+1;
		int beginIndex = (currentPage-1)*5;
		int beginPage = ((currentPage-1)/5)*5+1;
		int endPage;
		if(maxPage-currentPage<4) {  
			endPage = maxPage;/*((currentPage-1)/5)+maxPage-beginPage+1*/	
		} else {
			endPage = ((currentPage-1)/5)+5;
		}
		
		System.out.println("최대: " +maxPage+ ".../...현재 :" +currentPage+ ".../...시작 : " + beginPage + ".../...마지막 : " +endPage );
		
		Map<String, Integer> reviewMap = new HashMap<String, Integer>();
		reviewMap.put("currentPage", currentPage);
		reviewMap.put("cafe_id", cafe_id);
		reviewMap.put("beginIndex", beginIndex);
	
		List<ReviewVO> reviewList = detailService.viewCafeReview(reviewMap);
		int[] userList = new int[reviewList.size()];  
		for (int i=0; i<reviewList.size(); i++) {
			userList[i] = reviewList.get(i).getUser_id();
		}
		model.addAttribute("reviewList", reviewList);
		
		List<UserVO> reviewUsers = detailService.viewUserList(userList);
		model.addAttribute("reviewUsers", reviewUsers);
		
		model.addAttribute("maxPage", maxPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("beginPage", beginPage);
		model.addAttribute("endPage", endPage);	
	   
		return "cafe/reviewViewForm";
	}
	
	// 카페 수정 양식으로 이동      
	@RequestMapping("/cafeModifyForm.do")
	public String cafeDetailModifyForm(Model model, HttpServletRequest request) {
		int cafe_id = Integer.parseInt(request.getParameter("cafe_id"));
		
		// 기본정보 조회
		CafeVO cafe = detailService.viewCafe(cafe_id);   
		model.addAttribute("cafe", cafe);
		
		//메뉴 조회
		List<CafeMenuVO> menu = detailService.viewMenu(cafe_id);   
		model.addAttribute("menuList", menu);
		
		//상품 조회
		List<CafeProductVO> product = detailService.viewProduct(cafe_id);   
		model.addAttribute("productList", product);
		
		//서비스 조회
		CafeServiceVO service = detailService.viewService(cafe_id);
		model.addAttribute("service", service);
		
		//시설 및 분위기
		CafeFacilitiesVO facilities = detailService.viewFacilities(cafe_id);
		model.addAttribute("facilities", facilities);
		
		// 사진 조회
		List<CafeImageVO> imgList = detailService.viewCafeImages(cafe_id);
		model.addAttribute("imgList", imgList);
		
		model.addAttribute("cafe_id", cafe_id);
		return "mypage/cafeModifyForm";
	}
	
	//카페 정보 수정
	@RequestMapping("/modifyCafe.do")
	public String modifyCafe(Model model, CafeVO cafeVO, CafeFacilitiesVO cafeFacilitiesVO, CafeServiceVO cafeServiceVO, CafeImageVO cafeImageVO, MultipartHttpServletRequest request, HttpServletResponse response) {

		//로고 사진 및 카페기본정보 수정
		List<MultipartFile> logoFile = request.getFiles("logo_file");
		int result1 = detailService.modifyCafe(cafeVO, logoFile, request);
		
		//시설 정보 수정
		int result2 = detailService.modifyFacility(cafeFacilitiesVO);	
		
		//서비스 정보 수정
		int result3 = detailService.modifyService(cafeServiceVO);

		//카페 사진 수정     <---- String to file 추가 요망
		List<MultipartFile> fileList = request.getFiles("cafeImage_file");
		int result6 = detailService.modifyCafeImages(cafeImageVO, fileList, request);
		
		//메뉴 사진 및 정보 수정   <---- String to file 추가 요망
		List<CafeMenuVO> cafeMenuVO = new ArrayList<CafeMenuVO>();
		CafeMenuVO vo2 = new CafeMenuVO();
		cafeMenuVO.add(vo2);
		List<MultipartFile> menuFileList = request.getFiles("menu_image_file");
		int result4 = detailService.modifyMenu(cafeMenuVO, menuFileList, request);
		
		//상품 사진 및 정보 수정  <---- String to file 추가 요망
		List<CafeProductVO> cafeProductVO = new ArrayList<CafeProductVO>();
		CafeProductVO vo3 = new CafeProductVO();
		cafeProductVO.add(vo3);
		List<MultipartFile> productFileList = request.getFiles("product_image_file");
		int result5 = detailService.modifyProduct(cafeProductVO, productFileList, request);
		
		model.addAttribute("cafe_id", cafeVO.getCafe_id());
		//request.setAttribute("cafe_id", cafeVO.getCafe_id());
		System.out.println("카페 정보 수정 완료");
		return "redirect:detailView.do";
	}
	
	
	//등록 양식으로 이동
	@RequestMapping("/cafeRegistForm.do")
	public String cafeDetailRegistForm(Model model, HttpServletRequest request) {
	
		int cafe_id = Integer.parseInt(request.getParameter("cafe_id"));
		model.addAttribute("cafe_id", cafe_id);
		
		return "mypage/cafeRegistForm";
	}
	
	// 카페 정보 등록
	@RequestMapping("/registCafe.do")
	public String registCafe(Model model, CafeVO cafeVO, CafeFacilitiesVO cafeFacilitiesVO, CafeServiceVO cafeServiceVO, CafeImageVO cafeImageVO, MultipartHttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("전달 받은 카페 아이디 : "+cafeVO.getCafe_id());
		
		//로고 사진 및 카페기본정보 등록
		List<MultipartFile> logoFile = request.getFiles("logo_file");
		int result1 = detailService.registCafe(cafeVO, logoFile, request);
		
		//시설 정보 등록
		int result2 = detailService.registFacility(cafeFacilitiesVO);	
		
		//서비스 정보 등록
		int result3 = detailService.registService(cafeServiceVO);

		//카페 사진 등록
		List<MultipartFile> fileList = request.getFiles("cafeImage_file");
		int result6 = detailService.insertCafeImages(cafeImageVO, fileList, request);
		
		//메뉴 사진 및 정보 등록
		List<CafeMenuVO> cafeMenuVO = new ArrayList<CafeMenuVO>();
		CafeMenuVO vo2 = new CafeMenuVO(); cafeMenuVO.add(vo2);
		List<MultipartFile> menuFileList = request.getFiles("menu_image_file");
		int result4 = detailService.registMenu(cafeMenuVO, menuFileList, request);
		
		//상품 사진 및 정보 등록
		List<CafeProductVO> cafeProductVO = new ArrayList<CafeProductVO>();
		CafeProductVO vo3 = new CafeProductVO();
		cafeProductVO.add(vo3);
		List<MultipartFile> productFileList = request.getFiles("product_image_file");
		int result5 = detailService.registProduct(cafeProductVO, productFileList, request);
	
		model.addAttribute("cafe_id", cafeVO.getCafe_id());
		//request.setAttribute("cafe_id", cafeVO.getCafe_id());
		System.out.println("카페 정보 등록 완료");
		return "redirect:detailView.do";
	}
	
	/*
	@RequestMapping("/reviewRegistForm.do")
	public String reviewRegistForm() {
		return "cafe/reviewRegistForm";
	} */ 
	
	//카페 정보 삭제
	@RequestMapping("/deleteCafeInfo.do")
	public String deleteCafeInfo(Model model, HttpServletRequest request) {
		int cafe_id = Integer.parseInt(request.getParameter("cafe_id"));
		int r = detailService.deleteCafeInfo(cafe_id);
		model.addAttribute("cafe_id", cafe_id);
		return "redirect:detailView.do";
	}
	
	
	// 리뷰 등록 폼으로 이동
	@RequestMapping("/registReviewForm.do")
	public String registReviewForm(Model model, HttpServletRequest request) {
		int cafe_id = Integer.parseInt(request.getParameter("cafe_id"));
		model.addAttribute("cafe_id", cafe_id);
		//return "cafe/index";
		
		return "cafe/reviewRegistForm";
	}     
	
	//리뷰 등록
	@RequestMapping("/registReview.do")   
	public String registReview(Model model, ReviewVO vo, @RequestParam("image_file") MultipartFile file, HttpServletRequest request) {
		CafeRateVO cafeRate = detailService.viewCafeRate(vo.getCafe_id());  
		
		detailService.registReview(vo, file, request, cafeRate);
		return "redirect:detailView.do?cafe_id="+vo.getCafe_id();
	} 
	
	//리뷰 등록 여부 확인
	@RequestMapping("/checkReview.do")   
	public String checkReview(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO vo1 = (UserVO) session.getAttribute("userVO");
		int user_id = vo1.getUser_id();
		int cafe_id = Integer.parseInt(request.getParameter("cafe_id"));
		ReviewVO vo = new ReviewVO();
		vo.setUser_id(user_id);
		vo.setCafe_id(cafe_id);
		ReviewVO reviewVO = detailService.viewMyReview2(vo);
		
		int checkReview = 0;
		if(reviewVO != null) {
			checkReview = 1;
		}
		model.addAttribute("checkReview", checkReview);
		return "cafe/detailAjax";
	} 
	

	//리뷰 수정     <---- String to file 추가 요망
	@RequestMapping("/modifyReviewForm.do")   
	public String modifyReviewForm(Model model, ReviewVO vo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO vo1 = (UserVO) session.getAttribute("userVO");
		vo.setUser_id(vo1.getUser_id());
		
		int cafe_id = Integer.parseInt(request.getParameter("cafe_id"));
		vo.setCafe_id(cafe_id);
		
		ReviewVO reviewVO = detailService.viewReview(vo);
		model.addAttribute("reviewVO", reviewVO);
		return "cafe/reviewModifyForm";
	} 
	
	@RequestMapping("/modifyReview.do")   
	public String modifyReview(Model model, ReviewVO vo_new, @RequestParam("image_file") MultipartFile file, HttpServletRequest request) {
		CafeRateVO cafeRate = detailService.viewCafeRate(vo_new.getCafe_id());  
		ReviewVO vo_empty = new ReviewVO();
		vo_empty.setCafe_id(vo_new.getCafe_id());
		vo_empty.setUser_id(vo_new.getUser_id());
		ReviewVO vo_old = detailService.viewReview(vo_empty);  
		detailService.modifyReview(vo_old, vo_new, file, request, cafeRate);
		return "redirect:detailView.do?cafe_id="+vo_new.getCafe_id();
	} 
	
	// 리뷰 삭제
	@RequestMapping("/deleteReview.do")   
	public String deleteReview(CafeRateVO cafeRateVO, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO vo1 = (UserVO) session.getAttribute("userVO");
		int user_id = vo1.getUser_id();
		int cafe_id = Integer.parseInt(request.getParameter("cafe_id"));
		
		CafeRateVO cafeRate = detailService.viewCafeRate(cafe_id);  
		ReviewVO vo_empty = new ReviewVO();
		vo_empty.setCafe_id(cafe_id);
		vo_empty.setUser_id(user_id);
		ReviewVO reviewVO = detailService.viewReview(vo_empty);  
		
		detailService.deleteReview(cafeRateVO, reviewVO);
		
		return "redirect:detailView.do?cafe_id="+cafe_id;
	}  
	// 카페 좋아요 등록
	@RequestMapping("/registLike.do")   
	public String registLike(LikeCafeVO vo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO vo1 = (UserVO) session.getAttribute("userVO");
		vo.setUser_id(vo1.getUser_id());
		int cafe_id = Integer.parseInt(request.getParameter("cafe_id"));
		vo.setCafe_id(cafe_id);
		detailService.registLike(vo);
		return "redirect:detailView.do?cafe_id="+cafe_id;
	} 
	
	//카페 좋아요 삭제
	@RequestMapping("/deleteLike.do")   
	public String deleteLike(LikeCafeVO vo, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		UserVO vo1 = (UserVO) session.getAttribute("userVO");
		vo.setUser_id(vo1.getUser_id());
		
		int cafe_id = Integer.parseInt(request.getParameter("cafe_id"));
		vo.setCafe_id(cafe_id);
		
		detailService.deleteLike(vo);
		
		return "redirect:detailView.do?cafe_id="+cafe_id;
	} 
	// 카페 찜 등록
	@RequestMapping("/registCollect.do")   
	public String registCollect(CollectCafeVO vo, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		UserVO vo1 = (UserVO) session.getAttribute("userVO");
		vo.setUser_id(vo1.getUser_id());
		
		int cafe_id = Integer.parseInt(request.getParameter("cafe_id"));
		vo.setCafe_id(cafe_id);
		
		detailService.registCollect(vo);
		
		return "redirect:detailView.do?cafe_id="+cafe_id;
	} 
	
	//카페 찜 삭제
	@RequestMapping("/deleteCollect.do")   
	public String deleteCollect(CollectCafeVO vo, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		UserVO vo1 = (UserVO) session.getAttribute("userVO");
		vo.setUser_id(vo1.getUser_id());
		
		int cafe_id = Integer.parseInt(request.getParameter("cafe_id"));
		vo.setCafe_id(cafe_id);
		
		detailService.deleteCollect(vo);
		
		return "redirect:detailView.do?cafe_id="+cafe_id;
	} 
	
	
	/*
	@RequestMapping("/cafeDetailRegist.do")
	public String registCafeDetail(CafeImageVO vo, MultipartHttpServletRequest request) {  
		List<MultipartFile> fileList = request.getFiles("cafeImage_file");
		int result = detailService.insertCafeImages(vo, fileList, request);
		return "redirect:/detailView.do?cafe_id="+vo.getCafe_id(); 
	}*/ 
	  
	/*
	 * @RequestMapping("/memberList.do") public String memberList(Model model,
	 * HttpServletRequest req,
	 * 
	 * @RequestParam(value="email", required = false) String email, TestVO vo) {
	 * 
	 * 리퀘스트 값 받는 방법 - HttpServletRequest - @RequestParam - Command 객체로
	 * 
	 * System.out.println("requst:"+req.getParameter("email"));
	 * System.out.println("RequestParam:"+email);
	 * System.out.println("Command:"+vo.getEmail()); // 정태기가 수정
	 * 
	 * List<TestVO> list = testDao.memberList(vo); model.addAttribute("list", list);
	 * return "memberList"; }
	 */

}
