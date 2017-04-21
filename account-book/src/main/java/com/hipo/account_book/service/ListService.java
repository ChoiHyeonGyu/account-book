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

	public List<ListVo> getList(ListVo vo) {
		System.out.println("아이디 ! 불러옵니다" + vo);
		List<ListVo> list = dao.list(vo);
		System.out.println("리스트 불러옵니까????" + list);

		return list;
	}

	public boolean delete(ListVo vo) {
		return dao.delete(vo); 
		
	}

	public boolean add(ListVo vo) {
		
		return dao.add(vo);
		
	}

}