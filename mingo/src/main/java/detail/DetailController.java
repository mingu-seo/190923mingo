package detail;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import vo.Cafe_basicVO;
import vo.Cafe_imageVO;
import vo.UserVO;

@Controller
public class DetailController {
	
    @Autowired private DetailDAO detailDao;
    @Autowired private DetailService detailService;
	 
	@RequestMapping("/detailView.mg")
	public String detailView(Model model, HttpServletRequest request) {
		int cafe_id = Integer.parseInt(request.getParameter("cafe_id"));
		
		
		// 기본정보 조회
		Cafe_basicVO cafe_basicVO = detailService.basicInfoView(cafe_id);   
		model.addAttribute("cafe_basicVO", cafe_basicVO);
		
		// 사진 조회
//		List<Cafe_imageVO> list_cafe_imageVO = detailService.view
		
		return "detail/cafeDetail";
	}
	
	// 여러 장의 사진 등록하는 작업 필요ㄴ
	@RequestMapping("/cafeDetailRegistForm.mg")
	public String cafeDetailRegistForm() {
		return "detail/cafeDetailRegistForm";
	}
	
	@RequestMapping("/cafeDetailRegist.mg")
	public String cafeDetailRegist(Cafe_imageVO vo, @RequestParam("cafe_img_url") MultipartFile file, HttpServletRequest request) {
		String cafe_id = request.getParameter("cafe_id");
		int r = detailService.cafeInsert(vo, file, request);
		return "detailView.mg?cafe_id="+cafe_id;
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
