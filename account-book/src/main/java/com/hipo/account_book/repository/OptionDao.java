package com.hipo.account_book.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.hipo.account_book.vo.OptionVo;

@Repository
public class OptionDao {
	@Autowired
	private SqlSession sql;
	
	public boolean add(OptionVo vo) {
		sql.insert("option.add",vo);
		return false;
	}
}
