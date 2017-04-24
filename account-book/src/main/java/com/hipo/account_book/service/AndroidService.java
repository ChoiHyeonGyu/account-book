package com.hipo.account_book.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hipo.account_book.repository.AndroidDao;
import com.hipo.account_book.vo.UserVo;

@Service
public class AndroidService {

	@Autowired
	private AndroidDao dao;

	public boolean join(UserVo vo) {
		return dao.join(vo);
	}

	public UserVo login(String id) {
		return dao.login(id);
	}

}
