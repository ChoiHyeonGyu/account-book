package com.hipo.account_book.service;

import java.util.List;

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
	public String Modify0(String category2){
		return optionDao.Modify0(category2);
	}
	public void Modify(OptionVo optionvo){
		optionDao.Modify(optionvo);
	}
	public void Modify2(OptionVo optionvo){
		System.out.println("ddqwdqwdqwdqwdqwdqwd");
		optionDao.Modify2(optionvo);
	}
	public int Modify1(OptionVo optionvo){
		return optionDao.Modify1(optionvo);
	}
	
	public int Modify3(OptionVo optionvo){
		return optionDao.Modify3(optionvo);
	}
	public void Modify4(OptionVo optionvo){
		optionDao.Modify4(optionvo);
	}
	
	public String Modify5(OptionVo optionvo){
		return optionDao.Modify5(optionvo);
	}
	
	public boolean Modify6(OptionVo vo) {
		return optionDao.Modify6(vo); 
	}
	
	public void Modify7(OptionVo optionvo){
		optionDao.Modify7(optionvo);
	}
	
	public int limitModify(OptionVo optionvo){
		return optionDao.limitModify(optionvo);
	}
	
	public void limitModify1(OptionVo optionvo){
		optionDao.limitModify1(optionvo);
	}
	
	public OptionVo categoryModify(int i) {
		return optionDao.categoryModify(i);
	}
	
	public OptionVo limitModify2(String category) {
		return optionDao.limitModify2(category);
	}
	
	public boolean categoryModify1(OptionVo vo) {
		System.out.println("ㅇ르ㅏㅣㄴㅁ어라ㅓㅈ도갖도가ㅓㄴ오라ㅓㅗㅈㄹ" + vo);
		optionDao.categoryModify1(vo);
		return false;
	}
	
	public List<OptionVo> getCategory(OptionVo vo) {
		List<OptionVo> option = optionDao.category(vo);
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
}
