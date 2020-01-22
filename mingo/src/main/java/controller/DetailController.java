package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
import vo.ReviewVO;
import vo.UserVO;

@Controller
public class DetailController {
	
    @Autowired private DetailDAO detailDao;
    @Autowired private DetailService detailService;
	
	@RequestMapping("/detailView.do")
	public String detailView(Model model, HttpServletRequest request) {
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
		
		//리뷰 조회
		List<ReviewVO> reviewList = detailService.viewCafeReview(cafe_id);
		model.addAttribute("reviewList", reviewList);
		int[] userList = new int[reviewList.size()];  
		for (int i=0; i<reviewList.size(); i++) {
			userList[i] = reviewList.get(i).getUser_id();
		}
		List<UserVO> reviewUsers = detailService.viewUserList(userList);
		model.addAttribute("reviewUsers", reviewUsers);
		
		//종합 평점 조회
		CafeRateVO cafeRate = detailService.viewCafeRate(cafe_id);   
		model.addAttribute("cafeRate", cafeRate);
		
		return "cafe/cafeDetail";
	}
	
	// 리뷰 등록 폼으로 이동
	@RequestMapping("/registReviewForm.do")
	public String registReviewForm(Model model, HttpServletRequest request) {
		int cafe_id = Integer.parseInt(request.getParameter("cafe_id"));
		//return "cafe/index";
		return "cafe/reviewRegistForm";
	} 
	    
	@RequestMapping("/registReview.do")
	public String registReview(Model model, ReviewVO vo, MultipartFile file,HttpServletRequest request) {
		CafeRateVO cafeRate = detailService.viewCafeRate(vo.getCafe_id());  
		
		detailService.registReview(vo, file, request, cafeRate);
		return "redirect:detailView.do?cafe_id="+vo.getCafe_id();
	} 
	
	// 수정 양식으로 이동
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
	
	@RequestMapping("/modifyCafe.do")
	public String modifyCafe(Model model, CafeVO cafeVO, CafeFacilitiesVO cafeFacilitiesVO, CafeServiceVO cafeServiceVO, CafeImageVO cafeImageVO, MultipartHttpServletRequest request, HttpServletResponse response) {

		//로고 사진 및 카페기본정보 수정
		List<MultipartFile> logoFile = request.getFiles("logo_file");
		int result1 = detailService.modifyCafe(cafeVO, logoFile, request);
		
		//시설 정보 수정
		int result2 = detailService.modifyFacility(cafeFacilitiesVO);	
		
		//서비스 정보 수정
		int result3 = detailService.modifyService(cafeServiceVO);

		//카페 사진 수정
		List<MultipartFile> fileList = request.getFiles("cafeImage_file");
		int result6 = detailService.modifyCafeImages(cafeImageVO, fileList, request);
		
		//메뉴 사진 및 정보 수정
		List<CafeMenuVO> cafeMenuVO = new ArrayList<CafeMenuVO>();
		CafeMenuVO vo2 = new CafeMenuVO();
		cafeMenuVO.add(vo2);
		List<MultipartFile> menuFileList = request.getFiles("menu_image_file");
		int result4 = detailService.modifyMenu(cafeMenuVO, menuFileList, request);
		
		//상품 사진 및 정보 수정
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
	
	@RequestMapping("/registCafe.do")
	public String registCafe(Model model, CafeVO cafeVO, CafeFacilitiesVO cafeFacilitiesVO, CafeServiceVO cafeServiceVO, CafeImageVO cafeImageVO, MultipartHttpServletRequest request, HttpServletResponse response) {

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
		CafeMenuVO vo2 = new CafeMenuVO();
		cafeMenuVO.add(vo2);
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
	
	@RequestMapping("/deleteCafeInfo.do")
	public String deleteCafeInfo(Model model, HttpServletRequest request) {
		int cafe_id = Integer.parseInt(request.getParameter("cafe_id"));
		int r = detailService.deleteCafeInfo(cafe_id);
		model.addAttribute("cafe_id", cafe_id);
		return "redirect:detailView.do";
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
