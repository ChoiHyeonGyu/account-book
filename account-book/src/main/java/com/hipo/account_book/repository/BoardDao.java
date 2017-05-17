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
		return sqlSession.selectOne("board.usernameselect", id);
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

	public List<GraphVo> graphdayselect(String id){
		return sqlSession.selectList("board.graphdayselect", id);
	}
	
	public List<GraphVo> graphmonthselect(String id){
		return sqlSession.selectList("board.graphmonthselect", id);
	}
	
	public List<GraphVo> graphyearselect(String id){
		return sqlSession.selectList("board.graphyearselect", id);
	}
	
	public List<GraphVo> graphavgdefaultselect(String id){
		return sqlSession.selectList("board.graphavgdefaultselect", id);
	}
	
	public List<GraphVo> transgraphavgselect(UserVo uservo){
		return sqlSession.selectList("board.transgraphavgselect", uservo);
	}
	
	public List<GraphVo> transgraphavgselect1(String gen){
		return sqlSession.selectList("board.transgraphavgselect1", gen);
	}
	
	public List<GraphVo> transgraphavgselect2(String age){
		return sqlSession.selectList("board.transgraphavgselect2", age);
	}
}
