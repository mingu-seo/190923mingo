package dao;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import vo.BoardVO;
import vo.CafeRateVO;
import vo.CafeVO;
import vo.CollectCafeVO;
import vo.LikeBoardVO;
import vo.ReviewVO;
import vo.UserVO;

@Repository
public class MyDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public UserVO viewUserInfo(int user_id) {
		return sqlSession.selectOne("my.selectUserInfo", user_id);
	}
	public CafeVO viewCafe(int user_id) {
		return sqlSession.selectOne("my.selectCafe", user_id);
	}
	public CafeRateVO viewCafeRate(int cafe_id) {
		return sqlSession.selectOne("my.selectCafeRate", cafe_id);
	}
	public List<ReviewVO> viewReview(int user_id) {
		System.out.println("dao : " + user_id);
		return sqlSession.selectList("my.selectReviewList", user_id);
	}
	public List<BoardVO> viewBoard(int user_id) {
		return sqlSession.selectList("my.selectBoardList", user_id);
	}
	public List<CafeVO> viewCafe(List<ReviewVO> reviews) {
		List<CafeVO> cafeList = new ArrayList<CafeVO>();
		for (int i = 0; i < reviews.size(); i++) {
			CafeVO vo = sqlSession.selectOne("my.selectCafeInfo", reviews.get(i).getCafe_id());
			cafeList.add(vo);
		}
		return cafeList;
	}
	public List<CollectCafeVO> viewCollect(int user_id) {
		return sqlSession.selectList("my.selectCollect", user_id);
	}
	public List<CafeVO> viewCafeList2(List<CollectCafeVO> collectList) {
		List<CafeVO> cafeList = new ArrayList<CafeVO>();
		for (int i = 0; i < collectList.size(); i++) {
			CafeVO vo = sqlSession.selectOne("my.selectCafeInfo", collectList.get(i).getCafe_id());
			cafeList.add(vo);
		}
		return cafeList;
	}
	public List<CafeRateVO> viewCafeRate2(List<CollectCafeVO> collectList) {
		List<CafeRateVO> cafeRateList = new ArrayList<CafeRateVO>();
		for (int i = 0; i < collectList.size(); i++) {
			CafeRateVO vo = sqlSession.selectOne("my.selectCafeRate", collectList.get(i).getCafe_id());
			cafeRateList.add(vo);
		}
		return cafeRateList;
	}
	

}
