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
	
	@RequestMapping("/controller/index.do")
	public String boardIndex(Model model, BoardVO vo) { // model(값을 담아둘 공간), 커맨드객체
		// 서비스 호출
		int[] listcount = boardService.boardCount();	// 전체 갯수와 총페이지수
		List<BoardVO> list = boardService.boardIndex(vo);
		
		// 모델이 저장(뷰에서 쓸려고)
		model.addAttribute("listcount", listcount[0]);
		model.addAttribute("totalpage", listcount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);
		
		return "hong/boardMain";
	}
}
