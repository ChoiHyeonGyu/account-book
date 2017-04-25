package com.hipo.account_book.androidcontroller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hipo.account_book.vo.ListVo;

@Controller
@RequestMapping("/android/{id}")
public class AndroidListController {
	
	@RequestMapping("/addList")
	public void addList(HttpServletRequest request){
		ListVo listVo=new ListVo();
	}
	
	
}
