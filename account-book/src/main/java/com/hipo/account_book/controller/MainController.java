package com.hipo.account_book.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hipo.account_book.service.BoardService;

@Controller
public class MainController {
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/main")
	public String main(@RequestParam(value="id", required=false, defaultValue="") String id){
		return "redirect:/"+id+"/main";
	}
	
	@RequestMapping("/board")
	public String List(Model model, @RequestParam(value="p", required=true, defaultValue="1") int page, @RequestParam(value="search", required=false) String search) {
		model.addAttribute("board", boardService.getBoardList(page, search));
		return "frontpage/viewboard";
	}
	
	@RequestMapping("/graph")
	public String graph(){
		return "frontpage/viewgraph";
	}
}
