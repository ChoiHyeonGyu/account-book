package com.hipo.account_book.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hipo.account_book.repository.NoticeDao;
import com.hipo.account_book.vo.NoticeVo;

@Service
public class NoticeService {
	@Autowired
	public NoticeDao noticeDao;
	
	private static final int LIST_SIZE = 10;
	private static final int PAGE_SIZE = 10;
	
	public Map<String, Object> getNotice(int currentPage){		
		Map<String, Object> map = new HashMap<String, Object>();
		
		//1. 페이징을 위한 기본 데이터 계산
		int totalCount = noticeDao.noticecount();
		int pageCount = (int)Math.ceil( (double)totalCount / LIST_SIZE );
		int blockCount = (int)Math.ceil( (double)pageCount / PAGE_SIZE );
		int currentBlock = (int)Math.ceil( (double)currentPage / PAGE_SIZE );
		
		//2. 파라미터 page 값  검증
		if( currentPage < 1 ) {
			currentPage = 1;
			currentBlock = 1;
		} else if( currentPage > pageCount ) {
			currentPage = pageCount;
			currentBlock = (int)Math.ceil( (double)currentPage / PAGE_SIZE );
		}
		
		//3. view에서 페이지 리스트를 렌더링 하기위한 데이터 값 계산
		int beginPage = currentBlock == 0 ? 1 : (currentBlock - 1)*PAGE_SIZE + 1;
		int prevPage = ( currentBlock > 1 ) ? ( currentBlock - 1 ) * PAGE_SIZE : 0;
		int nextPage = ( currentBlock < blockCount ) ? currentBlock * PAGE_SIZE + 1 : 0;
		int endPage = ( nextPage > 0 ) ? ( beginPage - 1 ) + LIST_SIZE : pageCount;
		
		//1. 페이징을 위한 기본 데이터 계산
		int totalCount2 = noticeDao.qnacount();
		int pageCount2 = (int)Math.ceil( (double)totalCount2 / LIST_SIZE );
		int blockCount2 = (int)Math.ceil( (double)pageCount2 / PAGE_SIZE );
		int currentBlock2 = (int)Math.ceil( (double)currentPage / PAGE_SIZE );
		
		//2. 파라미터 page 값  검증
		if( currentPage < 1 ) {
			currentPage = 1;
			currentBlock2 = 1;
		} else if( currentPage > pageCount2 ) {
			currentPage = pageCount2;
			currentBlock2 = (int)Math.ceil( (double)currentPage / PAGE_SIZE );
		}
		
		//3. view에서 페이지 리스트를 렌더링 하기위한 데이터 값 계산
		int beginPage2 = currentBlock2 == 0 ? 1 : (currentBlock2 - 1)*PAGE_SIZE + 1;
		int prevPage2 = ( currentBlock2 > 1 ) ? ( currentBlock2 - 1 ) * PAGE_SIZE : 0;
		int nextPage2 = ( currentBlock2 < blockCount2 ) ? currentBlock2 * PAGE_SIZE + 1 : 0;
		int endPage2 = ( nextPage2 > 0 ) ? ( beginPage2 - 1 ) + LIST_SIZE : pageCount2;
		
		map.put( "noticelist", noticeDao.getList(currentPage, LIST_SIZE) );
		map.put( "totalCount", totalCount );
		map.put( "listSize", LIST_SIZE );
		map.put( "currentPage", currentPage );
		map.put( "beginPage", beginPage );
		map.put( "endPage", endPage );
		map.put( "prevPage", prevPage );
		map.put( "nextPage", nextPage );
		
		map.put( "qnalist", noticeDao.getList2(currentPage, LIST_SIZE) );
		map.put( "totalCount2", totalCount2 );
		map.put( "beginPage2", beginPage2 );
		map.put( "endPage2", endPage2 );
		map.put( "prevPage2", prevPage2 );
		map.put( "nextPage2", nextPage2 );
		
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
