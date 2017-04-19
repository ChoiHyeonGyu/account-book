package com.hipo.account_book.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hipo.account_book.repository.ListDao;
import com.hipo.account_book.vo.ListVo;

@Service
public class ListService {
	@Autowired
	public ListDao dao;

	public List<ListVo> getList() {
		System.out.println("여긴 서비스!!!!!!!!!!!!!!!!!!!!!!!!");
		List<ListVo> list = dao.list();
		
		System.out.println("서비스 끝!!!!!!!!!!!!!!!!!!!!!!!!!!");

		return list;

	}
}
