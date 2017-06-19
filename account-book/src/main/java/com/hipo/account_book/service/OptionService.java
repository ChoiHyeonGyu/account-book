package com.hipo.account_book.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hipo.account_book.repository.OptionDao;
import com.hipo.account_book.vo.OptionVo;


@Service
public class OptionService {
	@Autowired
	private OptionDao optionDao;
	
	public String Add0(String category2){
		return optionDao.add0(category2);
	}
	public void Add(OptionVo optionvo){
		optionDao.add(optionvo);
	}
	public void Add2(OptionVo optionvo){
		optionDao.add2(optionvo);
	}
	public int Add1(OptionVo optionvo){
		return optionDao.add1(optionvo);
	}
	
	public int Add3(OptionVo optionvo){
		return optionDao.add3(optionvo);
	}
	
	public int limitModify(OptionVo optionvo, String id){
		optionvo.setId(id);
		return optionDao.limitModify(optionvo);
	}
	
	public void limitModify1(OptionVo optionvo){
		optionDao.limitModify1(optionvo);
	}
	
	public OptionVo categoryModify(int i) {
		return optionDao.categoryModify(i);
	}
	
	public OptionVo limitModify2(String category, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		map.put("id", id);
		return optionDao.limitModify2(map);
	}
	
	public boolean categoryModify1(OptionVo vo) {
		optionDao.categoryModify1(vo);
		return false;
	}
	
	public List<OptionVo> getCategory(OptionVo vo) {
		List<OptionVo> option = optionDao.category(vo);
		return option;
	}
	public List<OptionVo> getPlusCategory(OptionVo vo) {
		List<OptionVo> option = optionDao.pluscategory(vo);
		return option;
	}
	public List<OptionVo> getMinusCategory(OptionVo vo) {
		List<OptionVo> option = optionDao.minuscategory(vo);
		return option;
	}
	public List<OptionVo> getInvestmentCategory(OptionVo vo) {
		List<OptionVo> option = optionDao.investmentcategory(vo);
		return option;
	}
	
	public boolean delete(OptionVo vo) {
		return optionDao.delete(vo); 
	}
	
	public void reset(String id){
		optionDao.reset(id);
	}
	
	public String checkPassword(String resetPassword, String id){
		String password = optionDao.checkPassword(id);
		
		if(password.equals(resetPassword) == true){
			return "success";
		} else{
			return "fail";
		}
	}
	public List<OptionVo> operationsCategory(String id) {
		return	optionDao.operationsCategory(id);
	}
}
