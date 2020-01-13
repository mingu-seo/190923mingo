

package detail;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import vo.Cafe_basicVO;
import vo.UserVO;

public interface DetailService {
	
	public Cafe_basicVO basicInfoView(int cafe_id);

	/*
	 * public int memberInsert(TestVO vo, MultipartFile file, HttpServletRequest
	 * request); public TestVO memberDetail(int id); public int memberUpdate(TestVO
	 * vo, MultipartFile file, HttpServletRequest request); public int
	 * memberDelete(int id); public TestVO loginCheck(String mail, String pwd);
	 */
	
}
