package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.BoardDAO;
import vo.BoardVO;

@Controller
public class AdminController {
	
	@Autowired
	BoardDAO boardDAO;
	
	@RequestMapping("/adminLoginForm.do")
	public String adminLoginForm() {
		return "admin2/adminUserList";
	}
	
	@RequestMapping("/adminMain.do")
	public String adminMain() {
		return "admin2/adminMain";
	}
	
	
	
	//게시판 조회
//	@RequestMapping("/ssss.do")
//	public String listBoarddd() {
//		int[] listcount = boardService.boardCount(vo);	// 전체 갯수와 총페이지수  
//		List<BoardVO> list = boardService.list(vo);
//		
//		//int commentCount = boardService.listCount(board_id);
//		model.addAttribute("listcount", listcount[0]);
//		model.addAttribute("totalpage", listcount[1]);
//		model.addAttribute("list", list);
//		model.addAttribute("vo", vo);
//		model.addAttribute("type",type);
//		
//		model.addAttribute("s1", vo.getS1());
//		model.addAttribute("s2", vo.getS2());
//		model.addAttribute("k", vo.getK());
//		//model.addAttribute("commentCount", commentCount);
//		
//		return "board/boardMain";
//	}

}
