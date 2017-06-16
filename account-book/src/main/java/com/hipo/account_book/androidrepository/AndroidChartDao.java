package com.hipo.account_book.androidrepository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hipo.account_book.vo.AndroidCategoryChartVo;
import com.hipo.account_book.vo.GraphVo;

@Repository
public class AndroidChartDao {

	@Autowired
	private SqlSession sqlSession;

	public List<String> findCategory(String id) {
		List<String> categoryList = sqlSession.selectList("android.getCategoryById", id);
		System.out.println("androidChartDao getCategoryList : "+categoryList.toString());
		return categoryList;
	}

	public Integer[] findCategorySum(List<AndroidCategoryChartVo> categoryChartList) {
		Integer[] sumArr = new Integer[categoryChartList.size()];
		for (int i = 0; i < categoryChartList.size(); i++) {
			sumArr[i] = sqlSession.selectOne("android.getCategorySum", categoryChartList.get(i));
		}
		return sumArr;
	}

	public List<GraphVo> findLimit(Map<String,String> params){
		return sqlSession.selectList("android.getLimitGraph",params);
	}
	
}
