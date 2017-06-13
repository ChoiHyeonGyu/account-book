package com.hipo.account_book.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hipo.account_book.vo.UserVo;
@Repository
public class ProfileDao {
@Autowired SqlSession sql;
	
	public UserVo checkUpdate(String id) {
		return sql.selectOne("profile.check",id);
	}

	public UserVo profile1(String id) {
		UserVo vo = sql.selectOne("profile.check1", id);
		return vo ;
	}

	public boolean updateprofile(UserVo vo) {
		sql.update("profile.updateUserInfo",vo);
		return false;
	}
	
	public boolean updateprofilephoto(UserVo vo) {
		sql.update("profile.updateUserInfophoto",vo);
		return false;
	}

	public UserVo profileall(String id) {
		return sql.selectOne("profile.image", id);
		
	}

	public UserVo profileModify(String id) {
		return	sql.selectOne("profile.profileModify",id);
		 
	}

	public UserVo graph(String id) {
		UserVo vo= sql.selectOne("profile.graph",id);
		return vo; 
	}

	public UserVo graph2(String id) {
		return	sql.selectOne("profile.graph2",id);
	}

	public UserVo graph3(String id) {
		return sql.selectOne("profile.graph3",id);
	}

	public UserVo graph4(String id) {
		return sql.selectOne("profile.graph4",id);
	}

	public UserVo graph5(String id) {
		return sql.selectOne("profile.graph5",id);
	}

	public UserVo graph6(String id) {
		return sql.selectOne("profile.graph6", id);
	}

	public UserVo graph7(String id) {
		return sql.selectOne("profile.graph7",id);
	}

}
