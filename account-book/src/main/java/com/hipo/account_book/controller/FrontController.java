package com.hipo.account_book.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hipo.account_book.dto.JSONResult;
import com.hipo.account_book.service.FrontService;
import com.hipo.account_book.vo.UserVo;

@Controller
public class FrontController {
	@Autowired
	private FrontService frontService;
	
	@RequestMapping("/login")
	public String login(){
		return "login";
	}
	
	@ResponseBody
	@RequestMapping("/fbjoin")
	public JSONResult fbjoin(@RequestBody Map<String, Object> map){
		UserVo uservo = frontService.fblogin(map);
		if(uservo.getId().toString()==null){
			frontService.fbjoin(map);
		}
		return JSONResult.success(map.get("email"));
	}
}
