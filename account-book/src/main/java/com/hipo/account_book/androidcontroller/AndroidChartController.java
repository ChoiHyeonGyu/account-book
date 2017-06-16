package com.hipo.account_book.androidcontroller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hipo.account_book.androidservice.AndroidChartService;
import com.hipo.account_book.utils.SettingMaxDate;
import com.hipo.account_book.vo.AndroidCategoryChartVo;
import com.hipo.account_book.vo.GraphVo;

@Controller
@RequestMapping("/android/{id}")
public class AndroidChartController {

	@Autowired
	private AndroidChartService aChartService;

	@RequestMapping("findCategory")
	@ResponseBody
	public List<AndroidCategoryChartVo> findCategory(HttpServletRequest request, @PathVariable String id) {
		Map<String, String> categoryMap = aChartService.findCategory(id);
		categoryMap.put("year", request.getParameter("year"));
		categoryMap.put("month", request.getParameter("month"));
		categoryMap.put("id", id);

		return aChartService.findCategory(categoryMap, id);

	}

	@RequestMapping("findLimit")
	@ResponseBody
	public List<GraphVo> findLimit(HttpServletRequest request) {
		Map<String, String> params = new HashMap<>();
		System.out.println("request Checking : "+request.getParameter("year")+" "+request.getParameter("month")+" "+request.getParameter("id"));
		SettingMaxDate.setMaxDate(params, request.getParameter("year"), request.getParameter("month"));
		params.put("minDate", request.getParameter("year") + "/" + request.getParameter("month") + "/01");
		params.put("id", request.getParameter("id"));
		List<GraphVo> list = aChartService.findLimit(params);
		System.out.println("findLimit : " + list.toString());
		return list;
	}

}
