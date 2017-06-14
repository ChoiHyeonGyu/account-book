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
	
	public List<NoticeVo> getList(int page, int size){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("size", size);
		return sql.selectList("notice.getList", map);
	}
	
	public List<NoticeVo> getList2(int page, int size){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("size", size);
		return sql.selectList("notice.getList2", map);
	}
	
	public int noticecount(){
		return sql.selectOne("notice.noticecount");
	}
	
	public int qnacount(){
		return sql.selectOne("notice.qnacount");
	}
	
	public NoticeVo noticeView(int noticeId){
		
		return sql.selectOne("notice.noticeview", noticeId);
	}
	
	public NoticeVo noticeView2(int noticeId){
		
		return sql.selectOne("notice.noticeview2", noticeId);
	}
	
	public void noticeAdd(NoticeVo vo){
		sql.insert("notice.noticeadd", vo);
	}
	
	public void qnaAdd(NoticeVo vo){
		sql.insert("notice.qnaadd", vo);
	}
	
	public void noticeHit(int noticeId){
		sql.update("notice.hit", noticeId);
	}
	
	public void qnaHit(int qnaId){
		sql.update("notice.hit2", qnaId);
	}
	
	public NoticeVo NoticeModify1(int noticeId) {
		return sql.selectOne("notice.modify1", noticeId);
	}
	
	public NoticeVo QnaModify1(int qnaId) {
		return sql.selectOne("notice.qnamodify1", qnaId);
	}
	
	public void NoticeModify(NoticeVo vo){
		sql.update("notice.modify", vo);
		sql.update("notice.modify2", vo);
	}
	
	public void QnaModify(NoticeVo vo){
		sql.update("notice.qnamodify", vo);
		sql.update("notice.qnamodify2", vo);
	}
	
	public void NoticeDelete(NoticeVo vo){
		sql.delete("notice.delete", vo);
	}
	
	public void QnaDelete(NoticeVo vo){
		sql.delete("notice.qdelete", vo);
	}
}
