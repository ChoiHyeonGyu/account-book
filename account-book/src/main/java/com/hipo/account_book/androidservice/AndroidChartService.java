package com.hipo.account_book.androidservice;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hipo.account_book.androidrepository.AndroidChartDao;
import com.hipo.account_book.utils.SettingMaxDate;
import com.hipo.account_book.vo.AndroidCategoryChartVo;
import com.hipo.account_book.vo.GraphVo;

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
		for (int i = 0; i < map.size() - 3; i++) {
			AndroidCategoryChartVo vo = new AndroidCategoryChartVo();
			vo.setCategory(map.get("category" + i));
			vo.setId(id);
			vo.setMinDate((map.get("year") + "/" + map.get("month") + "/" + "01"));
			SettingMaxDate.setMaxDate(vo, map.get("year"), map.get("month"));

			categoryChartList.add(vo);
		}
		System.out.println("ChartService vo null? : " + categoryChartList.toString());
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

	public List<GraphVo> findLimit(Map<String, String> params) {
		
		return aChartDao.findLimit(params);
	}

}
