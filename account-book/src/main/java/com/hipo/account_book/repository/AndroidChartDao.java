package com.hipo.account_book.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AndroidChartDao {

	@Autowired
	private SqlSession sqlSession;

	public List<String> findCategory(String id) {
		List<String> categoryList = sqlSession.selectList("android.getCategoryById", id);
		return categoryList;
	}

	public List<Integer> findCategory(Map<String, String> categoryMap) {
			
		
		return null;
	
	}

}
