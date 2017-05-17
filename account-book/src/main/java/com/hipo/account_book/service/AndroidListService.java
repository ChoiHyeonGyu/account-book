package com.hipo.account_book.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hipo.account_book.repository.AndroidListDao;
import com.hipo.account_book.vo.ListVo;

@Service
public class AndroidListService {

	@Autowired
	private AndroidListDao listDao;

	public boolean addList(ListVo listVo) {
		return listDao.addList(listVo);
	}

	public List<ListVo> getList(String id) {
		return listDao.getList(id);
	}

	public boolean updateList(ListVo listVo) {
		return listDao.updateList(listVo);
	}

	public boolean deleteList(String listId) {
		return listDao.deleteList(listId);
	}
}
