package com.hipo.account_book.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hipo.account_book.vo.UserVo;
@Service 
public class ProfileService {
	@Autowired
	private ProfileDao dao;
	
	public UserVo checkUpdate(String id){
		return dao.checkUpdate(id);
	}

/*	public UserVo checkUpdate1(String i) {
		return ;
	}
*/
}
