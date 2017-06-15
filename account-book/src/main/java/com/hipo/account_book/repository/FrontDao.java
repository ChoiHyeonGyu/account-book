package com.hipo.account_book.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hipo.account_book.vo.NoticeVo;
import com.hipo.account_book.vo.UserVo;

@Repository
public class FrontDao {
	@Autowired
	private SqlSession sqlSession;
	
	public UserVo fbselect(String id){
		return sqlSession.selectOne("user.fbselect", id);
	}
	
	public void fbinsert(UserVo uservo){
		sqlSession.insert("user.fbinsert", uservo);
	}
	
	public String checkselect(String id){
		return sqlSession.selectOne("user.checkselect", id);
	}
	
	public void insert(UserVo uservo){
		sqlSession.insert("user.insert", uservo);
	}
	
	public UserVo login(UserVo uservo){
		return sqlSession.selectOne("user.login", uservo);
	}
	
	// 메인에 뿌려줄 것
	public List<NoticeVo> currentnoticeselect(){
		return sqlSession.selectList("user.currentnoticeselect");
	}
}
