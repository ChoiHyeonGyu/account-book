package com.hipo.account_book.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.hipo.account_book.repository.ListDao;
import com.hipo.account_book.vo.BoardVo;
import com.hipo.account_book.vo.GraphVo;
import com.hipo.account_book.vo.ListVo;
import com.hipo.account_book.vo.UserVo;

@Service
public class ListService {
	@Autowired
	public ListDao dao;
	
	private static final int LIST_SIZE = 10;
	private static final int PAGE_SIZE = 10;

	public List<ListVo> getList(ListVo vo) {
		List<ListVo> list = dao.list(vo);

		return list;
	}

	public boolean delete(ListVo vo) {
		return dao.delete(vo); 
		
	}

	public String add(ListVo vo) {
		int list = dao.add(vo);
		return null;
	}

	public ListVo modify(int i) {
		return dao.modify(i);
	}
	
	public boolean modify1(ListVo vo) {
		dao.modify1(vo);
		return false;
	}
	public Map<String,Object> pageSearching(int pagination, String searching) {
		//1. 페이징을 위한 기본 데이터 계산

		int totalCount = dao.dealWithSearching(searching); // 데이터 수 . 왜 키워드로 받는지 . 걸러서 가지고 오는것
		int pageCount = (int)Math.ceil( (double)totalCount / LIST_SIZE );//리스팅 되는 페이지
		int blockCount = (int)Math.ceil( (double)pageCount / PAGE_SIZE );//페이지수 .
		int currentBlock = (int)Math.ceil( (double)pagination / PAGE_SIZE );//현재 페이지
		
		//2. 파라미터 page 값  검증
		if( pagination < 1 ) { 
			pagination = 1; 
			currentBlock = 1;
		} else if( pagination > pageCount ) {
			pagination = pageCount;
			currentBlock = (int)Math.ceil( (double)pagination / PAGE_SIZE );//이거의 대한 이유 소수점
		}
		
		//3. view에서 페이지 리스트를 렌더링 하기위한 데이터 값 계산
		int beginPage = currentBlock == 0 ? 1 : (currentBlock - 1)*PAGE_SIZE + 1;//이거의 대한것
		int prevPage = ( currentBlock > 1 ) ? ( currentBlock - 1 ) * PAGE_SIZE : 0;
		int nextPage = ( currentBlock < blockCount ) ? currentBlock * PAGE_SIZE + 1 : 0;
		int endPage = ( nextPage > 0 ) ? ( beginPage - 1 ) + LIST_SIZE : pageCount;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put( "list", dao.totallist(searching, pagination, LIST_SIZE) );
		map.put( "totalCount", totalCount );
		map.put( "listSize", LIST_SIZE );
		map.put( "pagination", pagination );
		map.put( "beginPage", beginPage );// 이것의 값은 . 어디서 뽑습니까
		map.put( "endPage", endPage );
		map.put( "prevPage", prevPage );
		map.put( "nextPage", nextPage );
		map.put( "searching", searching );
		
		return map;
		
	}
	
	public ListVo loadmap(String listId){
		return dao.selectlocation(Integer.parseInt(listId.substring(4)));
	}
	
	public void boardadd(String id, BoardVo boardvo, List<MultipartFile> file){
		boardvo.setId(id);
		boardvo.setName(dao.usernameselect(id));
		dao.boardinsert(boardvo);
		boardvo.setBoardId(dao.boardidselect(boardvo));
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
					
					dao.imagesave(boardvo);
		        }
		        boardvo.setPhoto(generateSaveFileName("無"));
				dao.imagesave(boardvo);
		    }
		} catch(IOException e) {
			new RuntimeException("upload file:"+e);
		}
	}
	
	public void boardedit(String id, BoardVo boardvo, List<MultipartFile> file){
		boardvo.setId(id);
		dao.boardupdate(boardvo);
		deleteFile(boardvo.getBoardId());
		dao.imagedelete(boardvo.getBoardId());
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
					
					dao.imagesave(boardvo);
		        } else {
		        	boardvo.setPhoto(generateSaveFileName("無"));
					dao.imagesave(boardvo);
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
		for(int i=0; i<dao.imagelist(id).size(); i++){
			File file = new File("C:/image/"+dao.imagelist(id).get(i).getPhoto());
			if(file.exists()){
				file.delete();
			}
		}
	}
	
	public List<BoardVo> boardcontent(int num){
		return dao.contentselect(num);
	}
	
	public void boardremove(int num){
		dao.imagedelete(num);
		dao.boarddelete(num);
	}
	
	public Map<String, Object> getBoardList(int currentPage, String keyword){
		//1. 페이징을 위한 기본 데이터 계산
		int totalCount = dao.boardcount(keyword); // 데이터 수 . 왜 키워드로 받는지 . 걸러서 가지고 오는것
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
		
		map.put( "list", dao.getList(keyword, currentPage, LIST_SIZE) );
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
		return dao.commentsselect(num);
	}
	
	public void comment(String id, BoardVo boardvo){
		boardvo.setId(id);
		dao.commentinsert(boardvo);
		boardvo.setCommentId(dao.commentidselect(boardvo));
		dao.boardcommentsinsert(boardvo);
	}
	
	public List<BoardVo> replylist(int num){
		return dao.replysselect(num);
	}
	
	public void reply(String id, BoardVo boardvo){
		boardvo.setId(id);
		dao.replyinsert(boardvo);
	}
	
	public void commentremove(int num){
		dao.boardcommentsdelete(num);
		dao.commentdelete(num);
	}
	
	public void hit(int num){
		dao.hit(num);
	}
	
	public boolean good(String id, int num){
		BoardVo boardvo = new BoardVo();
		boardvo.setId(id);
		boardvo.setBoardId(num);
		if(dao.gdselect(boardvo) >= 1){
			return false;
		}
		dao.gdinsert(boardvo);
		dao.good(num);
		return true;
	}
	
	public List<GraphVo> graphday(String id){
		return dao.graphdayselect(id);
	}
	
	public List<GraphVo> graphmonth(String id){
		return dao.graphmonthselect(id);
	}
	
	public List<GraphVo> graphyear(String id){
		return dao.graphyearselect(id);
	}
	
	public List<GraphVo> graphavgdefault(String id){
		return dao.graphavgdefaultselect(id);
	}
	
	public List<GraphVo> transgraphavg(String gen, String age){
		UserVo uservo = new UserVo();
		uservo.setGender(gen);
		uservo.setAge(age);
		return dao.transgraphavgselect(uservo);
	}
	
	public List<GraphVo> transgraphavg1(String gen){
		return dao.transgraphavgselect1(gen);
	}
	
	public List<GraphVo> transgraphavg2(String age){
		return dao.transgraphavgselect2(age);
	}

}
