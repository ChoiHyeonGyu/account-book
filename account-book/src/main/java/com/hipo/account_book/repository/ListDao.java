package com.hipo.account_book.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hipo.account_book.vo.ListVo;
@Repository
public class ListDao {
@Autowired
private SqlSession sql;

	public List<ListVo> list() {
		System.out.println("여긴 다오!!!!!!!!!!!!!!!!!!!!!!!!!");
		List<ListVo> list = sql.selectList("listview.list"); 

		System.out.println("여기 리스트" + list);
		return list;
	}

}
