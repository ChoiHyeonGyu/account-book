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
	
	public boolean add(OptionVo vo) {
		sql.insert("option.add",vo);
		return false;
	}
	
	public boolean add1(OptionVo vo) {
		sql.insert("option.add1",vo);
		return false;
	}
	
	public int add2(OptionVo vo) {
		int num = sql.selectOne("option.add2",vo);
		return num;
		
	}
	
	public OptionVo categoryModify(int i) {
		return sql.selectOne("option.categoryModify", i);
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
		sql.delete("option.delete",vo);
		 return false;
	}
}
