package com.hipo.account_book.androidcontroller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/android/{id}")
public class AndroidListController {
	
	@RequestMapping
	public void addList(HttpServletRequest request){
		
	}
	
	
}
