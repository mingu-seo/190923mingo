package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.BoardDAO;
import service.BoardService;
import vo.BoardCommentVO;
import vo.BoardLikeVO;
import vo.BoardMetaVO;
import vo.BoardVO;

@Controller
public class BoardController {

	@Autowired
	BoardService boardService;
	
	@Autowired
	BoardDAO boardDAO;
	
	//게시판 조회
	@RequestMapping("/listBoard.do")
	public String listBoard(Model model, BoardVO vo,@RequestParam("type")int type) {
		int[] listcount = boardService.boardCount(vo);	// 전체 갯수와 총페이지수  
		List<BoardVO> list = boardService.list(vo);
		
		//int commentCount = boardService.listCount(board_id);
		model.addAttribute("listcount", listcount[0]);
		model.addAttribute("totalpage", listcount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);
		model.addAttribute("type",type);
		
		model.addAttribute("s1", vo.getS1());
		model.addAttribute("s2", vo.getS2());
		model.addAttribute("k", vo.getK());
		//model.addAttribute("commentCount", commentCount);
		
		List<BoardMetaVO> boardNames = boardDAO.getBoardNames();
		model.addAttribute("boardNames",boardNames);
		
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
	//공지사항 등록
	@RequestMapping("/writeFormNotice.do")
	public String writeFormNotice(BoardVO vo,@RequestParam("type") int type) {
		vo.setIs_notice(1);
		boardService.insert(vo);
		return "redirect:listBoard.do?type="+type;
	}
	//게시판 글쓰기 폼 이동
	@RequestMapping("/writeBoard.do")
	public String writeBoard(Model model,@RequestParam("type") int type) {
		model.addAttribute("type",type);
		
		List<BoardMetaVO> boardNames = boardDAO.getBoardNames();
		model.addAttribute("boardNames",boardNames);
		return "board/boardWrite";
	}
	//공지사항 쓰기 폼 이동
	@RequestMapping("/writeNotice.do")
	public String writeNotice(Model model,@RequestParam("type") int type) {
		model.addAttribute("type",type);
		
		List<BoardMetaVO> boardNames = boardDAO.getBoardNames();
		model.addAttribute("boardNames",boardNames);
		return "board/boardNotice";
	}
	
	
	//게시판 상세보기 
	@RequestMapping("/viewBoard.do")
	public String viewBoard(Model model, @RequestParam("board_id") int board_id, @RequestParam("page")int page
			,@RequestParam("type")int type,BoardCommentVO cvo,
			@RequestParam("s1")int s1,@RequestParam("s2")int s2,@RequestParam("k")String k) {
		BoardVO data = boardService.detail(board_id);
		List<BoardCommentVO> clist = boardService.clist(cvo);
		int listCount = boardService.listCount(board_id);
		int likeNum = boardDAO.getLikeNum(board_id);
		int dislikeNum = boardDAO.getDislikeNum(board_id);
		
		model.addAttribute("type",type);
		model.addAttribute("data",data);
		model.addAttribute("page",page);
		model.addAttribute("clist",clist);
		model.addAttribute("cvo",cvo);
		model.addAttribute("listCount", listCount);
		
		/* 필터링 옵션 s1:기간 s2:글쓴이 제목 등 k : 키워드 */
		model.addAttribute("s1", s1);
		model.addAttribute("s2", s2);
		model.addAttribute("k", k);
		
		/* 좋아요 싫어요 갯수 */
		model.addAttribute("likeNum", likeNum);
		model.addAttribute("dislikeNum",dislikeNum);
		List<BoardMetaVO> boardNames = boardDAO.getBoardNames();
		model.addAttribute("boardNames",boardNames);
		
		return "board/boardDetail";
	}
	
	@RequestMapping("/upLikeNum.do")
	public void upLikeNum(BoardLikeVO vo, HttpServletResponse response) {
		int result = boardService.upLikeNum(vo);
		try {
			
			JSONObject obj = new JSONObject();
			obj.put("result", result);
			
			PrintWriter out = response.getWriter();
			out.print(obj);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}
	@RequestMapping("/upBadNum.do")
	public void upBadNum(BoardLikeVO vo, HttpServletResponse response) {
		int result = boardService.upBadNum(vo);
		try {
			
			JSONObject obj = new JSONObject();
			obj.put("result", result);
			
			PrintWriter out = response.getWriter();
			out.print(obj);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}
	//댓글 등록
	@RequestMapping("/writeComment.do")
	public String writeComment(Model model, BoardCommentVO cvo,BoardVO vo) {
		 boardService.writeComment(cvo);
		 model.addAttribute("vo", vo);
		 model.addAttribute("cvo",cvo);
		 int s1 = vo.getS1();
		 int s2 = vo.getS1();
		 String k = vo.getK();
		 return "redirect:viewBoard.do?board_id="+vo.getBoard_id()+"&page="+vo.getPage()+"&type="+vo.getType()+"&s1="+s1+"&s2="+s2+"&k="+k;
	}
	//댓글 조회
	@RequestMapping("/replyProcess.do")
	public String replyProcess(Model model, BoardCommentVO cvo, BoardVO vo) {
		boardService.replyProcess(cvo);
		model.addAttribute("cvo",cvo);
		int s1 = vo.getS1();
		int s2 = vo.getS1();
		String k = vo.getK();
		return "redirect:viewBoard.do?board_id="+vo.getBoard_id()+"&page="+vo.getPage()+"&type="+vo.getType()+"&s1="+s1+"&s2="+s2+"&k="+k;
		
	}
	
	//댓글 삭제
	@RequestMapping("replyDeleteBoard.do")
	public String replyDeleteBoard(BoardVO vo, BoardCommentVO cvo) {
		//넘어오는 파라미터 board_id, type, page, board_comment_id
		//리플 지우는 함수
		boardService.replyDeleteProcess(cvo);
		//삭제됐다고 표시된 댓글들 지우고 db정리하는 함수
		boardService.refreshDB(vo.getBoard_id());
		int s1 = vo.getS1();
		int s2 = vo.getS1();
		String k = vo.getK();
		
		return "redirect:viewBoard.do?board_id="+vo.getBoard_id()+"&page="+vo.getPage()+"&type="+vo.getType()+"&s1="+s1+"&s2="+s2+"&k="+k;
	}
	//게시판 수정폼 이동
	@RequestMapping("/editBoard.do")
	public String editBoard(Model model, @RequestParam("board_id") int board_id, @RequestParam("type")int type) {
		 BoardVO vo = boardService.view(board_id);
		 model.addAttribute("type",type);
		 model.addAttribute("vo",vo);
		 
		 List<BoardMetaVO> boardNames = boardDAO.getBoardNames();
			model.addAttribute("boardNames",boardNames);
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

}
