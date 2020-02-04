package service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import dao.MyDAO;
import vo.BoardVO;
import vo.CafeRateVO;
import vo.CafeVO;
import vo.CollectCafeVO;
import vo.LikeBoardVO;
import vo.ReviewVO;
import vo.UserVO;



@Service
public class MyServiceImpl implements MyService{
	
	@Autowired
	private MyDAO myDao; 
	
	public UserVO viewUserInfo(int user_id) {
		UserVO userVO = myDao.viewUserInfo(user_id);
		return userVO;
	}
	
	public CafeVO viewCafe(int user_id) {
		CafeVO cafe = myDao.viewCafe(user_id);
		return cafe;
	}
	public CafeRateVO viewCafeRate(int cafe_id) {
		CafeRateVO cafeRate = myDao.viewCafeRate(cafe_id);
		return cafeRate;	
	}
	public List<ReviewVO> viewReview(int user_id){		
		List<ReviewVO> reviews = myDao.viewReview(user_id);
		return reviews;
	}
	public List<CafeVO> viewCafe(List<ReviewVO> reviews){
		List<CafeVO> cafeList = myDao.viewCafe(reviews);		
		return cafeList;
	}
	public List<BoardVO> viewBoard(int user_id){		
		List<BoardVO> boardList = myDao.viewBoard(user_id);
		return boardList;
	}
	public List<CollectCafeVO> viewCollect(int user_id){
		List<CollectCafeVO> collectList = myDao.viewCollect(user_id);
		return collectList;
	}
	public List<CafeVO> viewCafeList2(List<CollectCafeVO> collectList){
		List<CafeVO> cafeList = myDao.viewCafeList2(collectList);
		return cafeList;
		
		
	} 
	public List<CafeRateVO> viewCafeRate2(List<CollectCafeVO> collectList){
		List<CafeRateVO> cafeRateList = myDao.viewCafeRate2(collectList);
		return cafeRateList;
		
	}
	
	public int modifyUser(UserVO vo) {
		int r = myDao.modifyUser(vo);
		return r;
	}
	public void deleteUser(int user_id) {
		myDao.deleteUser(user_id);
	}
	public int myUserModifyPassword(UserVO vo) {
		return myDao.myUserModifyPassword(vo);
	}
		
	
	

}
