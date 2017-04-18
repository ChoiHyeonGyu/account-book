package com.hipo.account_book.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FrontController {
	
	@RequestMapping("/login")
	public String login(){
		return "login";
	}
}
