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
public class ListController {
	@Autowired
	private ListService service;

	@RequestMapping("/{id}/list")
	public String List(Model model ,@ModelAttribute ListVo vo) {
		System.out.println("hi");
		List<ListVo> list = service.getList(vo);
		model.addAttribute("list", list);
		return "/main";
	}
	@RequestMapping("/{id}/listdelete")
	public String List(@PathVariable String id,@ModelAttribute ListVo vo){
		
		System.out.println("아이디 잘가지고 옵니까??" + id);
		System.out.println("vo 잘가지고 옵니까???" + vo);
		 service.delete(vo);
		return "redirect:/{id}/list";
		
	}
	@RequestMapping("/{id}/add")
	public String add(@ModelAttribute ListVo vo){
		System.out.println("더하는 부분 아이디 잘가지고 옵니다" + vo);
		service.add(vo);
		return null;
		
	}
}
