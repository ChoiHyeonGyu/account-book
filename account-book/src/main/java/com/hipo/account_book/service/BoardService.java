package com.hipo.account_book.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.hipo.account_book.repository.BoardDao;
import com.hipo.account_book.vo.BoardVo;
import com.hipo.account_book.vo.GraphDateVo;
import com.hipo.account_book.vo.GraphVo;

@Service
public class BoardService {
	@Autowired
	public BoardDao boardDao;
	
	private static final int LIST_SIZE = 10;
	private static final int PAGE_SIZE = 10;
	
	public void boardadd(String id, BoardVo boardvo, List<MultipartFile> file){
		boardvo.setId(id);
		boardvo.setName(boardDao.usernameselect(id));
		boardDao.boardinsert(boardvo);
		boardvo.setBoardId(boardDao.boardidselect(boardvo));
		try{
			if(file.isEmpty() == true){
				return;
			}
			for(int i=0; i< file.size(); i++)
		    {
		        if(!file.get(i).isEmpty())
		        {
		            CommonsMultipartFile cm = (CommonsMultipartFile) file.get(i);
		            String originalFileName = cm.getOriginalFilename();
		            String extName = originalFileName.substring(originalFileName.lastIndexOf(".")+1,originalFileName.length());
					String saveFileName = generateSaveFileName(extName);
					
					writeFile(cm, saveFileName);
					
					boardvo.setPhoto(saveFileName);
					
					boardDao.imagesave(boardvo);
		        } else {
		        	boardvo.setPhoto(generateSaveFileName("無"));
		        	boardDao.imagesave(boardvo);
		        }
		    }
		} catch(IOException e) {
			new RuntimeException("upload file:"+e);
		}
	}
	
	public void boardedit(String id, BoardVo boardvo, List<MultipartFile> file){
		boardvo.setId(id);
		boardDao.boardupdate(boardvo);
		deleteFile(boardvo.getBoardId());
		boardDao.imagedelete(boardvo.getBoardId());
		try{
			if(file.isEmpty() == true){
				return;
			}
			for(int i=0; i< file.size(); i++)
		    {
		        if(!file.get(i).isEmpty())
		        {
		            CommonsMultipartFile cm = (CommonsMultipartFile) file.get(i);
		            String originalFileName = cm.getOriginalFilename();
		            String extName = originalFileName.substring(originalFileName.lastIndexOf(".")+1,originalFileName.length());
					String saveFileName = generateSaveFileName(extName);
					
					writeFile(cm, saveFileName);
					
					boardvo.setPhoto(saveFileName);
					
					boardDao.imagesave(boardvo);
		        } else {
		        	boardvo.setPhoto(generateSaveFileName("無"));
		        	boardDao.imagesave(boardvo);
		        }
		    }
		} catch(IOException e) {
			new RuntimeException("upload file:"+e);
		}
	}
	
	private String generateSaveFileName(String extName){
		String fileName = "";
		
		Calendar calendar = Calendar.getInstance();
		
		fileName += calendar.get(Calendar.YEAR);
		fileName += calendar.get(Calendar.MONTH);
		fileName += calendar.get(Calendar.DATE);
		fileName += calendar.get(Calendar.HOUR);
		fileName += calendar.get(Calendar.MINUTE);
		fileName += calendar.get(Calendar.SECOND);
		fileName += calendar.get(Calendar.MILLISECOND);
		fileName += ("."+extName);
		return fileName;
	}
	
	private void writeFile(MultipartFile file, String saveFileName) throws IOException{
		byte[] data = file.getBytes();
		FileOutputStream fos = new FileOutputStream("/image/"+saveFileName);
		fos.write(data);
		fos.close();
	}
	
	private void deleteFile(int id){
		for(int i=0; i<boardDao.imagelist(id).size(); i++){
			File file = new File("C:/image/"+boardDao.imagelist(id).get(i).getPhoto());
			if(file.exists()){
				file.delete();
			}
		}
	}
	
	public List<BoardVo> boardcontent(int num){
		return boardDao.contentselect(num);
	}
	
	public List<BoardVo> boardcontenttable(String id, Map<String, Object> map){
		map = arraysettings(map.get("month").toString());
		map.put("id", id);
		map.put("boardid", map.get("boardid").toString());
		System.out.println(map);
		return boardDao.contenttableselect(map);
	}
	
	public void boardremove(int num){
		boardDao.imagedelete(num);
		
		List<BoardVo> list = boardDao.commentsselect(num);
		Iterator<BoardVo> iterator = list.iterator();
		while(iterator.hasNext()){
			int num2 = iterator.next().getCommentId();
			boardDao.boardcommentsdelete(num2);
			boardDao.commentdelete(num2);
		}
		boardDao.gddelete(num);
		boardDao.boarddelete(num);
	}
	
	public Map<String, Object> getBoardList(int currentPage, String keyword){
		//1. 페이징을 위한 기본 데이터 계산
		int totalCount = boardDao.boardcount(keyword); // 데이터 수 . 왜 키워드로 받는지 . 걸러서 가지고 오는것
		int pageCount = (int)Math.ceil( (double)totalCount / LIST_SIZE );//리스팅 되는 페이지
		int blockCount = (int)Math.ceil( (double)pageCount / PAGE_SIZE );//페이지수 .
		int currentBlock = (int)Math.ceil( (double)currentPage / PAGE_SIZE );//현재 페이지
		
		//2. 파라미터 page 값  검증
		if( currentPage < 1 ) {
			currentPage = 1;
			currentBlock = 1;
		} else if( currentPage > pageCount ) {
			currentPage = pageCount;
			currentBlock = (int)Math.ceil( (double)currentPage / PAGE_SIZE );//이거의 대한 이유 소수점
		}
		
		//3. view에서 페이지 리스트를 렌더링 하기위한 데이터 값 계산
		int beginPage = currentBlock == 0 ? 1 : (currentBlock - 1)*PAGE_SIZE + 1;//이거의 대한것
		int prevPage = ( currentBlock > 1 ) ? ( currentBlock - 1 ) * PAGE_SIZE : 0;
		int nextPage = ( currentBlock < blockCount ) ? currentBlock * PAGE_SIZE + 1 : 0;
		int endPage = ( nextPage > 0 ) ? ( beginPage - 1 ) + LIST_SIZE : pageCount;
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put( "list", boardDao.getList(keyword, currentPage, LIST_SIZE) );
		map.put( "totalCount", totalCount );
		map.put( "listSize", LIST_SIZE );
		map.put( "currentPage", currentPage );
		map.put( "beginPage", beginPage );// 이것의 값은 . 어디서 뽑습니까
		map.put( "endPage", endPage );
		map.put( "prevPage", prevPage );
		map.put( "nextPage", nextPage );
		map.put( "keyword", keyword );
		
		return map;
	}
	
	public Map<String, Object> getBoardList(String id, int currentPage, String keyword){
		//1. 페이징을 위한 기본 데이터 계산
		int totalCount = boardDao.boardcount(keyword); // 데이터 수 . 왜 키워드로 받는지 . 걸러서 가지고 오는것
		int pageCount = (int)Math.ceil( (double)totalCount / LIST_SIZE );//리스팅 되는 페이지
		int blockCount = (int)Math.ceil( (double)pageCount / PAGE_SIZE );//페이지수 .
		int currentBlock = (int)Math.ceil( (double)currentPage / PAGE_SIZE );//현재 페이지
		
		//2. 파라미터 page 값  검증
		if( currentPage < 1 ) {
			currentPage = 1;
			currentBlock = 1;
		} else if( currentPage > pageCount ) {
			currentPage = pageCount;
			currentBlock = (int)Math.ceil( (double)currentPage / PAGE_SIZE );//이거의 대한 이유 소수점
		}
		
		//3. view에서 페이지 리스트를 렌더링 하기위한 데이터 값 계산
		int beginPage = currentBlock == 0 ? 1 : (currentBlock - 1)*PAGE_SIZE + 1;//이거의 대한것
		int prevPage = ( currentBlock > 1 ) ? ( currentBlock - 1 ) * PAGE_SIZE : 0;
		int nextPage = ( currentBlock < blockCount ) ? currentBlock * PAGE_SIZE + 1 : 0;
		int endPage = ( nextPage > 0 ) ? ( beginPage - 1 ) + LIST_SIZE : pageCount;
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put( "list", boardDao.getList(id, keyword, currentPage, LIST_SIZE) );
		map.put( "totalCount", totalCount );
		map.put( "listSize", LIST_SIZE );
		map.put( "currentPage", currentPage );
		map.put( "beginPage", beginPage );// 이것의 값은 . 어디서 뽑습니까
		map.put( "endPage", endPage );
		map.put( "prevPage", prevPage );
		map.put( "nextPage", nextPage );
		map.put( "keyword", keyword );
		
		return map;
	}
	
	public List<BoardVo> commentlist(int num){
		return boardDao.commentsselect(num);
	}
	
	public void comment(String id, BoardVo boardvo){
		boardvo.setId(id);
		boardDao.commentinsert(boardvo);
		boardvo.setCommentId(boardDao.commentidselect(boardvo));
		boardDao.boardcommentsinsert(boardvo);
	}
	
	public List<BoardVo> replylist(int num){
		return boardDao.replysselect(num);
	}
	
	public void reply(String id, BoardVo boardvo){
		boardvo.setId(id);
		boardDao.replyinsert(boardvo);
	}
	
	public void commentremove(int num){
		boardDao.boardcommentsdelete(num);
		boardDao.commentdelete(num);
	}
	
	public void hit(int num){
		boardDao.hit(num);
	}
	
	public boolean good(String id, int num){
		BoardVo boardvo = new BoardVo();
		boardvo.setId(id);
		boardvo.setBoardId(num);
		if(boardDao.gdselect(boardvo) >= 1){
			return false;
		}
		boardDao.gdinsert(boardvo);
		boardDao.good(num);
		return true;
	}
	
	public List<GraphVo> limitgraph(String id){
		return boardDao.limitgraphselect(id);
	}
	
	public List<GraphVo> movelimitgraph(Map<String, Object> map){
		return boardDao.movelimitgraphselect(map);
	}
	
	public List<GraphVo> importgraph(String id){
		return boardDao.importgraphselect(id);
	}
	
	public List<GraphVo> exportgraph(String id){
		return boardDao.exportgraphselect(id);
	}
	
	public List<GraphVo> imreporttable(String id){
		return boardDao.imreporttableselect(id);
	}
	
	public GraphVo imreporttablesum(String id){
		return boardDao.imreporttablesumselect(id);
	}
	
	public List<GraphVo> exreporttable(String id){
		return boardDao.exreporttableselect(id);
	}
	
	public GraphVo exreporttablesum(String id){
		return boardDao.exreporttablesumselect(id);
	}
	
	public GraphVo date(){
		return boardDao.dateselect();
	}
	
	public GraphDateVo datedetail(String month){
		return boardDao.datedetailselect(arraysettings(month));
	}
	
	public List<GraphDateVo> pselectedtable(String id, String month){
		Map<String, Object> map = arraysettings(month);
		map.put("id", id);
		return boardDao.pselectedtableselect(map);
	}
	
	public List<GraphDateVo> mselectedtable(String id, String month){
		Map<String, Object> map = arraysettings(month);
		map.put("id", id);
		return boardDao.mselectedtableselect(map);
	}
	
	public GraphDateVo pselectedtablesum(String id, String month){
		Map<String, Object> map = arraysettings(month);
		map.put("id", id);
		return boardDao.pselectedtablesumselect(map);
	}
	
	public GraphDateVo mselectedtablesum(String id, String month){
		Map<String, Object> map = arraysettings(month);
		map.put("id", id);
		return boardDao.mselectedtablesumselect(map);
	}
	
	private Map<String, Object> arraysettings(String month){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("month", month);
		String[] array1 = {"01","03","05","07","08","10","12"};
		map.put("array1", array1);
		String[] array2 = {"04", "06", "09", "11"};
		map.put("array2", array2);
		return map;
	}
	
	public List<GraphVo> pselectedmonth(Map<String, Object> map){
		return boardDao.pselectmonth(map);
	}
	
	public List<GraphVo> mselectedmonth(Map<String, Object> map){
		return boardDao.mselectmonth(map);
	}
	
	public List<GraphVo> graphjinanmonth(){
		return boardDao.graphjinanmonthselect();
	}
	
	public List<GraphVo> graphttmonth(){
		return boardDao.graphttmonthselect();
	}
	
	public List<GraphVo> allexportgraph(){
		return boardDao.allexportgraphselect();
	}
	
	public List<GraphVo> alllimitgraph(){
		return boardDao.alllimitgraphselect();
	}
	
	public Map<String, Object> transgraphavg(Map<String, Object> map){
		map.put("profitbegin", 0);
		map.put("profitend", 0);
		if(map.get("profit").toString().equals("100만원 이하")){
			map.put("profitend", "100");
		}
		for(int i=100; i<=950; i+=50){
			if(map.get("profit").toString().equals((i+"만원 ~ "+(i+50)+"만원 사이").toString())){
				map.put("profitbegin", i);
				map.put("profitend", i+50);
			}
		}
		for(int i=1000; i<=9000; i+=500){
			if(map.get("profit").toString().equals((i+"만원 ~ "+(i+500)+"만원 사이").toString())){
				map.put("profitbegin", i);
				map.put("profitend", i+500);
			}
		}
		if(map.get("profit").toString().equals("9500만원 ~ 1억원 사이")){
			map.put("profitbegin", 9500);
			map.put("profitend", 10000);
		}
		if(map.get("profit").toString().equals("1억원 이상")){
			map.put("profitbegin", 10000);
			map.put("profitend", 1000000000);
		}
		Map<String, Object> mapresult = new HashMap<String, Object>();
		mapresult.put("gjms", boardDao.graphjinanmonthselect1(map));
		mapresult.put("gtms", boardDao.graphttmonthselect1(map));
		mapresult.put("aegs", boardDao.allexportgraphselect1(map));
		mapresult.put("algs", boardDao.alllimitgraphselect1(map));
		return mapresult;
	}
}
