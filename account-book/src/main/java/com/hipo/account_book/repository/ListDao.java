package com.hipo.account_book.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hipo.account_book.vo.BoardVo;
import com.hipo.account_book.vo.GraphVo;
import com.hipo.account_book.vo.ListVo;
import com.hipo.account_book.vo.UserVo;
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
	public List<ListVo> totallist(String searching, int page, int listSize) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searching",searching);
		map.put("page",page);  
		map.put("listSize",listSize);
		return sql.selectList("listview.totallist",map);
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
		Map<String, Object> map = new HashMap<String, Object>();// map으로 담으면 xml사용가능?? 가능하다면 형식물어보기.
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
	
	public void hit(int num){
		sql.update("listview.hit", num);
	}
	
	public int gdselect(BoardVo boardvo){
		return sql.selectOne("listview.gdselect", boardvo);
	}
	
	public void gdinsert(BoardVo boardvo){
		sql.insert("listview.gdinsert", boardvo);
	}
	
	public void good(int num){
		sql.update("listview.good", num);
	}

	public List<GraphVo> graphdayselect(String id){
		return sql.selectList("listview.graphdayselect", id);
	}
	
	public List<GraphVo> graphmonthselect(String id){
		return sql.selectList("listview.graphmonthselect", id);
	}
	
	public List<GraphVo> graphyearselect(String id){
		return sql.selectList("listview.graphyearselect", id);
	}
	
	public List<GraphVo> graphavgdefaultselect(String id){
		return sql.selectList("listview.graphavgdefaultselect");
	}
}
