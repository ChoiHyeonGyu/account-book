package com.hipo.account_book.repository;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ResponseBody;

@ResponseBody
public class AndroidChartDao {

	@Autowired
	private SqlSession sqlSesson;
	
	public Map<String, Integer> findCategory(Map<String, String> map) {
		return null;
	}

}
