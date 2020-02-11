package controller;

import java.util.HashMap;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.BoardDAO;


@Controller
public class AdminController {
	
	@Autowired
	BoardDAO boardDAO;
	
	@RequestMapping("/adminLoginForm.do")
	public String adminLoginForm() {
		return "admin2/adminLoginForm";
	}
	
	@RequestMapping("/adminMain.do")
	public String adminMain() {
		return "admin2/adminMain";
	}
	@RequestMapping("/adminLoginProcess.do")
	public String adminLoginProcess(Model model,@RequestParam("email")String email, @RequestParam("password")String password,HttpServletRequest request) {
		Map uv = new HashMap<String, String>();
		uv.put("id", "admin");
		uv.put("password", "admin");
		
		if( "admin".equals(email) || "admin".equals(password)) {
			HttpSession session = request.getSession();
			session.setAttribute("admin", uv);

			return "redirect:/adminMain.do";
		}else {
			String msg = "권한이 없습니다.";
			String url = "/adminLoginForm.do";
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "include/alert";
		}
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
