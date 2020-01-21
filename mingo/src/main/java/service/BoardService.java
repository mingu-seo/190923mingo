package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.BoardDAO;
import vo.BoardVO;


@Service
public class BoardService {

	@Autowired
	BoardDAO boardDAO;

	public List<BoardVO> list(BoardVO vo) {

		List<BoardVO> list = boardDAO.list(vo);
		return list;
	}

	public int[] boardCount() {
		int listcount = boardDAO.count(); // 전체 갯수
		int totalpage = listcount / 10; // 총페이지수
		if (listcount % 10 > 0)
			totalpage++;

		int[] pagecount = new int[2];
		pagecount[0] = listcount;
		pagecount[1] = totalpage;

		return pagecount;
	}
	public int insert(BoardVO vo) {
		int r = boardDAO.insert(vo);
		return r;
	}
	public BoardVO view(int board_id) {
		BoardVO vo = boardDAO.view(board_id);
		return vo;
	}
	public int update(BoardVO vo) {
		return boardDAO.update(vo);
	}
	public int delete(int board_id) {
		return boardDAO.delete(board_id); 
		 
	}
}
