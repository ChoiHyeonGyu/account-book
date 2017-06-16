package com.hipo.account_book.androidcontroller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hipo.account_book.androidservice.AndroidCategoryService;
import com.hipo.account_book.androidservice.AndroidUserService;
import com.hipo.account_book.vo.UserVo;

@Controller
@RequestMapping("/android/{id}")
public class AndroidUserController {

	@Autowired
	private AndroidUserService androidService;
	@Autowired
	private AndroidCategoryService aCategoryService;

	@RequestMapping("/test")
	@ResponseBody
	public String test(@PathVariable String id) {
		System.out.println("okok" + id);
		return id;
	}

	@RequestMapping("/join")
	public void joinUserVo(HttpServletRequest request) {
		UserVo vo = null;
		vo = new UserVo();
		vo.setName(request.getParameter("name"));
		vo.setAge(request.getParameter("age"));
		vo.setGender(request.getParameter("gender"));
		vo.setPassword(request.getParameter("password"));
		vo.setId(request.getParameter("id"));

		androidService.join(vo);

		String category = "생활비";
		if (aCategoryService.addCategoryStraight(category, vo.getId())) {
			System.out.println("성공!");
		} else {
			System.out.println("실패!");
		}
	}

	@RequestMapping("/login")
	@ResponseBody
	public Map<String, String> loginUserVo(@PathVariable String id) {
		UserVo vo = androidService.login(id);
		System.out.println("login : " + vo.toString());
		Map<String, String> userInfo = new HashMap<String, String>();
		userInfo.put("name", vo.getName());
		userInfo.put("id", vo.getId());
		userInfo.put("gender", vo.getGender());
		userInfo.put("age", String.valueOf(vo.getAge()));

		return userInfo;
	}

}
