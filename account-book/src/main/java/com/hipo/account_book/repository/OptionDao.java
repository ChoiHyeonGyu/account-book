package com.hipo.account_book.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hipo.account_book.vo.OptionVo;

@Repository
public class OptionDao {
	@Autowired
	private SqlSession sql;
	
	public String add0(String category2) {
		return sql.selectOne("option.add0",category2);	
	}
	
	public void add(OptionVo vo) {
		sql.insert("option.add",vo);	
	}
	
	public int add1(OptionVo optionvo) {
		return sql.selectOne("option.add1",optionvo);
	}
	
	public void add2(OptionVo vo) {
		sql.insert("option.add2",vo);	
	}
	
	public int add3(OptionVo optionvo) {
		return sql.selectOne("option.add3",optionvo);
	}
	public String Modify0(String category2) {
		return sql.selectOne("option.modify0",category2);	
	}
	
	public void Modify(OptionVo vo) {
		sql.insert("option.modify",vo);	
	}
	
	public int Modify1(OptionVo optionvo) {
		return sql.selectOne("option.modify1",optionvo);
	}
	
	public void Modify2(OptionVo vo) {
		sql.update("option.modify2",vo);	
	}
	
	public int Modify3(OptionVo optionvo) {
		return sql.selectOne("option.modify3",optionvo);
	}
	
	public void Modify4(OptionVo vo) {
		sql.insert("option.modify4",vo);	
	}
	
	public String Modify5(OptionVo optionvo) {
		return sql.selectOne("option.modify5",optionvo);
	}
	
	public boolean Modify6(OptionVo vo) {
		sql.delete("option.modify6",vo);
		 return false;
	}
	
	public void Modify7(OptionVo vo) {
		sql.insert("option.modify7",vo);	
	}
	
	public String checkPassword(String id){
		return sql.selectOne("option.checkPassword", id);
	}
	
	public int limitModify(OptionVo optionvo){
		return sql.selectOne("option.limitModify", optionvo);
	}
	
	public void limitModify1(OptionVo optionvo){
		sql.update("option.limitModify1", optionvo);
	}
	
	public OptionVo categoryModify(int i) {
		 OptionVo vo = sql.selectOne("option.categoryModify", i);
		 System.out.println("voovvoovovovovovvoovvoo" + vo);
		 return vo;
	}
	
	public OptionVo limitModify2(String category) {
		return sql.selectOne("option.limitMdify2", category);
	}
	
	public boolean categoryModify1(OptionVo vo) {
		System.out.println("수정 !!" + vo);
		sql.insert("option.categoryModify1", vo);
		sql.insert("option.categoryModify2", vo);
		return false;
		
		
	}
	
	public List<OptionVo> category(OptionVo vo) {
		return sql.selectList("option.category",vo);
	}
	public List<OptionVo> pluscategory(OptionVo vo) {
		return sql.selectList("option.pluscategory",vo);
	}
	public List<OptionVo> minuscategory(OptionVo vo) {
		return sql.selectList("option.minuscategory",vo);
	}
	public List<OptionVo> investmentcategory(OptionVo vo) {
		return sql.selectList("option.investmentcategory",vo);
	}
	
	public boolean delete(OptionVo vo) {
		sql.delete("option.delete",vo);
		 return false;
	}
	
	public void reset(String id){
		sql.delete("option.resetcategory", id);
		sql.delete("option.resetlist", id);
		
	}

	public List<OptionVo> operationsCategory(String id) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("id", id);
		return sql.selectList("option.operationsCategory",map);
	}
}
