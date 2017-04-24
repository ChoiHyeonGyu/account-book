package com.hipo.account_book.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hipo.account_book.repository.OptionDao;
import com.hipo.account_book.vo.OptionVo;


@Service
public class OptionService {
	@Autowired
	private OptionDao optionDao;
	
	public void Add(OptionVo optionvo){
		optionDao.add(optionvo);
	}
}
