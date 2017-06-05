package com.hipo.account_book.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hipo.account_book.repository.NoticeDao;
import com.hipo.account_book.vo.NoticeVo;

@Service
public class NoticeService {
	@Autowired
	public NoticeDao noticeDao;
	
	public Map<String, Object> getNotice(){
		List<NoticeVo> notice;
		List<NoticeVo> notice2;
		
		notice = noticeDao.getList();
		notice2 = noticeDao.getList2();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put( "noticelist", notice);
		map.put( "qnalist", notice2);
		
		
		return map;
	}
	
	public Map<String, Object> noticeView(int noticeId){
		NoticeVo view;
		NoticeVo view2;
		
		view = noticeDao.noticeView(noticeId);
		view2 = noticeDao.noticeView2(noticeId);
		
		System.out.println("viewview:::"+view);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put( "noticeview", view);
		map.put( "qnaview", view2);
		
		System.out.println("qviewqview:::"+view2);
		
		return map;
	}
	
	public void NoticeAdd(NoticeVo vo){
		noticeDao.noticeAdd(vo);
	}
	
	public void QnaAdd(NoticeVo vo){
		noticeDao.qnaAdd(vo);
	}
	
	public void NoticeHit(int noticeId){
		noticeDao.noticeHit(noticeId);
	}
	
	public void QnaHit(int qnaId){
		noticeDao.qnaHit(qnaId);
	}
	
	public NoticeVo NoticeModify1(int noticeId) {
		NoticeVo noticeVo = noticeDao.NoticeModify1(noticeId);
		return noticeVo;
	}
	
	public NoticeVo QnaModify1(int qnaId) {
		NoticeVo noticeVo = noticeDao.QnaModify1(qnaId);
		return noticeVo;
	}
	
	public void NoticeModify(NoticeVo vo){
		noticeDao.NoticeModify(vo);
	}
	
	public void QnaModify(NoticeVo vo){
		noticeDao.QnaModify(vo);
	}
	
	public void NoticeDelete(NoticeVo vo){
		noticeDao.NoticeDelete(vo);
	}
	
	public void QnaDelete(NoticeVo vo){
		noticeDao.QnaDelete(vo);
	}
}
