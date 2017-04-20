package com.hipo.account_book.repository;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.hipo.account_book.vo.UserVo;

import myBatisSetting.SqlMapConfig;


public class UserDao {

	@Autowired
	private SqlSession sqlSession;
	
	public boolean insert( UserVo userVo ) {
		int count = sqlSession.insert( "user.insert", userVo );
		return (count == 1);
	}
		
}