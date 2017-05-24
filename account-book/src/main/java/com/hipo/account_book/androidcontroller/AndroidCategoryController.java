package com.hipo.account_book.androidcontroller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hipo.account_book.service.AndroidCategoryService;
import com.hipo.account_book.vo.OptionVo;

@Controller
@RequestMapping("/android/{id}")
public class AndroidCategoryController {

	@Autowired
	AndroidCategoryService aCategoryService;

	@RequestMapping("addCategory")
	public void addCategory(HttpServletRequest request, @PathVariable String id) {
		String category = request.getParameter("category");
		OptionVo optionVo = aCategoryService.getCategoryId(category);
		if (optionVo == null) {
			aCategoryService.addCategory(category);
			optionVo = aCategoryService.getCategoryId(category);
		}

		optionVo.setCategory(category);
		optionVo.setId(id);

		if (aCategoryService.addUsersCategory(optionVo))
			;
		System.out.println("성공!!");
	}

}
