package com.hipo.account_book.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hipo.account_book.repository.AndroidCategoryDao;
import com.hipo.account_book.vo.OptionVo;

@Service
public class AndroidCategoryService {
	@Autowired
	AndroidCategoryDao aCategoryDao;

	public boolean addCategory(String category) {
		return aCategoryDao.addCategory(category);
	}

	public OptionVo getCategoryId(String category) {
		return aCategoryDao.getCategoryId(category);
	}

	public boolean addUsersCategory(OptionVo optionVo) {
		return aCategoryDao.addUsersCategory(optionVo);
	}

	public List<OptionVo> getCategoryList(String id) {
		return aCategoryDao.getCategoryList(id);
	}

	public boolean deleteCategory(OptionVo optionVo) {
		return aCategoryDao.deleteCategory(optionVo);
	}

	public boolean updateMoneyLimit(Map<String,String> params){
		return aCategoryDao.updateMoneyLimit(params);
	}
	
}
