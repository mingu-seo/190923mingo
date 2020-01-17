package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	
	@RequestMapping("/cafeDetailRegistForm.do")
	public String cafeDetailRegistForm() {
		return "cafe/cafeDetailRegistForm";
	}
	@RequestMapping("/reviewRegistForm.do")
	public String reviewRegistForm() {
		return "cafe/reviewRegistForm";
	}  
	
	
	

	@RequestMapping("/cafeDetailRegist.do")
	public String registCafeDetail(CafeImageVO vo, MultipartHttpServletRequest request) {  
		List<MultipartFile> fileList = request.getFiles("cafeImage_file");
		int result = detailService.insertCafeImages(vo, fileList,request);
		return "redirect:/detailView.do?cafe_id="+vo.getCafe_id(); 
	}  
	 
	
	
	
	  
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
