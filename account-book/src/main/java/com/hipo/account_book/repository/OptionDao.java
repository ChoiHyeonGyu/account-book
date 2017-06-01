package com.hipo.account_book.repository;

import java.util.List;

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
		System.out.println("daodaodao"+i);
		return sql.selectOne("option.categoryModify", i);
	}
	
	public OptionVo limitModify2(String category) {
		OptionVo vo;
		System.out.println("daodaodao"+category);
		vo = sql.selectOne("option.limitMdify2", category);
		System.out.println("livolivo::"+vo);
		return sql.selectOne("option.limitMdify2", category);
	}
	
	public boolean categoryModify1(OptionVo vo) {
		sql.update("option.categoryModify1", vo);
		return false;
		
		
	}
	
	public List<OptionVo> category(OptionVo vo) {
		List<OptionVo> category = sql.selectList("option.category",vo);
		return category;
	}
	
	public boolean delete(OptionVo vo) {
		System.out.println("딜리딜리디리디....."+vo);
		sql.delete("option.delete",vo);
		 return false;
	}
	
	public void reset(String id){
		sql.delete("option.resetcategory", id);
		sql.delete("option.resetlist", id);
		
	}
}
