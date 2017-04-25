package com.hipo.account_book.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hipo.account_book.service.ListService;
import com.hipo.account_book.vo.BoardVo;
import com.hipo.account_book.vo.ListVo;

@Controller
@RequestMapping("/{id}")
public class ListController {
	@Autowired
	private ListService service;

	@RequestMapping("/main")
	public String List(Model model ,@ModelAttribute ListVo vo, @RequestParam("search") String search) {
		List<ListVo> list = service.getList(vo);
		model.addAttribute("board", service.showboard());
		model.addAttribute("list", list);
		return "main";
	}
	@RequestMapping("/listdelete")
	public String List(@PathVariable String id,@ModelAttribute ListVo vo){
		 service.delete(vo);
		return "main";
		
	}
	@RequestMapping("/add")
	public String add(@ModelAttribute ListVo vo,@PathVariable String id){
		System.out.println("더하는 부분 아이디 잘가지고 옵니다" + vo);
		String list = service.add(vo);
		
		return "main";
		
	}
	@RequestMapping("/modify")
	public String modify(@ModelAttribute ListVo vo,@PathVariable String id){
		System.out.println("고치는 부분 입니다.무엇을 가지고 오나요" + vo);
		service.modify(vo);
		return null; 
	}
	
	@RequestMapping("/boardadd")
	public String boardadd(@PathVariable String id, @ModelAttribute BoardVo boardvo, @RequestParam("file") List<MultipartFile> file){
		service.boardadd(id, boardvo, file);
		return "redirect:/"+id+"/main";
	}
}
