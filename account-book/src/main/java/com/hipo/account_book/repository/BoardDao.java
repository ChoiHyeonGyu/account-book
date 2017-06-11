package com.hipo.account_book.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hipo.account_book.vo.BoardVo;
import com.hipo.account_book.vo.GraphDateVo;
import com.hipo.account_book.vo.GraphVo;

@Repository
public class BoardDao {
	@Autowired
	private SqlSession sqlSession;
	
	public String usernameselect(String id){
		return sqlSession.selectOne("board.usernameselect", id);
	}
	
	public String findidselect(String boardid){
		return sqlSession.selectOne("board.findidselect", boardid);
	}
	
	public void boardinsert(BoardVo boardvo){
		sqlSession.insert("board.boardinsert", boardvo);
	}
	
	public int boardidselect(BoardVo boardvo){
		return sqlSession.selectOne("board.boardidselect", boardvo);
	}
	
	public void imagesave(BoardVo boardvo){
		sqlSession.insert("board.imageinsert", boardvo);
	}
	
	public List<BoardVo> contentselect(int num){
		return sqlSession.selectList("board.contentselect", num);
	}
	
	public void boardupdate(BoardVo boardvo){
		sqlSession.update("board.boardupdate", boardvo);
	}
	
	public List<BoardVo> imagelist(int id){
		return sqlSession.selectList("board.imageselect", id);
	}
	
	public void imagedelete(int id){
		sqlSession.delete("board.imagedelete", id);
	}
	
	public void boarddelete(int num){
		sqlSession.delete("board.boarddelete", num);
	}
	
	public int boardcount(String search){
		return sqlSession.selectOne("board.boardcount", search);
	}
	
	public List<BoardVo> getList(String keyword, Integer page, Integer size){
		Map<String, Object> map = new HashMap<String, Object>();// map으로 담으면 xml사용가능?? 가능하다면 형식물어보기.
		map.put("keyword", keyword);
		map.put("page", page);
		map.put("size", size);
		return sqlSession.selectList("board.getList", map);
	}
	
	public List<BoardVo> getList(String id, String keyword, Integer page, Integer size){
		Map<String, Object> map = new HashMap<String, Object>();// map으로 담으면 xml사용가능?? 가능하다면 형식물어보기.
		map.put("id", id);
		map.put("keyword", keyword);
		map.put("page", page);
		map.put("size", size);
		return sqlSession.selectList("board.getList", map);
	}
	
	public List<BoardVo> commentsselect(int num){
		return sqlSession.selectList("board.commentsselect", num);
	}
	
	public void commentinsert(BoardVo boardvo){
		sqlSession.insert("board.commentinsert", boardvo);
	}
	
	public int commentidselect(BoardVo boardvo){
		return sqlSession.selectOne("board.commentidselect", boardvo);
	}
	
	public void boardcommentsinsert(BoardVo boardvo){
		sqlSession.insert("board.boardcommentsinsert", boardvo);
	}
	
	public List<BoardVo> replysselect(int num){
		return sqlSession.selectList("board.replysselect", num);
	}
	
	public void replyinsert(BoardVo boardvo){
		sqlSession.insert("board.replyinsert", boardvo);
	}
	
	public void boardcommentsdelete(int num){
		sqlSession.delete("board.boardcommentsdelete", num);
	}
	
	public void commentdelete(int num){
		sqlSession.delete("board.commentdelete", num);
	}
	
	public void hit(int num){
		sqlSession.update("board.hit", num);
	}
	
	public int gdselect(BoardVo boardvo){
		return sqlSession.selectOne("board.gdselect", boardvo);
	}
	
	public void gdinsert(BoardVo boardvo){
		sqlSession.insert("board.gdinsert", boardvo);
	}
	
	public void gddelete(int num){
		sqlSession.insert("board.gddelete", num);
	}
	
	public void good(int num){
		sqlSession.update("board.good", num);
	}
	
	public List<GraphVo> limitgraphselect(String id){
		return sqlSession.selectList("board.limitgraphselect", id);
	}
	
	public List<GraphVo> movelimitgraphselect(Map<String, Object> map){
		List<GraphVo> vo= sqlSession.selectList("board.movelimitgraphselect", map);
	return vo;
	}
	
	public List<GraphVo> importgraphselect(String id){
		return sqlSession.selectList("board.importgraphselect", id);
	}
	
	public List<GraphVo> exportgraphselect(String id){
		return sqlSession.selectList("board.exportgraphselect", id);
	}
	
	public List<GraphVo> imreporttableselect(Map<String, Object> map){
		return sqlSession.selectList("board.imreporttableselect", map);
	}
	
	public GraphVo imreporttablesumselect(Map<String, Object> map){
		return sqlSession.selectOne("board.imreporttablesumselect", map);
	}
	
	public List<GraphVo> exreporttableselect(Map<String, Object> map){
		return sqlSession.selectList("board.exreporttableselect", map);
	}
	
	public GraphVo exreporttablesumselect(Map<String, Object> map){
		return sqlSession.selectOne("board.exreporttablesumselect", map);
	}
	
	public GraphVo dateselect(int i){
		return sqlSession.selectOne("board.dateselect", i);
	}
	
	public GraphDateVo datedetailselect(Map<String, Object> map){
		return sqlSession.selectOne("board.datedetailselect", map);
	}
	
	public List<GraphDateVo> pselectedtableselect(Map<String, Object> map){
		return sqlSession.selectList("board.pselectedtableselect", map);
	}
	
	public List<GraphDateVo> mselectedtableselect(Map<String, Object> map){
		return sqlSession.selectList("board.mselectedtableselect", map);
	}
	
	public GraphDateVo pselectedtablesumselect(Map<String, Object> map){
		return sqlSession.selectOne("board.pselectedtablesumselect", map);
	}
	
	public GraphDateVo mselectedtablesumselect(Map<String, Object> map){
		return sqlSession.selectOne("board.mselectedtablesumselect", map);
	}
	
	public List<GraphVo> pselectmonth(Map<String, Object> map){
		return sqlSession.selectList("board.pselectmonth", map);
	}
	
	public List<GraphVo> mselectmonth(Map<String, Object> map){
		return sqlSession.selectList("board.mselectmonth", map);
	}
	
	public List<GraphVo> graphjinanmonthselect(){
		return sqlSession.selectList("board.graphjinanmonthselect");
	}
	
	public List<GraphVo> graphttmonthselect(){
		return sqlSession.selectList("board.graphttmonthselect");
	}
	
	public List<GraphVo> allexportgraphselect(){
		return sqlSession.selectList("board.allexportgraphselect");
	}
	
	public List<GraphVo> alllimitgraphselect(){
		return sqlSession.selectList("board.alllimitgraphselect");
	}
	
	public List<GraphVo> graphjinanmonthselect1(Map<String, Object> map){
		return sqlSession.selectList("board.graphjinanmonthselect1", map);
	}
	
	public List<GraphVo> graphttmonthselect1(Map<String, Object> map){
		return sqlSession.selectList("board.graphttmonthselect1", map);
	}
	
	public List<GraphVo> allexportgraphselect1(Map<String, Object> map){
		return sqlSession.selectList("board.allexportgraphselect1", map);
	}
	
	public List<GraphVo> alllimitgraphselect1(Map<String, Object> map){
		return sqlSession.selectList("board.alllimitgraphselect1", map);
	}
}
