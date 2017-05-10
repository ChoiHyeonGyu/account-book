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
	public void Add2(OptionVo optionvo){
		System.out.println("daoadd2-------"+optionvo);
		optionDao.add2(optionvo);
	}
	public int Add1(String category){
		return optionDao.add1(category);
	}
	
	public int limitModify(OptionVo optionvo){
		return optionDao.limitModify(optionvo);
	}
	
	public void limitModify1(OptionVo optionvo){
		optionDao.limitModify1(optionvo);
	}
	
	public OptionVo categoryModify(int i) {
		System.out.println("intintint"+i);
		return optionDao.categoryModify(i);
	}
	
	public boolean categoryModify1(OptionVo vo) {
		optionDao.categoryModify1(vo);
		return false;
	}
	
	public List<OptionVo> getCategory(OptionVo vo) {
		List<OptionVo> option = optionDao.category(vo);
		return option;
	}
	
	public boolean delete(OptionVo vo) {
		System.out.println(".........딜리딜리디리디....."+vo);
		return optionDao.delete(vo); 
	}
}
