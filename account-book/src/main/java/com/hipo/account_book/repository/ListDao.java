package com.hipo.account_book.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hipo.account_book.vo.ListVo;
@Repository
public class ListDao {
@Autowired
private SqlSession sql;

	public List<ListVo> list(ListVo vo) {
		System.out.println(" 다오 !!!!!!아이디 ! 불러옵니다" + vo);
		List<ListVo> list = sql.selectList("listview.list",vo); 
		System.out.println("리스트 불러옵니까????" + list);
		return list;
	}


	public boolean delete(ListVo vo) {
		 sql.delete("listview.delete",vo);
		 return false;
	}


	public int add(ListVo vo) {
		System.out.println("제발 형님 가지고 오시나요" + vo);
		return sql.insert("listview.add",vo);
		 
	}


	public boolean modify(ListVo vo) {
		sql.update("listview.modify",vo);
		return false;
	}

}
