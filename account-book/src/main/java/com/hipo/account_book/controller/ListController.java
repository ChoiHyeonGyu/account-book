package com.hipo.account_book.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hipo.account_book.service.ListService;
import com.hipo.account_book.vo.ListVo;

@Controller
@RequestMapping("/{id}")
public class ListController {
	@Autowired
	private ListService service;

	@RequestMapping("/main")
	public String List(Model model ,@ModelAttribute ListVo vo) {
		List<ListVo> list = service.getList(vo);
		model.addAttribute("list", list);
		return "/main";
	}
	@RequestMapping("/listdelete")
	public String List(@PathVariable String id,@ModelAttribute ListVo vo){
		 service.delete(vo);
		return "/main";
		
	}
	@RequestMapping("/add")
	public String add(@ModelAttribute ListVo vo,@PathVariable String id){
		System.out.println("더하는 부분 아이디 잘가지고 옵니다" + vo);
		String list = service.add(vo);
		
		return "/main";
		
	}
	@RequestMapping("/modify")
	public String modify(@ModelAttribute ListVo vo,@PathVariable String id){
		
		return null;
	}
}
