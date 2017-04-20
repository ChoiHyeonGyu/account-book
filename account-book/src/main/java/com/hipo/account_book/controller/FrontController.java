package com.hipo.account_book.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hipo.account_book.service.FrontService;

@Controller
public class FrontController {
	@Autowired
	private FrontService frontService;
	
	@RequestMapping("/login")
	public String login(){
		return "login";
	}
	
	@RequestMapping("/fbjoin")
	public String fbjoin(@RequestBody Map<String, Object> map){
		System.out.println(map);
		frontService.fbjoin(map);
		return "main";
	}
}
