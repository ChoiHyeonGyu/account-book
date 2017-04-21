package com.hipo.account_book.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hipo.account_book.vo.UserVo;

@Controller
@RequestMapping("/android/{id}")
public class AndroidController {

	@RequestMapping("/test")
	public void test(@PathVariable String id) {
		System.out.println("okok" + id);
	}

	@RequestMapping("/join")
	public void getUserVo(HttpServletRequest request) {
		UserVo vo = null;
		vo = new UserVo();
		vo.setName(request.getParameter("name"));
		vo.setAge(Integer.parseInt(request.getParameter("age")));
		vo.setGender(request.getParameter("gender"));
		vo.setPassword(request.getParameter("password"));
		vo.setId(request.getParameter("id"));
		String email = request.getParameter("email");

		System.out.println(vo.toString());

	}

}
