package com.hipo.account_book.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hipo.account_book.dto.JSONResult;
import com.hipo.account_book.service.ListService;
import com.hipo.account_book.service.OptionService;
import com.hipo.account_book.service.ProfileService;
import com.hipo.account_book.vo.ListVo;
import com.hipo.account_book.vo.OptionVo;
import com.hipo.account_book.vo.UserVo;

@Controller
@RequestMapping("/{id}")
public class ListController {
	@Autowired
	private ListService service;
	@Autowired
	private OptionService optionservice;
	@Autowired
	private ProfileService Pservice;

	
		
	@RequestMapping("/list")
	public String List(Model model, @ModelAttribute OptionVo optionvo, @ModelAttribute ListVo vo,
			@RequestParam(value = "pagination", required = true, defaultValue = "1") int pagination,
			@RequestParam(value = "searching", required = false) String searching, @PathVariable String id) {
		service.getList(vo);
		
		/*service.totalmonth(vo);*/
		UserVo v1 = Pservice.checkUpdate(id);
		model.addAttribute("v1", v1);

		List<OptionVo> option = optionservice.getCategory(optionvo);

		model.addAttribute("ps", service.pageSearching(pagination, searching, id));

		/* model.addAttribute("list", list); */
		model.addAttribute("option", option);
		return "mypage/list/list";
	}
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping("/checkUpdate1") public JSONResult
	 * checkUpdate1(@PathVariable String id, @RequestBody Map<String, Object>
	 * map){ return
	 * JSONResult.success(Pservice.checkUpdate1(map.get("").toString())); }
	 */

	@RequestMapping("/listdelete")
	public String List(@PathVariable String id, @ModelAttribute ListVo vo) {
		service.delete(vo);
		return "redirect:/" + id + "/list";

	}

	@RequestMapping("/add")
	public String add(@ModelAttribute ListVo vo, @PathVariable String id) {
		System.out.println("ListController add" + vo);

		service.add(vo);
		System.out.println("정보 확인" + vo);
		return "redirect:/" + id + "/list";

	}

	@ResponseBody
	@RequestMapping("/modify")
	public JSONResult modify(@PathVariable String id, @RequestBody Map<String, Object> map) {
		return JSONResult.success(service.modify(Integer.parseInt(map.get("listid").toString())));// 여기서
																									// 에러.

	}

	@RequestMapping("/modify1")
	public String modify1(@ModelAttribute ListVo vo, @PathVariable String id) {
		service.modify1(vo);

		return "redirect:/" + id + "/list";
	}

	@ResponseBody
	@RequestMapping("/maps")
	public JSONResult maps(@RequestBody Map<String, Object> map) {
		return JSONResult.success(service.loadmap(map.get("lid").toString()));
	}
}
