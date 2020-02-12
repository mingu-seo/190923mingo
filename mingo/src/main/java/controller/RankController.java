package controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.MainDAO;
import dao.RankDAO;
import vo.PageInfo;
import vo.RankCommand;

@Controller
public class RankController {
	
	@Autowired
	MainDAO mainDao;
	
	@Autowired
	RankDAO rankDao;
	
	// 시도 라디오 버튼으로 시군구 리스트 받아오기
	@RequestMapping("/getSigunguRadioList.do")
	public String getSigunguRadioList(Model model, @RequestParam("sido_code") int sido_code) {
		List<Map> sigunguList = mainDao.getSigunguList(sido_code);
		model.addAttribute("sigunguList", sigunguList);
		return "ajax/sigunguRadioList";
	}
	
	//시군구 라디오 버튼으로 행정동 리스트 받아오기
	@RequestMapping("/getDongRadioList.do")
	public String getDongRadioList(Model model, @RequestParam("sigungu_code") int sigungu_code) {
		List<Map> dongList = mainDao.getDongList(sigungu_code);
		model.addAttribute("dongList", dongList);
		return "ajax/dongRadioList"; 
	}
	@RequestMapping("/getCafeRankList.do")
	public String getCafeRankList(Model model,@RequestParam("page") int page, RankCommand tmp, HttpServletRequest request) {
		// tmp 속성 : sido_code_,sigungu_code, brand_code,sort_code, page(타입 캐스팅 오류로 삭제),limit,startrow
		
		
		List<Map> cafeRankList = new ArrayList<Map>();
		
		/* 리밋 설정 */
		int limit=10;
		
		/* startrow 설정 */
		int startrow = (page-1)*limit;
		
		/* 총 리스트 수를 받아옴 */
		int listCount = rankDao.getCafeRankCount(tmp);
		/* 랭크 목록 가져옴 */
		
		tmp.setStartrow(startrow);
		tmp.setLimit(limit);
		cafeRankList = rankDao.getCafeRankList(tmp);

		/* 페이지 정보 계산 */
		int maxPage = listCount/limit;
		if(listCount % limit > 0) maxPage++;
		int startPage = (page-1)/10 * 10+1;
		int endPage = startPage+10-1;
		if(endPage > maxPage) endPage=maxPage;
		
		PageInfo pageInfo = new PageInfo();
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage); 
		
		
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("items",cafeRankList);
		model.addAttribute("startrow",startrow);
		return "ajax/cafeRankList";
	}
	
	@RequestMapping("/getCafeRankList2.do")
	public String getCafeRankList2(Model model, RankCommand tmp, HttpServletRequest request) {
		// tmp 속성 : sido_code_,sigungu_code, brand_code,sort_code, page,limit,startrow
		
		int page = tmp.getPage();
		List<Map> cafeRankList = new ArrayList<Map>();
		
		/* 리밋 설정 */
		int limit=10;
		
		/* startrow 설정 */
		int startrow = (page-1)*limit;
		
		/* 총 리스트 수를 받아옴 */
		int listCount = rankDao.getCafeRankCount(tmp);
		/* 랭크 목록 가져옴 */
		
		tmp.setStartrow(startrow);
		tmp.setLimit(limit);
		cafeRankList = rankDao.getCafeRankList(tmp);

		/* 페이지 정보 계산 */
		int maxPage = listCount/limit;
		if(listCount % limit > 0) maxPage++;
		int startPage = (page-1)/10 * 10+1;
		int endPage = startPage+10-1;
		if(endPage > maxPage) endPage=maxPage;
		
		PageInfo pageInfo = new PageInfo();
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage); 
		
		
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("items",cafeRankList);
		return "ajax/cafeRankList2";
	}
	
	
	
	
	
}
