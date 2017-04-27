package com.hipo.account_book.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hipo.account_book.repository.OptionDao;
import com.hipo.account_book.vo.ListVo;
import com.hipo.account_book.vo.OptionVo;


@Service
public class OptionService {
	@Autowired
	private OptionDao optionDao;
	
	public void Add(OptionVo optionvo){
		optionDao.add(optionvo);
	}
	
	public void Update(OptionVo vo){
		optionDao.update(vo);
	}
	
	public List<OptionVo> getCategory(OptionVo vo) {
		List<OptionVo> option = optionDao.category(vo);
		return option;
	}
	
	public boolean delete(OptionVo vo) {
		return optionDao.delete(vo); 
	}
}
