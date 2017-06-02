package com.hipo.account_book.service;

import java.util.HashMap;
import java.util.Map;

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

	public UserVo profile1(String id) {
	UserVo	vo = dao.profile1(id);
	System.out.println("vovovovovovovovovovovovo" + vo);
		return vo ;
	}

/*	public UserVo checkUpdate1(String i) {
		return ;
	}
*/
}
