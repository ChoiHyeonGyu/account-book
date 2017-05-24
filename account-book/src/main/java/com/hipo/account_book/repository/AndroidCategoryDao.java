package com.hipo.account_book.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hipo.account_book.vo.OptionVo;

@Repository
public class AndroidCategoryDao {

	@Autowired
	SqlSession sqlSession;

	public boolean addCategory(String category) {
		return sqlSession.insert("android.addCategory", category) == 1;
	}

	public OptionVo getCategoryId(String category) {
		System.out.println("category : "+category);
		OptionVo optionVo = sqlSession.selectOne("android.getCategoryId", category);
		//System.out.println("id values : " + optionVo.toString());
		return optionVo;
	}

	public boolean addUsersCategory(OptionVo optionVo) {
		return sqlSession.insert("android.addUsersCategory", optionVo) == 1;
	}
}
