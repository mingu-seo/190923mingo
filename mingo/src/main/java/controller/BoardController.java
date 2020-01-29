package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import service.BoardService;
import vo.BoardVO;
import vo.BoardCommentVO;

@Controller
public class BoardController {

	@Autowired
	BoardService boardService;
	
	@RequestMapping("/listBoard.do")
	public String listBoard(Model model, BoardVO vo) { // model(값을 담아둘 공간), 커맨드객체
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
	@RequestMapping("/writeBoard.do")
	public String writeBoard() {
		
		return "board/boardWrite";
	}
	@RequestMapping("/writeFormBoard.do")
	public String writeFormBoard(BoardVO vo) {
		 boardService.insert(vo);
		
		 return "redirect:listBoard.do";
	}
	@RequestMapping("/viewBoard.do")
	public String viewBoard(Model model, @RequestParam("board_id") int board_id, @RequestParam("page")int page
			,BoardCommentVO cvo) {
		BoardVO data = boardService.detail(board_id);
		List<BoardCommentVO> clist = boardService.clist(cvo);
		model.addAttribute("data",data);
		model.addAttribute("page",page);
		model.addAttribute("clist",clist);
		model.addAttribute("cvo",cvo);
		
		return "board/boardDetail";
	}
	@RequestMapping("/writeComment.do")
	public String writeComment(Model model, BoardCommentVO cvo,BoardVO vo) {
		 boardService.writeComment(cvo);
		 model.addAttribute("vo", vo);
		model.addAttribute(cvo);
		 return "redirect:viewBoard.do?board_id="+vo.getBoard_id()+"&page="+vo.getPage();
	}
	@RequestMapping("/replyProcess.do")
	public String replyProcess(Model model, BoardCommentVO cvo, BoardVO vo) {
		 boardService.replyProcess(cvo);
		model.addAttribute("cvo",cvo);
		return "redirect:viewBoard.do?board_id="+vo.getBoard_id()+"&page="+vo.getPage();
		
	}
	@RequestMapping("/editBoard.do")
	public String editBoard(Model model, @RequestParam("board_id") int board_id) {
		 BoardVO vo = boardService.view(board_id);
		 model.addAttribute("vo",vo);
		 
		 return "board/boardEdit";
	}
	@RequestMapping("/updateBoard.do")
	public String updateBoard(Model model, BoardVO vo) {
		 boardService.update(vo);
		model.addAttribute("vo",vo);
		return "redirect:listBoard.do";
	}
	@RequestMapping("deleteBoard.do")
	public String deleteBoard(BoardVO vo) {
		boardService.delete(vo.getBoard_id());
		
		return "redirect:listBoard.do";
	}
	@RequestMapping("replyDeleteBoard.do")
	public String replyDeleteBoard(BoardVO vo, BoardCommentVO cvo) {
		boardService.replyDelete(cvo.getBoard_comment_id());
		//보드아이디 vo에서 가져와야함 널임.
		return "redirect:viewBoard.do?board_id="+vo.getBoard_id()+"&page="+vo.getPage();
	}
	
}
