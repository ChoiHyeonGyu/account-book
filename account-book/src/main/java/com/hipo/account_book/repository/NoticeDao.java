package com.hipo.account_book.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hipo.account_book.vo.NoticeVo;

@Repository
public class NoticeDao {
	@Autowired
	private SqlSession sql;
	
	public List<NoticeVo> getList(){
		
		return sql.selectList("notice.getList");
	}
	
	public List<NoticeVo> getList2(){
		
		return sql.selectList("notice.getList2");
	}
	
	public NoticeVo noticeView(int noticeId){
		
		return sql.selectOne("notice.noticeview", noticeId);
	}
	
	public NoticeVo noticeView2(int noticeId){
		
		return sql.selectOne("notice.noticeview2", noticeId);
	}
}
