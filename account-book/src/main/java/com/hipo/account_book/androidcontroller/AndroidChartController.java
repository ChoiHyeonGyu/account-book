package com.hipo.account_book.androidcontroller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hipo.account_book.service.AndroidChartService;
import com.hipo.account_book.vo.AndroidCategoryChartVo;

@Controller
@RequestMapping("/android/{id}")
public class AndroidChartController {

	@Autowired
	private AndroidChartService aChartService;

	@RequestMapping("findCategory")
	@ResponseBody
	public List<AndroidCategoryChartVo> findCategory(@PathVariable String id) {
		Map<String, String> categoryMap = aChartService.findCategory(id);
		return aChartService.findCategory(categoryMap, id);

	}

}
