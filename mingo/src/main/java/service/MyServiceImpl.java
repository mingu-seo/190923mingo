package service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
import vo.BoardLikeVO;
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
	public int countMyReview(int user_id) {
		int myReview_num = myDao.countMyReview(user_id);
		return myReview_num;
	}
	public List<ReviewVO> viewMyReview(Map<String, Integer> reviewMap){
		return myDao.viewMyReview(reviewMap);
	}
	public int countMyCollect(int user_id) {
		int myCollect_num = myDao.countMyCollect(user_id);
		return myCollect_num;
	}
	public List<CollectCafeVO> viewMyCollect(Map<String, Integer> collectMap){
		List<CollectCafeVO> collectList = myDao.viewMyCollect(collectMap);
		return collectList;
	}
	public int countMyPost(int user_id) {
		int myPost_num = myDao.countMyPost(user_id);
		return myPost_num;
	}
	public List<BoardVO> viewMyPost(Map<String, Integer> boardMap){
		List<BoardVO> boardList = myDao.viewMyPost(boardMap);
		return boardList;
	}
	
	
	

}
