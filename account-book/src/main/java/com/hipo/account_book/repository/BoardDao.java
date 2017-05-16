package com.hipo.account_book.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hipo.account_book.vo.BoardVo;
import com.hipo.account_book.vo.GraphVo;
import com.hipo.account_book.vo.UserVo;

@Repository
public class BoardDao {
	@Autowired
	private SqlSession sqlSession;
	
	public String usernameselect(String id){
		return sqlSession.selectOne("listview.usernameselect", id);
	}
	
	public void boardinsert(BoardVo boardvo){
		sqlSession.insert("listview.boardinsert", boardvo);
	}
	
	public int boardidselect(BoardVo boardvo){
		return sqlSession.selectOne("listview.boardidselect", boardvo);
	}
	
	public void imagesave(BoardVo boardvo){
		sqlSession.insert("listview.imageinsert", boardvo);
	}
	
	public List<BoardVo> contentselect(int num){
		return sqlSession.selectList("listview.contentselect", num);
	}
	
	public void boardupdate(BoardVo boardvo){
		sqlSession.update("listview.boardupdate", boardvo);
	}
	
	public List<BoardVo> imagelist(int id){
		return sqlSession.selectList("listview.imageselect", id);
	}
	
	public void imagedelete(int id){
		sqlSession.delete("listview.imagedelete", id);
	}
	
	public void boarddelete(int num){
		sqlSession.delete("listview.boarddelete", num);
	}
	
	public int boardcount(String search){
		return sqlSession.selectOne("listview.boardcount", search);
	}
	
	public List<BoardVo> getList(String keyword, Integer page, Integer size){
		Map<String, Object> map = new HashMap<String, Object>();// map으로 담으면 xml사용가능?? 가능하다면 형식물어보기.
		map.put("keyword", keyword);
		map.put("page", page);
		map.put("size", size);
		return sqlSession.selectList("listview.getList", map);
	}
	
	public List<BoardVo> commentsselect(int num){
		return sqlSession.selectList("listview.commentsselect", num);
	}
	
	public void commentinsert(BoardVo boardvo){
		sqlSession.insert("listview.commentinsert", boardvo);
	}
	
	public int commentidselect(BoardVo boardvo){
		return sqlSession.selectOne("listview.commentidselect", boardvo);
	}
	
	public void boardcommentsinsert(BoardVo boardvo){
		sqlSession.insert("listview.boardcommentsinsert", boardvo);
	}
	
	public List<BoardVo> replysselect(int num){
		return sqlSession.selectList("listview.replysselect", num);
	}
	
	public void replyinsert(BoardVo boardvo){
		sqlSession.insert("listview.replyinsert", boardvo);
	}
	
	public void boardcommentsdelete(int num){
		sqlSession.delete("listview.boardcommentsdelete", num);
	}
	
	public void commentdelete(int num){
		sqlSession.delete("listview.commentdelete", num);
	}
	
	public void hit(int num){
		sqlSession.update("listview.hit", num);
	}
	
	public int gdselect(BoardVo boardvo){
		return sqlSession.selectOne("listview.gdselect", boardvo);
	}
	
	public void gdinsert(BoardVo boardvo){
		sqlSession.insert("listview.gdinsert", boardvo);
	}
	
	public void gddelete(int num){
		sqlSession.insert("listview.gddelete", num);
	}
	
	public void good(int num){
		sqlSession.update("listview.good", num);
	}

	public List<GraphVo> graphdayselect(String id){
		return sqlSession.selectList("listview.graphdayselect", id);
	}
	
	public List<GraphVo> graphmonthselect(String id){
		return sqlSession.selectList("listview.graphmonthselect", id);
	}
	
	public List<GraphVo> graphyearselect(String id){
		return sqlSession.selectList("listview.graphyearselect", id);
	}
	
	public List<GraphVo> graphavgdefaultselect(String id){
		return sqlSession.selectList("listview.graphavgdefaultselect", id);
	}
	
	public List<GraphVo> transgraphavgselect(UserVo uservo){
		return sqlSession.selectList("listview.transgraphavgselect", uservo);
	}
	
	public List<GraphVo> transgraphavgselect1(String gen){
		return sqlSession.selectList("listview.transgraphavgselect1", gen);
	}
	
	public List<GraphVo> transgraphavgselect2(String age){
		return sqlSession.selectList("listview.transgraphavgselect2", age);
	}
}
