package com.hipo.account_book.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hipo.account_book.service.FrontService;
import com.hipo.account_book.vo.FBUserVo;

@Controller
public class FrontController {
	@Autowired
	private FrontService frontService;
	
	@RequestMapping("/login")
	public String login(){
		return "login";
	}
	
	@RequestMapping("/fbjoin")
	public String fbjoin(@RequestBody(required=false) FBUserVo fbuservo){
		frontService.fbjoin(fbuservo);
		return "main";
	}
}
