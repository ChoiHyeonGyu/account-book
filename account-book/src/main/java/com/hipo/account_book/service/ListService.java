package com.hipo.account_book.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hipo.account_book.repository.ListDao;
import com.hipo.account_book.vo.ListVo;

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

	public Map<String, Object> pageSearching(int pagination, String searching, String id) {
		// 1. 페이징을 위한 기본 데이터 계산
		int totalCount = 0;
		
		//String searching1 = ConvertMoneyForm.convertForForm(searching);
		System.out.println("searching 비교대상확인." + searching);
		totalCount = dao.dealWithSearching(searching);
		System.out.println("totalCount checking : "+totalCount);
		// 데이터 수 . 왜
		// 키워드로 // 받는지 }
		// . 걸러서 가지고 오는것
		int pageCount = (int) Math.ceil((double) totalCount / LIST_SIZE);// 리스팅
																			// 되는
																			// 페이지
		int blockCount = (int) Math.ceil((double) pageCount / PAGE_SIZE);// 페이지수
																			// .
		int currentBlock = (int) Math.ceil((double) pagination / PAGE_SIZE);// 현재
																			// 페이지

		// 2. 파라미터 page 값 검증
		if (pagination < 1) {
			pagination = 1;
			currentBlock = 1;
		} else if (pagination > pageCount) {
			pagination = pageCount;
			currentBlock = (int) Math.ceil((double) pagination / PAGE_SIZE);// 이거의
																			// 대한
																			// 이유
																			// 소수점
		}

		// 3. view에서 페이지 리스트를 렌더링 하기위한 데이터 값 계산
		int beginPage = currentBlock == 0 ? 1 : (currentBlock - 1) * PAGE_SIZE + 1;// 이거의
																					// 대한것
		int prevPage = (currentBlock > 1) ? (currentBlock - 1) * PAGE_SIZE : 0;
		int nextPage = (currentBlock < blockCount) ? currentBlock * PAGE_SIZE + 1 : 0;
		int endPage = (nextPage > 0) ? (beginPage - 1) + LIST_SIZE : pageCount;

		Map<String, Object> map = new HashMap<String, Object>();

		System.out.println("숫자 가지고 와라" + searching);
		//String search = ConvertMoneyForm.convertForForm(searching);
		
		/*if (search.equals("")) { // TODO 숫자만 쓰라고 알려주기 totalCount =
			map.put("list", dao.totalList(searching, pagination, LIST_SIZE, id));
			
		} else {
			map.put("list", dao.totalList(search, pagination, LIST_SIZE, id));
		}*/
		map.put("list", dao.totalList(searching, pagination, LIST_SIZE, id));
		/* ListVo vo2= (ListVo) dao.totalList(searching, pagination, LIST_SIZE, id);*/
		map.put("totalCount", totalCount);
		map.put("listSize", LIST_SIZE);
		map.put("pagination", pagination);
		map.put("beginPage", beginPage);// 이것의 값은 . 어디서 뽑습니까
		map.put("endPage", endPage);
		map.put("prevPage", prevPage);
		map.put("nextPage", nextPage);
		map.put("searching", searching);

		return map;

	}

	public int loadmap(String listId) {
		return dao.selectlocation(Integer.parseInt(listId.substring(4)));
	}

	public  int totalmonth(String id) {
		System.out.println("아이디!!!!!!!!!!!!" +id);
		 return dao.totalmonth(id);
		 
	}

	public int totalmonth1(String id) {
		System.out.println("아이디11" +id);	
		return dao.totalmonth1(id);
	}

}
