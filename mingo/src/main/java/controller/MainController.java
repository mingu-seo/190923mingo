package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.MainDAO;

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
	
	//카페 검색결과 
	@RequestMapping("/listCafe.do")
	public String listCafe() {
		
		
		
		
		return "cafe/searchResult";
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
	
	@RequestMapping("/getSigungu.do")
	public String getSigungu(Model model, @RequestParam("sido_code") int sido_code) {
		List<String> list = dao.getSigunguList(sido_code);
		model.addAttribute("list", list);
		return "ajax/sigungu";
	}
	
	@RequestMapping("/getDong.do")
	public String getDong(Model model, @RequestParam("sigungu_code") int sigungu_code) {
		List<String> list = dao.getDongList(sigungu_code);
		model.addAttribute("list", list);
		return "ajax/sigungu";
	}
	
}
