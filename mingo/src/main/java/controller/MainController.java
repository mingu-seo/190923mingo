package controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.MainDAO;
import vo.CafeVO;

@Controller
public class MainController {

	@Autowired
	MainDAO dao;
	//메인으로 이동
	@RequestMapping("/goMain.do")
	public String goMain(Model model) {
		
		return "main/main";
	}
	
	//로그인 페이지로 이동
	@RequestMapping("/goLoginForm.do")
	public String goLoginForm() {
		
		return "login/loginMain";
	}
	
	
	
	//랭킹 통계 페이지로 이동
	@RequestMapping("/rankCafe.do")
	public String rankCafe() {
		return "rank/rankMain";
	}
	//게시판으로 이동
	@RequestMapping("/listBoard.do")
	public String listBoard() {
		return "board/boardMain";
	}
	
	//시도 셀렉트 했을때 시군구 동적으로 변경
	@RequestMapping("/getSigungu.do")
	public String getSigungu(Model model, @RequestParam("sido_code") int sido_code) {
		List<Map> list = dao.getSigunguList(sido_code);
		model.addAttribute("list", list);
		return "ajax/sigungu";
	}
	
	//시군구 셀렉트 했을때 행정동 동적으로 변경
	@RequestMapping("/getDong.do")
	public String getDong(Model model, @RequestParam("sigungu_code") int sigungu_code) {
		List<Map> list = dao.getDongList(sigungu_code);
		model.addAttribute("list", list);
		return "ajax/sigungu";
	}
	
	//메인페이지에서 카페 검색했을때
	@RequestMapping("/searchCafe.do")
	public String searchCafe(Model model, CafeVO cafeTmp) {
		
		//cafe 객체에 들어온 코드 3개와 이름  총 4개로 sql 검색하여 8개씩 리스트로 받아옴
		List<CafeVO> cafeList = dao.getCafeList(cafeTmp);
		
		//모델 객체에 넣고 리턴
		model.addAttribute("cafeList", cafeList);  
		return "cafe/searchResult";
	}
	
}
