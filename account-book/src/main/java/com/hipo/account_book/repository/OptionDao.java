package com.hipo.account_book.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hipo.account_book.vo.ListVo;
import com.hipo.account_book.vo.OptionVo;

@Repository
public class OptionDao {
	@Autowired
	private SqlSession sql;
	
	public void add(OptionVo vo) {
		sql.insert("option.add",vo);	
	}
	
	public int add1(String category) {
		return sql.selectOne("option.add1",category);
	}
	
	public void add2(OptionVo vo) {
		System.out.println("ddddddddaddddd*****"+vo);
		sql.insert("option.add2",vo);	
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
	
	public boolean categoryModify1(OptionVo vo) {
		sql.update("option.categoryModify1", vo);
		return false;
		
		
	}
	
	public List<OptionVo> category(OptionVo vo) {
		List<OptionVo> category = sql.selectList("option.category",vo);
		System.out.println(" 카테카테카테카테카테" + vo);
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
