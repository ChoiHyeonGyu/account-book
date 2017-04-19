package com.hipo.account_book.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hipo.account_book.service.ListService;
import com.hipo.account_book.vo.ListVo;

@Controller
public class ListController {
	@Autowired
	private ListService service;

	@RequestMapping("/{id}/list")
	public String List(Model model) {
		System.out.println("hi");
		List<ListVo> list = service.getList();
		model.addAttribute("list", list);
		
		System.out.println("여기까지 잘찍힙니다.");
		return "/list";
	}
}
