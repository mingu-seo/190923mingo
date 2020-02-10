package service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import vo.BoardVO;
import vo.CafeFacilitiesVO;
import vo.CafeImageVO;
import vo.CafeMenuVO;
import vo.CafeProductVO;
import vo.CafeRateVO;
import vo.CafeServiceVO;
import vo.CafeVO;
import vo.CollectCafeVO;
import vo.BoardLikeVO;
import vo.ReviewVO;
import vo.UserVO;


public interface MyService {
	public UserVO viewUserInfo(int user_id);
	public CafeVO viewCafe(int user_id);
	public CafeRateVO viewCafeRate(int cafe_id);
	public List<ReviewVO> viewReview(int user_id);
	public List<CafeVO> viewCafe(List<ReviewVO> reviews);
	public List<BoardVO> viewBoard(int user_id);  
	public List<CollectCafeVO> viewCollect(int user_id);
	public List<CafeVO> viewCafeList2(List<CollectCafeVO> collectList); 
	public List<CafeRateVO> viewCafeRate2(List<CollectCafeVO> collectList);
	public int modifyUser(UserVO vo);
	public void deleteUser(int user_id);
	public int myUserModifyPassword(UserVO vo);
	public int countMyReview(int user_id);
	public List<ReviewVO> viewMyReview(Map<String, Integer> reviewMap);
	public int countMyCollect(int user_id);
	public List<CollectCafeVO> viewMyCollect(Map<String, Integer> collectMap);
	public int countMyPost(int user_id);
	public List<BoardVO> viewMyPost(Map<String, Integer> boardMap);
	
	
	
}
