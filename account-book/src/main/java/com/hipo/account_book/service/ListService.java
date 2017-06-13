package com.hipo.account_book.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hipo.account_book.repository.ListDao;
import com.hipo.account_book.repository.OptionDao;
import com.hipo.account_book.vo.ListVo;
import com.hipo.account_book.vo.OptionVo;

@Service
public class ListService {
	@Autowired
	public ListDao dao;
	@Autowired
	private OptionDao optionDao;
	String id1 ="";
	private static final int LIST_SIZE = 10;
	private static final int PAGE_SIZE = 10;
	private static String info = "";
	private static int money = 0;
	
	public List<ListVo> getList(ListVo vo) {
		List<ListVo> list = dao.list(vo);
		return list;
	}

	public boolean delete(ListVo vo) {
		return dao.delete(vo);
	}

	public ListVo add(ListVo vo) {
		dao.add(vo);
		return null;
	}

	public ListVo modify(int i) {
		ListVo listVo = dao.modify(i);
		return listVo;
	}

	public boolean modify1(ListVo vo) {
		dao.modify1(vo);
		return false;
	}
	
	public Map<String, Object> movelist(String operation, int pagination, String searching, String id) {//웹 리스트 에뜸 웹에 직방.

		int totalCount = dao.dealWithSearching(Integer.parseInt(operation), searching, id);//coz how many things are there,
		int pageCount = (int) Math.ceil((double) totalCount / LIST_SIZE);
		int blockCount = (int) Math.ceil((double) pageCount / PAGE_SIZE);
		int currentBlock = (int) Math.ceil((double) pagination / PAGE_SIZE);

		// 2. 파라미터 page 값 검증
		if (pagination < 1) {
			pagination = 1;
			currentBlock = 1;
		} else if (pagination > pageCount) {
			pagination = pageCount;
			currentBlock = (int) Math.ceil((double) pagination / PAGE_SIZE);
		}

		// 3. view에서 페이지 리스트를 렌더링 하기위한 데이터 값 계산
		int beginPage = currentBlock == 0 ? 1 : (currentBlock - 1) * PAGE_SIZE + 1;
		int prevPage = (currentBlock > 1) ? (currentBlock - 1) * PAGE_SIZE : 0;
		int nextPage = (currentBlock < blockCount) ? currentBlock * PAGE_SIZE + 1 : 0;
		int endPage = (nextPage > 0) ? (beginPage - 1) + LIST_SIZE : pageCount;

		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", dao.movelistselect(Integer.parseInt(operation), searching, pagination, LIST_SIZE, id));// actually lot of info  include listvo coz that's result as sql query.!!
		map.put("totalCount", totalCount);//페이지 정보를 가지고 또다른 결과값을 불러낼수 있음 javascrip.
		map.put("listSize", LIST_SIZE);
		map.put("pagination", pagination);
		map.put("beginPage", beginPage);
		map.put("endPage", endPage);
		map.put("prevPage", prevPage);
		map.put("nextPage", nextPage);
		map.put("searching", searching);
		map.put("v2", dao.totalmonth(id, operation));// 이것은 쿼리문의 결과값을 맵에 저장 .!!
		map.put("v3", dao.totalmonth1(id, operation));
		map.put("v4", dao.totalmonth2(id, operation));
		map.put("v5", dao.totalmoney(id, operation));
		map.put("categorylist",dao.getcategory(id));
		ListVo vo = new ListVo();
		 vo.setId(id);
		 id1 = vo.getId();
		id = id1.replaceAll("123","admin");
		map.put("operationslist",dao.operations(id))  ;

		return map;
	}

	public ListVo loadmap(String listId) {
		return dao.selectlocation(Integer.parseInt(listId.substring(4)));
	}

	public ListVo totalmonth(String id, String operation) {
		 return dao.totalmonth(id, operation);
	}

	public ListVo totalmonth1(String id, String operation) {	
		return dao.totalmonth1(id, operation);
	}
	public List<ListVo> categorylist(String id) {
		
		return dao.getcategory(id);
	}

	public Object modify2(Map<String, Object> s) {
		dao.modify2(s);/* 날짜! */
		return null;
	}

	public Object modify3(Map<String, Object> map) {
		 /* 상호명 이름*/
		String id = map.get("listId").toString();
		id = id.replaceAll("a","");
		id = id.replaceAll("abcdefgh","");
		info = map.get("name").toString();
		
		dao.modify3(id,info);
		return null;
	}

	public Object modify4(Map<String, Object> map) {
		/* 돈!!! */
		String id = map.get("listId").toString();
		id = id.replaceAll("b","");
		info = (map.get("money").toString());
		info = info.replaceAll(" ","");
		info = info.replaceAll(",","");
		money = Integer.parseInt(info);
		dao.modify4(id,money);
		return null;
	}

	public Object modify5(Map<String, Object> map) {
		/* 은행 !*/
		String id = map.get("listId").toString();
		id = id.replaceAll("c","");
		info = map.get("bank").toString();
		dao.modify5(id,info);
		return null;
	}

	public Object modify6(Map<String, Object> map) {
		String id = map.get("listId").toString();
		id = id.replaceAll("e","");
		info = map.get("paid").toString();
		
		dao.modify6(id,info);
		return null;
	}

	public List<OptionVo> modify7(Map<String, Object> map) {
		String id = map.get("listId").toString();
		id = id.replaceAll("d","");
		OptionVo optionvo = new OptionVo();
		optionvo.setId(map.get("id").toString());
		dao.modify7(id, map.get("operations").toString());
		if(map.get("operations").toString().equals("+")){
			return optionDao.pluscategory(optionvo);
		} else if(map.get("operations").toString().equals("-")) {
			return optionDao.minuscategory(optionvo);
		} else if(map.get("operations").toString().equals("0")) {
			return optionDao.investmentcategory(optionvo);
		}
		return null;
	}

	public Object modify8(Map<String, Object> map) {
		String id = map.get("listId").toString();
		id = id.replaceAll("f","");
		info = map.get("category").toString();
		dao.modify8(id,info);
		return null;
	}

	public Object operationslist(String id) {
		ListVo vo = new ListVo();
		 vo.setId(id);
		 id1 = vo.getId();
		id = id1.replaceAll("123","admin");// admin 으로 바꿔서 투자 나오게 함.
		List<ListVo> s = dao.operations(id);
		return s ;
	}

	public ListVo totalmonth2(String id, String operation) {
		return dao.totalmonth2(id, operation) ;
	}

	public ListVo totalmoney(String id, String operation) {
		 ListVo vo = dao.totalmoney(id,operation);
		 return vo ;
	}

	public List<ListVo> operationCategory(String id) {
		List<ListVo> list = dao.operationCategory(id);
		List<ListVo> list1 = dao.operations(list);
		 return list1;
	}

	
}
