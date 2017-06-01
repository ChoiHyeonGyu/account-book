package com.hipo.account_book.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hipo.account_book.repository.AndroidChartDao;
import com.hipo.account_book.vo.AndroidCategoryChartVo;

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

	public List<AndroidCategoryChartVo> findCategory(Map<String, String> map, String id) {
		List<AndroidCategoryChartVo> categoryChartList = new ArrayList<>();
		for (int i = 0; i < map.size(); i++) {
			AndroidCategoryChartVo vo = new AndroidCategoryChartVo();
			vo.setCategory(map.get("category" + i));
			vo.setId(id);
			categoryChartList.add(vo);
		}

		Integer sumArr[] = aChartDao.findCategorySum(categoryChartList);

		for (int i = 0; i < sumArr.length; i++) {
			categoryChartList.get(i).setSum(checkIntegerValueNull(sumArr[i]));
		}

		return categoryChartList;
	}

	private Integer checkIntegerValueNull(Integer val) {
		if (val == null) {
			return 0;
		} else {
			return val;
		}
	}
}
