package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.BoardService;
import vo.BoardVO;

@Controller
public class BoardController {

	@Autowired
	BoardService boardService;
	
	@RequestMapping("/list.do")
	public String list(Model model, BoardVO vo) { // model(값을 담아둘 공간), 커맨드객체
		// 서비스 호출
		int[] listcount = boardService.boardCount();	// 전체 갯수와 총페이지수
		List<BoardVO> list = boardService.list(vo);
		
		// 모델에 저장
		model.addAttribute("listcount", listcount[0]);
		model.addAttribute("totalpage", listcount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);
		
		return "board/boardMain";
	}
}
