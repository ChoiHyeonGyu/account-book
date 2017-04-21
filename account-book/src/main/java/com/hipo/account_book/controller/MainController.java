package com.hipo.account_book.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainController {
	
	@RequestMapping("/main")
	public String main(@RequestParam("fbhidden") String id, Model model){
		model.addAttribute("id", id);
		return "main";
	}
}
