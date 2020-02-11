package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.BoardMetaVO;
import vo.UserCommand;
import vo.UserVO;

@Repository
public class AdminDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<UserVO> getUserList(UserCommand tmp) {
		return sqlSession.selectList("admin.getUserList", tmp);
	}

	public int countUsers(UserCommand tmp) {
		return sqlSession.selectOne("admin.countUsers",tmp);
	}

	public int countOwners(UserCommand tmp) {
		return sqlSession.selectOne("admin.countOwners",tmp);
	}

	public List<UserVO> getOwnerList(UserCommand tmp) {
		return sqlSession.selectList("admin.getOwnerList", tmp);
	}

	public int deleteUser(int id) {
		return sqlSession.delete("admin.deleteUser", id);
	}

	public void refreshBoardMeta(int index) {
		sqlSession.update("admin.updateBoardMeta",index);
		
	}

	public List<Integer> getBoardType() {
		return sqlSession.selectList("admin.getBoardType");
	}

	public List<BoardMetaVO> getBoardMetaList() {
		return sqlSession.selectList("admin.getBoardMetaList");
	}

	public void insertBoardMeta(String name) {
		sqlSession.insert("admin.insertBoardMeta", name);
		
	}

	public int deleteBoardMeta(int type) {
		return sqlSession.delete("admin.deleteBoardMeta",type);
	}


}
