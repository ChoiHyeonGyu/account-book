package com.hipo.account_book.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hipo.account_book.repository.BoardDao;
import com.hipo.account_book.repository.NoticeDao;

@Service
public class NoticeService {
	@Autowired
	public NoticeDao noticeDao;
	
	public Map<String, Object> getNotice(){
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put( "noticelist", noticeDao.getList() );
		map.put( "qnalist", noticeDao.getList2() );
		return map;
	}
}
