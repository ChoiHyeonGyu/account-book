package com.hipo.account_book.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hipo.account_book.repository.AndroidChartDao;

@Service
public class AndroidChartService {

	@Autowired
	private AndroidChartDao aChartDao;
	
	public Map<String, String> findCategory(String id) {
		List<String> categoryList = aChartDao.findCategory(id);
		Map<String, String> categoryMap = new HashMap<>();
		for (int i = 0; i < categoryList.size(); i++) {
			System.out.println("chartCategoryService : " + categoryList.get(i).toString());
			categoryMap.put("category" + i, categoryList.get(i).toString());
		}
		return categoryMap;
	}

	public Map<String, Integer> findCategory(Map<String, String> map,String id) {
		map.put("id", id);
		aChartDao.findCategory(map);
		return null;
	}

}
