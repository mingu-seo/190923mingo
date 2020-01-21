package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	@RequestMapping("/write.do")
	public String write() {
		return "board/boardWrite";
	}
	@RequestMapping("/writeForm.do")
	public String writeForm(BoardVO vo) {
		 boardService.insert(vo);
		return "redirect:list.do";
	}
	@RequestMapping("/view.do")
	public String view(Model model, @RequestParam("board_id") int board_id, @RequestParam("page")int page) {
		BoardVO vo = boardService.view(board_id);
		model.addAttribute("vo",vo);
		model.addAttribute("page",page);
		return "board/boardDetail";
	}
	@RequestMapping("/edit.do")
	public String edit(Model model, @RequestParam("board_id") int board_id) {
		 BoardVO vo = boardService.view(board_id);
		 model.addAttribute("vo",vo);
		 return "board/boardEdit";
	}
	@RequestMapping("/update.do")
	public String update(Model model, BoardVO vo) {
		int r = boardService.update(vo);
		String msg = "";
		String url = "";
		if( r > 0) {
			msg = "정상적으로 수정되었습니다.";
			url = "list.do?page="+vo.getPage();
		}else {
			msg = "수정 중 에러가 발생했습니다. 관리자에게 문의하세요.";
			url = "update.do?board_num="+vo.getBoard_id();
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "include/alert";
	}
	@RequestMapping("board/delete.do")
	public String delete(Model model,BoardVO vo) {
		int r = boardService.delete(vo.getBoard_id());
		String msg = ""; 
		String url = "";
		if( r < 0) {
			msg = "정상적으로 삭제되었습니다.";
			url = "list.do?page="+vo.getPage();
		}else {
			msg = "삭제 중 에러가 발생했습니다. 관리자에게 문의하세요.";
			url = "write.do?board_id="+vo.getBoard_id();
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "include/alert";
		
	}
}
