package com.hipo.account_book.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hipo.account_book.vo.AndroidCategoryChartVo;

@Repository
public class AndroidChartDao {

	@Autowired
	private SqlSession sqlSession;

	public List<String> findCategory(String id) {
		List<String> categoryList = sqlSession.selectList("android.getCategoryById", id);
		return categoryList;
	}

	public Integer[] findCategorySum(List<AndroidCategoryChartVo> categoryChartList) {
		Integer[] sumArr = new Integer[categoryChartList.size()];
		for (int i = 0; i < categoryChartList.size(); i++) {
			sumArr[i] = sqlSession.selectOne("android.getCategorySum", categoryChartList.get(i));
		}
		return sumArr;
	}

}
