package com.hipo.account_book.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hipo.account_book.vo.UserVo;

@Repository
public class FrontDao {
	@Autowired
	private SqlSession sqlSession;
	
	public void fbinsert(UserVo uservo){
		sqlSession.insert("user.fbinsert", uservo);
	}
}
