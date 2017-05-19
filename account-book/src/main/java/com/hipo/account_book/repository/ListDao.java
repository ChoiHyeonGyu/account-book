package com.hipo.account_book.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hipo.account_book.vo.ListVo;
@Repository
public class ListDao {
@Autowired
private SqlSession sql;

	public List<ListVo> list(ListVo vo) {
		List<ListVo> list = sql.selectList("listview.list",vo); 
		return list;
	}


	public boolean delete(ListVo vo) {
		 sql.delete("listview.delete",vo);
		 return false;
	}


	public int add(ListVo vo) {
		return sql.insert("listview.add",vo);
		 
	}


	public ListVo modify(int i) {
		return sql.selectOne("listview.modify", i);
	}
	
	public boolean modify1(ListVo vo) {
		sql.update("listview.modify1", vo);
		return false;
		
		
	}
	public int dealWithSearching(String searching) {
		
		return sql.selectOne("listview.dealwithsearching", searching);
		
	}
	public List<ListVo> totalList(String searching, int page, int listSize, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searching",searching);
		map.put("page",page);  
		map.put("listSize",listSize);
		map.put("id",id);
		return sql.selectList("listview.totallist",map);
	}
	
	public ListVo selectlocation(int listId){
		return sql.selectOne("listview.selectlocation", listId);
	}
}
