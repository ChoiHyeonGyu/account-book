package com.hipo.account_book.service;

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

}
