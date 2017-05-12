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

}