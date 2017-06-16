package com.hipo.account_book.androidrepository;

import java.util.List;
import java.util.Map;

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
		System.out.println("category : " + category);
		OptionVo optionVo = sqlSession.selectOne("android.getCategoryId", category);
		// System.out.println("id values : " + optionVo.toString());
		return optionVo;
	}

	public boolean addUsersCategory(OptionVo optionVo) {
		return sqlSession.insert("android.addUsersCategory", optionVo) == 1;
	}

	public List<OptionVo> getCategoryList(String id) {
		return sqlSession.selectList("android.getCategoryList", id);
	}

	public boolean deleteCategory(OptionVo optionVo) {
		return sqlSession.delete("android.categoryDeleteById", optionVo) == 1;
	}

	public boolean updateMoneyLimit(Map<String, String> params) {
		return sqlSession.update("android.monetLimitSet", params) == 1;
	}
}
