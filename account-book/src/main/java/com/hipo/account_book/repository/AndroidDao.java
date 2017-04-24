package com.hipo.account_book.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hipo.account_book.vo.UserVo;

@Repository
public class AndroidDao {

	@Autowired
	private SqlSession session;

	public boolean join(UserVo vo) {
		int count = session.insert("android.join", vo);
		return count == 1;
	}

	public UserVo login(String id) {
		UserVo uservo = session.selectOne("getVoById", id);
		return uservo;
	}

}
