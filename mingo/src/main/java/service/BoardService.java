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

	public List<BoardVO> boardIndex(BoardVO vo) {

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
}
