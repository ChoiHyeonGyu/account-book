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
		List<ListVo> list = sql.selectList("listview.list", vo);
		return list;
	}

	public boolean delete(ListVo vo) {
		sql.delete("listview.delete", vo);
		return false;
	}

	public int add(ListVo vo) {
		return sql.insert("listview.add", vo);

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
		map.put("operation", operation);
		map.put("searching", searching);
		map.put("id", id);
		return sql.selectOne("listview.dealwithsearching", map);
	}

	public List<ListVo> movelistselect(int operation, String searching, int page, int listSize, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("operation", operation);
		map.put("searching", searching);
		map.put("page", page);
		map.put("listSize", listSize);
		map.put("id", id);
		return sql.selectList("listview.movelistselect", map);
	}

	public ListVo selectlocation(int listId) {
		return sql.selectOne("listview.selectlocation", listId);
	}

	public ListVo totalmonth(String id, String operation) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("operation", operation);// 말그대로,.operation 저장//vo 에 없기때문에 . 여기다
										// 저장후 보냄.
		map.put("id", id);// id 저장
		return sql.selectOne("listview.totalmonth", map);
	}

	public ListVo totalmonth1(String id, String operation) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("operation", operation);
		map.put("id", id);
		return sql.selectOne("listview.totalmonth1", map);
	}

	public ListVo totalmonth2(String id, String operation) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("id",id);
		map.put("operation",operation);
		return sql.selectOne("listview.totalmonth2",map);
	}
	
	public List<ListVo> getcategory(String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);// id 저장
		return sql.selectList("listview.getcategorylist", map);
		 
	}

	public void modify2(Map<String, Object> s) {
		/* 날짜 */
		sql.update("listview.modify2", s);
	}

	public void modify3(String id, String infovo) {
		/* 상호명 이름 */
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("infovo", infovo);
		System.out.println("ididididididdasd = " + map);
		sql.update("listview.modify3", map);

	}

	public void modify4(String id, int money) {
		/* money */
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("money", money);
		System.out.println("인트 스트링 = " + map);
		sql.update("listview.modify4", map);
	}

	public void modify5(String id, String info) {
		/* 은행 ! */
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("info", info);
		System.out.println("ididididididdasd = " + map);
		sql.update("listview.modify5", map);
	}

	public void modify6(String id, String info) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("info", info);
		System.out.println("ididididididdasd = " + map);
		sql.update("listview.modify6", map);
	}

	public void modify7(String id, String info) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("info", info);
		System.out.println("ididididididdasd = " + map);
		sql.update("listview.modify7", map);
	}

	public void modify8(String id, String info) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("info", info);
		sql.update("listview.modify8", map);
	}

	public List<ListVo> operations(String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		return sql.selectList("listview.operationslist",map);
	}


	/*
	 * public int totalmonth(ListVo vo) { System.out.println("돈돈돈돈돈돈" + vo);
	 * return sql.selectOne("listview.totalmonth", vo); }
	 */

	/*
	 * public ListVo totalmonth(ListVo vo) { return
	 * sql.selectOne("listview.totalmoney", parameter); }
	 */
}
