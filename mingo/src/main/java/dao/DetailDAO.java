

package dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import util.FileUtil;
import vo.CafeFacilitiesVO;
import vo.CafeImageVO;
import vo.CafeMenuVO;
import vo.CafeProductVO;
import vo.CafeServiceVO;
import vo.CafeVO;
import vo.ReviewVO;
import vo.UserVO;

@Repository
public class DetailDAO {
    
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public CafeVO viewCafe(int cafe_id) {
		return sqlSession.selectOne("detail.selectCafe_BasicInfo", cafe_id);
	}
	
	public List<CafeImageVO> viewCafeImages(int cafe_id){
		return sqlSession.selectList("detail.selectViewCafeImage", cafe_id);		
	}
	public List<ReviewVO> viewCafeReview(int cafe_id){
		return sqlSession.selectList("detail.selectViewCafeReview", cafe_id);		
	}
	public List<UserVO> viewUserList(int[] userList){
		List<UserVO> userVOList = new ArrayList<UserVO>();
		for (int i = 0; i < userList.length; i++) {
			userVOList.add(sqlSession.selectOne("detail.selectViewUserList", userList[i]));		
		} 
		return userVOList;
	}
	
	public List<CafeMenuVO> viewMenu(int cafe_id){
		return sqlSession.selectList("detail.selectViewMenu", cafe_id);			
	}
	public List<CafeProductVO> viewProduct(int cafe_id){
		return sqlSession.selectList("detail.selectViewProduct", cafe_id);			
	}
	public CafeServiceVO viewService(int cafe_id) {
		return sqlSession.selectOne("detail.selectViewService", cafe_id);
	}
	public CafeFacilitiesVO viewFacilities(int cafe_id) {
		return sqlSession.selectOne("detail.selectViewFacilities", cafe_id);
	}
	
	public int insertCafeImages(CafeImageVO vo, List<MultipartFile> fileList,MultipartHttpServletRequest request) {
		String path1 = util.Property.cafe_img_path;
		String path2 = request.getRealPath("/upload");
		
		for(int i=0; i<fileList.size(); i++) {  
			FileUtil fu = new FileUtil(); 
			fu.fileUpload(fileList.get(i), path2+"/cafe/");
			System.out.println(path2+"/cafe/");
			vo.setUrl(fu.fileName);
			int result = sqlSession.insert("mingo.insertCafeImage", vo);
			
		}
		return 1;	
		
	}
	
	/*
	 * public List<TestVO> memberList(TestVO vo) { return
	 * sqlSession.selectList("test.selectMember", vo); }
	 * 
	 * public int memberInsert(TestVO vo) { return
	 * sqlSession.insert("test.insertMember", vo); }
	 * 
	 * public TestVO memberDetail(int id) { return
	 * sqlSession.selectOne("test.memberDetail", id); }
	 * 
	 * public int memberUpdate(TestVO vo) { return
	 * sqlSession.update("test.updateMember", vo); }
	 * 
	 * public int memberDelete(int id) { return
	 * sqlSession.delete("test.deleteMember", id); }
	 * 
	 * public TestVO loginCheck(HashMap hm) { return
	 * sqlSession.selectOne("test.loginCheck", hm); }
	 */
	
	
	
	
	
	
	
	
	
}
