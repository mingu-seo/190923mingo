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
import vo.CafeImageVO;
import vo.CafeVO;

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
		
		// 사진 조회
		List<CafeImageVO> imgList = detailService.viewCafeImages(cafe_id);
		model.addAttribute("imgList", imgList);
		return "cafe/cafeDetail";
	}
	
	/**
	 * 사진 등록하는 폼으로가는 메소드
	 */
	@RequestMapping("/cafeDetailRegistForm.do")
	public String cafeDetailRegistForm() {
		return "cafe/cafeDetailRegistForm";
	}
	
	
	/**
	 * 
	 * 사진
	 */
	@RequestMapping("/cafeDetailRegist.do")
	public String registCafeDetail(CafeImageVO vo, MultipartHttpServletRequest request) {  
		
		List<MultipartFile> fileList = request.getFiles("cafe_img_file");
		
		//String cafe_id = request.getParameter("cafe_id");
		
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
