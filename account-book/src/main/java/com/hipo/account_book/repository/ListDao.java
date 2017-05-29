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
	public int dealWithSearching(int operation, String searching, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("operation",operation);
		map.put("searching",searching);
		map.put("id",id);
		return sql.selectOne("listview.dealwithsearching", map);
	}
	
	public List<ListVo> movelistselect(int operation, String searching, int page, int listSize, String id){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("operation",operation);
		map.put("searching",searching);
		map.put("page",page);  
		map.put("listSize",listSize);
		map.put("id",id);
		return sql.selectList("listview.movelistselect", map);
	}
	
	public int selectlocation(int listId){
		return sql.selectOne("listview.selectlocation", listId);
	}


	public ListVo totalmonth(String id, String operation) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("operation",operation);// 말그대로,.operation 저장
		map.put("id",id);// id 저장
		return sql.selectOne("listview.totalmonth", map);
	}


	public ListVo totalmonth1(String id, String operation) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("operation",operation);
		map.put("id",id);
		return sql.selectOne("listview.totalmonth1", map);
	}


/*	public int totalmonth(ListVo vo) {
		System.out.println("돈돈돈돈돈돈" + vo);
		return sql.selectOne("listview.totalmonth", vo);
	}
*/

/*	public ListVo totalmonth(ListVo vo) {
		return sql.selectOne("listview.totalmoney", parameter);
	}*/
}
