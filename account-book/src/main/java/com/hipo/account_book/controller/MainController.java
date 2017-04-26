package com.hipo.account_book.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainController {
	
	@RequestMapping("/main")
	public String main(@RequestParam(value="id", required=false, defaultValue="") String id){
		return "redirect:/"+id+"/main";
	}
}
