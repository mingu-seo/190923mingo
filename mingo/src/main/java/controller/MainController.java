package controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.BoardDAO;
import dao.MainDAO;
import vo.BoardVO;
import vo.CafeCommand;
import vo.CafeVO;
import vo.PageInfo;

@Controller
public class MainController {

	@Autowired
	MainDAO dao;
	
	@Autowired
	BoardDAO bDao;
	//메인으로 이동
	@RequestMapping("/goMain.do")
	public String goMain(Model model) {
		List<BoardVO> boardList = dao.getBoardList(1);
		List<BoardVO> boardList2 = dao.getBoardList(2);
		
		
		List<Map> reviewList = dao.getReviewList();
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("boardList",boardList);
		model.addAttribute("boardList2",boardList2);
		return "main/main";
	}
	
	//로그인 페이지로 이동
	@RequestMapping("/goLoginForm.do")
	public String goLoginForm() {
		
		return "login/loginForm";
	}
	
	
	
	//랭킹 통계 페이지로 이동
	@RequestMapping("/rankCafe.do")
	public String rankCafe(Model model) {
		
		List<String> sidoList = dao.getSidoList();
		model.addAttribute("sidoList", sidoList);
		return "rank/rankMain";
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
	
	//카페 검색했을때 메서드
	@RequestMapping("/searchCafe.do")
	public String searchCafe(Model model, CafeCommand cafeCommand) {
		List<CafeVO> cafeList = new ArrayList<CafeVO>();
		int page=1;
		int limit=8;
		int listCount = dao.getCafeListCount(cafeCommand);
		cafeCommand.setPage(page);
		cafeCommand.setLimit(limit);
		cafeList = dao.getCafeList(cafeCommand );
		
		
		int maxPage = listCount/limit;
		if(listCount % limit > 0) maxPage++;
		
		
		PageInfo cPageInfo = new PageInfo();
		cPageInfo.setListCount(listCount);
		cPageInfo.setMaxPage(maxPage);
		cPageInfo.setPage(page);
		
		
		model.addAttribute("cPageInfo",cPageInfo);
		model.addAttribute("cafeList", cafeList);
		return "cafe/searchResult";
	}
	
	//카페 검색 by Ajax
	@RequestMapping("/searchCafeAjax.do")
	public String searchCafeAjax(Model model, CafeCommand cafeCommand) {
		List<CafeVO> cafeList = new ArrayList<CafeVO>(); //카페 담기위한 리스트
		
		int page = cafeCommand.getPage();
		int startrow = (page-1) * 8;
		cafeCommand.setStartrow(startrow);
		cafeList = dao.getCafeList(cafeCommand);
		model.addAttribute("cafeList", cafeList);  
		return "ajax/cafeList";
	}
	
	//메인화면에서 종합순위 부분 Ajax
	@RequestMapping("/rankCafeAjax.do")
	public String rankCafeAjax(Model model,CafeCommand cafeCommand) {
		
		//필터로 sql 검색하여 5개씩 리스트로 받아옴
		List<CafeVO> rankList = dao.getCafeList2(cafeCommand);
		model.addAttribute("rankList", rankList);  
		return "ajax/rankList";
	}
	
	
	
	
}
