package com.hipo.account_book.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hipo.account_book.repository.AndroidListDao;
import com.hipo.account_book.utils.SettingMaxDate;
import com.hipo.account_book.vo.ListVo;

@Service
public class AndroidListService {

	@Autowired
	private AndroidListDao listDao;

	public boolean addList(ListVo listVo) {
		System.out.println("(AndroidService)listVo! : " + listVo);
		return listDao.addList(listVo);
	}

	public List<ListVo> getList(String id) {
		return listDao.getList(id);
	}

	public boolean updateList(ListVo listVo) {
		return listDao.updateList(listVo);
	}

	public boolean deleteList(String listId) {
		return listDao.deleteList(listId);
	}

	public String getSumPaid(String year, String month, String id) {
		Map<String, String> dateMap = setDateMap(year, month, id);
		List<ListVo> listVo = listDao.getLocationVos(dateMap);
		int sum = 0;
		for (int i = 0; i < listVo.size(); i++) {
			sum += listVo.get(i).getMoney();
		}
		return String.valueOf(sum);
	}

	public List<ListVo> getLocationVos(String year, String month, String id) {
		Map<String, String> dateMap = setDateMap(year, month, id);
		return listDao.getLocationVos(dateMap);
	}

	private Map<String, String> setDateMap(String year, String month, String id) {
		Map<String, String> dateMap = new HashMap<>();
		dateMap.put("id", id);
		dateMap.put("year", year);
		dateMap.put("month", month);
		dateMap.put("minday", year + "/" + month + "/" + "1");
		SettingMaxDate.setMaxDate(dateMap, year, month);
		System.out.println(dateMap.get("minday"));
		System.out.println(dateMap.get("maxday"));
		return dateMap;
	}

}
