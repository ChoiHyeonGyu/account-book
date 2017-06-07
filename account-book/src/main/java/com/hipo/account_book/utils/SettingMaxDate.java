package com.hipo.account_book.utils;

import java.util.Map;

import com.hipo.account_book.vo.AndroidCategoryChartVo;

public class SettingMaxDate {

	final public static Map<String, String> setMaxDate(Map<String, String> dateMap, String year, String month) {
		for (int i = 1; i <= 12; i++) {
			if (Integer.valueOf(month) == i) {
				if (i == 2) {
					dateMap.put("maxday", year + "/" + month + "/" + "28");
					break;
				}
				if (i % 2 == 0) {
					dateMap.put("maxday", year + "/" + month + "/" + "30");
					break;
				} else {
					dateMap.put("maxday", year + "/" + month + "/" + "31");
					break;
				}
			}
		}
		return dateMap;
	}

	final public static AndroidCategoryChartVo setMaxDate(AndroidCategoryChartVo vo, String year, String month) {
		for (int i = 1; i <= 12; i++) {
			if (Integer.valueOf(month) == i) {
				if (i == 2) {
					vo.setMaxDate(year + "/" + month + "/" + "28");
					break;
				}
				if (i % 2 == 0) {
					vo.setMaxDate(year + "/" + month + "/" + "30");
					break;
				} else {
					vo.setMaxDate(year + "/" + month + "/" + "31");
					break;
				}
			}
		}
		return vo;
	}
}
