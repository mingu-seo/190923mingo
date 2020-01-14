
package detail;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import util.FileUtil;
import vo.Cafe_basicVO;
import vo.Cafe_imageVO;
import vo.UserVO;  

@Service
public class DetailServiceImpl implements DetailService {

	@Autowired
	private DetailDAO detailDao;
	
	public Cafe_basicVO basicInfoView(int cafe_id) {
		Cafe_basicVO cafe_basicVO = detailDao.basicInfoView(cafe_id);
		return cafe_basicVO;
	}
	
	public int cafeInsert(Cafe_imageVO vo, List<MultipartFile> file, HttpServletRequest request) {
//		FileUtil fu = new FileUtil();
//		for(int i; i<file.size(); i++) {
//			String img = fu.fileUpload(file.get(i), request.getRealPath("/upload/"));
//			vo.setCafe_img_url(fu.fileName);
//			
//			  
//		}
		int r = detailDao.cafeRegist(vo);
		return r;
	}
	
	   
	/*
	 * public int memberInsert(TestVO vo, MultipartFile file, HttpServletRequest
	 * request) { FileUtil fu = new FileUtil(); fu.fileUpload(file,
	 * request.getRealPath("/upload/test/")); vo.setProfile(fu.fileName); int r =
	 * testDao.memberInsert(vo); return r; }
	 * 
	 * @Override public TestVO memberDetail(int id) { TestVO vo =
	 * testDao.memberDetail(id); return vo; }
	 * 
	 * @Override public int memberUpdate(TestVO vo, MultipartFile file,
	 * HttpServletRequest request) { FileUtil fu = new FileUtil();
	 * fu.fileUpload(file, request.getRealPath("/upload/test/")); if (fu.fileName !=
	 * null && !"".equals(fu.fileName)) { vo.setProfile(fu.fileName); } int r =
	 * testDao.memberUpdate(vo); return r; }
	 * 
	 * @Override public int memberDelete(int id) { int r = testDao.memberDelete(id);
	 * return r; }
	 * 
	 * @Override public TestVO loginCheck(String mail, String pwd) { HashMap hm =
	 * new HashMap(); hm.put("mail", mail); hm.put("pwd", pwd); TestVO vo =
	 * testDao.loginCheck(hm); return vo; }
	 */
}
