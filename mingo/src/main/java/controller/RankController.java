package controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.MainDAO;
import dao.RankDAO;

@Controller
public class RankController {
	
	@Autowired
	MainDAO mainDao;
	
	@Autowired
	RankDAO Rankdao;
	
	// 시도 라디오 버튼으로 시군구 리스트 받아오기
	@RequestMapping("/getSigunguRadioList.do")
	public String getSigunguRadioList(Model model, @RequestParam("sido_code") int sido_code) {
		List<Map> sigunguList = mainDao.getSigunguList(sido_code);
		model.addAttribute("sigunguList", sigunguList);
		return "ajax/sigunguRadioList";
	}
	
	@RequestMapping("/getCafeRankList.do")
	public String getCafeRankList() {
		
		return "ajax/cafeRankList";
	}
	
}
