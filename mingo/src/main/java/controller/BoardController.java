package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import service.BoardService;
import vo.BoardCommentVO;
import vo.BoardVO;
import vo.LikeBoardVO;
import vo.UserVO;

@Controller
public class BoardController {

	@Autowired
	BoardService boardService;
	
	//게시판 조회
	@RequestMapping("/listBoard.do")
	public String listBoard(Model model, BoardVO vo,@RequestParam("type")int type) {
		vo.setType(type);
		int[] listcount = boardService.boardCount(vo.getType());	// 전체 갯수와 총페이지수
		List<BoardVO> list = boardService.list(vo);
		
		//int commentCount = boardService.listCount(board_id);
		
		model.addAttribute("listcount", listcount[0]);
		model.addAttribute("totalpage", listcount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);
		
		//model.addAttribute("commentCount", commentCount);
		
		return "board/boardMain";
	}
	//게시판 삭제
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard( BoardVO vo, @RequestParam("type")int type) {
		boardService.delete(vo.getBoard_id());
		return "redirect:listBoard.do?type="+type;
	}
	//게시판 글쓰기 등록
	@RequestMapping("/writeFormBoard.do")
	public String writeFormBoard(BoardVO vo,@RequestParam("type") int type) {
		boardService.insert(vo);
		return "redirect:listBoard.do?type="+type;
	}
	//게시판 글쓰기 폼 이동
	@RequestMapping("/writeBoard.do")
	public String writeBoard(Model model,@RequestParam("type") int type) {
		model.addAttribute("type",type);
		return "board/boardWrite";
	}
	
	//게시판 상세보기 
	@RequestMapping("/viewBoard.do")
	public String viewBoard(Model model, @RequestParam("board_id") int board_id, @RequestParam("page")int page
			,@RequestParam("type")int type,BoardCommentVO cvo) {
		BoardVO data = boardService.detail(board_id);
		List<BoardCommentVO> clist = boardService.clist(cvo);
		int listCount = boardService.listCount(board_id);
		
		model.addAttribute("type",type);
		model.addAttribute("data",data);
		model.addAttribute("page",page);
		model.addAttribute("clist",clist);
		model.addAttribute("cvo",cvo);
		model.addAttribute("listCount", listCount);
		
		return "board/boardDetail";
	}
	//댓글 등록
	@RequestMapping("/writeComment.do")
	public String writeComment(Model model, BoardCommentVO cvo,BoardVO vo) {
		 System.out.println(vo);
		 System.out.println(cvo);
		 boardService.writeComment(cvo);
		 model.addAttribute("vo", vo);
		 model.addAttribute("cvo",cvo);
		 return "redirect:viewBoard.do?board_id="+vo.getBoard_id()+"&page="+vo.getPage()+"&type="+vo.getType();
	}
	//댓글 조회
	@RequestMapping("/replyProcess.do")
	public String replyProcess(Model model, BoardCommentVO cvo, BoardVO vo) {
		boardService.replyProcess(cvo);
		model.addAttribute("cvo",cvo);
		return "redirect:viewBoard.do?board_id="+vo.getBoard_id()+"&page="+vo.getPage()+"&type="+vo.getType();
		
	}
	//게시판 수정폼 이동
	@RequestMapping("/editBoard.do")
	public String editBoard(Model model, @RequestParam("board_id") int board_id, @RequestParam("type")int type) {
		 BoardVO vo = boardService.view(board_id);
		 model.addAttribute("type",type);
		 model.addAttribute("vo",vo);
		 
		 return "board/boardEdit";
	}
	//게시판 수정
	@RequestMapping("/updateBoard.do")
	public String updateBoard(Model model, BoardVO vo) {
		boardService.update(vo);
		int type = vo.getType();
		//model.addAttribute("vo",vo);
		return "redirect:listBoard.do?type="+type;
	}
	
	//댓글 삭제
	@RequestMapping("replyDeleteBoard.do")
	public String replyDeleteBoard(BoardVO vo, BoardCommentVO cvo) {
		boardService.replyDelete(cvo.getBoard_comment_id());
		
		return "redirect:viewBoard.do?board_id="+vo.getBoard_id()+"&page="+vo.getPage();
	}
	//좋아요 
	@RequestMapping("registLikeBoard.do")
		public String registLikeBoard(LikeBoardVO vo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO vo1 = (UserVO) session.getAttribute("userVO");
		vo.setUser_id(vo1.getUser_id());
		int board_id = Integer.parseInt(request.getParameter("board_id"));
		vo.setBoard_id(board_id);
		boardService.registLike(vo);
		return "redirect:ViewBoard.do?board_id="+board_id;
	} 
	//카페 좋아요 삭제
		@RequestMapping("/deleteLikeBoard.do")   
		public String deleteLikeBoard(LikeBoardVO vo, HttpServletRequest request) {
			
			HttpSession session = request.getSession();
			UserVO vo1 = (UserVO) session.getAttribute("userVO");
			vo.setUser_id(vo1.getUser_id());
			
			int board_id = Integer.parseInt(request.getParameter("board_id"));
			vo.setBoard_id(board_id);
			
			boardService.deleteLike(vo);
			
			return "redirect:ViewBoard.do?board_id="+board_id;
		} 
}
