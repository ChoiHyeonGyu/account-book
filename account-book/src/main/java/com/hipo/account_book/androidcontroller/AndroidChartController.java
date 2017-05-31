package com.hipo.account_book.androidcontroller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hipo.account_book.service.AndroidChartService;

@Controller
@RequestMapping("/android/{id}")
public class AndroidChartController {
	
	@Autowired
	private AndroidChartService aChartService;

	@RequestMapping("findCategory")
	public void findCategory(@PathVariable String id) {
		Map<String, String> categoryMap = aChartService.findCategory(id);
		aChartService.findCategory(categoryMap,id);
	}

}
