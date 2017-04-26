package com.hipo.account_book.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hipo.account_book.vo.BoardVo;
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


	public List<ListVo> modify(int i) {
		 sql.update("listview.modify",i);
		return null;
	}
	
	public String usernameselect(String id){
		return sql.selectOne("listview.usernameselect", id);
	}
	
	public void boardinsert(BoardVo boardvo){
		sql.insert("listview.boardinsert", boardvo);
	}
	
	public int boardidselect(BoardVo boardvo){
		return sql.selectOne("listview.boardidselect", boardvo);
	}
	
	public void imagesave(BoardVo boardvo){
		sql.insert("listview.imageinsert", boardvo);
	}
	
	public List<BoardVo> contentselect(int num){
		return sql.selectList("listview.contentselect", num);
	}
	
	public void boardupdate(BoardVo boardvo){
		sql.update("listview.boardupdate", boardvo);
	}
	
	public List<BoardVo> imagelist(int id){
		return sql.selectList("listview.imageselect", id);
	}
	
	public void imagedelete(int id){
		sql.delete("listview.imagedelete", id);
	}
	
	public void boarddelete(int num){
		sql.delete("listview.boarddelete", num);
	}
	
	public int boardcount(String search){
		return sql.selectOne("listview.boardcount", search);
	}
	
	public List<BoardVo> getList(String keyword, Integer page, Integer size){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("page", page);
		map.put("size", size);
		return sql.selectList("listview.getList", map);
	}
	
	public List<BoardVo> commentsselect(int num){
		return sql.selectList("listview.commentsselect", num);
	}
	
	public void commentinsert(BoardVo boardvo){
		sql.insert("listview.commentinsert", boardvo);
	}
	
	public int commentidselect(BoardVo boardvo){
		return sql.selectOne("listview.commentidselect", boardvo);
	}
	
	public void boardcommentsinsert(BoardVo boardvo){
		sql.insert("listview.boardcommentsinsert", boardvo);
	}
	
	public List<BoardVo> replysselect(int num){
		return sql.selectList("listview.replysselect", num);
	}
	
	public void replyinsert(BoardVo boardvo){
		sql.insert("listview.replyinsert", boardvo);
	}
	
	public void boardcommentsdelete(int num){
		sql.delete("listview.boardcommentsdelete", num);
	}
	
	public void commentdelete(int num){
		sql.delete("listview.commentdelete", num);
	}

}
