package com.hipo.account_book.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hipo.account_book.vo.ListVo;

@Repository
public class AndroidListDao {

	@Autowired
	private SqlSession sqlSession;

	public boolean addList(ListVo listVo) {
		return ((sqlSession.insert("android.add", listVo)) == 1);
	}

	public List<ListVo> getList(String id) {
		System.out.println("idididid : " + id);
		List<ListVo> list = sqlSession.selectList("android.getListById", id);
		System.out.println(list.toString());
		return list;
	}

	public boolean updateList(ListVo listVo) {
		int count = sqlSession.update("android.updateList", listVo);
		return count == 1;

	}

	public boolean deleteList(String listId) {
		int count = sqlSession.update("android.deleteListByListId", listId);
		return count == 1;
	}

	public List<ListVo> getLocationVos(Map<String, String> dateMap) {
		return sqlSession.selectList("android.getListLocationByDate", dateMap);
	}

}
