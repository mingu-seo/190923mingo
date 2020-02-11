package controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.AdminDAO;
import vo.BoardMetaVO;
import vo.PageInfo;
import vo.UserCommand;
import vo.UserVO;

@Controller
public class AdminController {

	@Autowired
	AdminDAO adminDAO;

	@RequestMapping("/adminLoginForm.do")
	public String adminLoginForm() {
		return "admin2/adminUserList";
	}

	@RequestMapping("/adminMain.do")
	public String adminMain() {
		return "admin2/adminMain";
	}


	/* 유저 관리 메인으로 가는 메소드 (유저 리스트를 가져옴)*/
	@RequestMapping("/mngUserMain.do")
	public String mngUserMain(Model model, @RequestParam("page") int page, UserCommand tmp) {
		// tmp 속성 : limit,startrow
		
		/* 객체 생성 */
		List<UserVO> userList = new ArrayList<UserVO>();
		
		/* 리밋 설정 */
		int limit=10;

		/* startrow 설정 */
		int startrow = (page-1)*limit;

		/* 총 리스트 수를 받아옴 */
		int listCount = adminDAO.countUsers(tmp);
		
		/* 회원 목록 가져옴 */
		tmp.setStartrow(startrow);
		tmp.setLimit(limit);
		userList = adminDAO.getUserList(tmp);

		/* 페이지 정보 계산 */
		int maxPage = listCount/limit;
		if(listCount % limit > 0) maxPage++;
		int startPage = (page-1)/10 * 10+1;
		int endPage = startPage+10-1;
		if(endPage > maxPage) endPage=maxPage;

		PageInfo pageInfo = new PageInfo();
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage); 


		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("userList",userList);
		return "admin2/adminUserList";
	}
	
	/* 유저 관리 메인으로 가는 메소드 (유저 리스트를 가져옴)*/
	@RequestMapping("/getOwnerList.do")
	public String getOwnerList(Model model, @RequestParam("page") int page, UserCommand tmp) {
		// tmp 속성 : limit,startrow
		
		/* 객체 생성 */
		List<UserVO> ownerList = new ArrayList<UserVO>();
		
		/* 리밋 설정 */
		int limit=10;

		/* startrow 설정 */
		int startrow = (page-1)*limit;

		/* 총 리스트 수를 받아옴 */
		int listCount = adminDAO.countOwners(tmp);
		
		/* 회원 목록 가져옴 */
		tmp.setStartrow(startrow);
		tmp.setLimit(limit);
		ownerList = adminDAO.getOwnerList(tmp);

		/* 페이지 정보 계산 */
		int maxPage = listCount/limit;
		if(listCount % limit > 0) maxPage++;
		int startPage = (page-1)/10 * 10+1;
		int endPage = startPage+10-1;
		if(endPage > maxPage) endPage=maxPage;

		PageInfo pageInfo = new PageInfo();
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage); 


		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("ownerList",ownerList);
		return "admin2/adminOwnerList";
	}
	
	@RequestMapping("/deleteUserAdmin.do")
	public String deleteUser(@RequestParam("user_id")int id) {
		int result = adminDAO.deleteUser(id);
		return "redirect:/mngUserMain.do?page=1";
	}
	@RequestMapping("/deleteOwnerAdmin.do")
	public String deleteOwnerAdmin(@RequestParam("user_id")int id) {
		int result = adminDAO.deleteUser(id);
		return "redirect:/getOwnerList.do?page=1";
	}
	@RequestMapping("/deleteBoardMeta.do")
	public String deleteBoardMeta(@RequestParam("type")int type) {
		int result = adminDAO.deleteBoardMeta(type);
		return "redirect:/mngBoardMain.do?";
	}
	
	@RequestMapping("/mngBoardMain.do")
	public String mngBoardMain(Model model, @RequestParam(required = false, value = "name")String name) {
		//name이 널이 아니라면 추가 한다.
		if( name != null) {
			adminDAO.insertBoardMeta(name);
		}
		//보드메타테이블를 업데이트 한다.
		List<Integer> boardType = adminDAO.getBoardType();
		for( Integer i : boardType) {
			adminDAO.refreshBoardMeta(i);
		}
		
		//보드메타테이블을 가져온다.
		List<BoardMetaVO> list = null;
				
		list = adminDAO.getBoardMetaList();
		
		model.addAttribute("list", list);
		
		return "admin2/mngBoardMain";
	}




}
