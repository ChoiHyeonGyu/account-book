package com.hipo.account_book.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hipo.account_book.repository.BoardDao;
import com.hipo.account_book.repository.NoticeDao;
import com.hipo.account_book.vo.NoticeVo;
import com.hipo.account_book.vo.OptionVo;

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
}
