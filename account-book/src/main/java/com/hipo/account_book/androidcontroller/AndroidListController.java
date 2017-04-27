package com.hipo.account_book.androidcontroller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hipo.account_book.service.AndroidListService;
import com.hipo.account_book.vo.ListVo;

@Controller
@RequestMapping("/android/{id}")
public class AndroidListController {

	@Autowired
	private AndroidListService listService;

	@RequestMapping("/addList")
	public void addList(HttpServletRequest request) {
		ListVo listVo = new ListVo();
		listVo.setId(request.getParameter("id"));
		listVo.setBank(request.getParameter("bank"));
		listVo.setMoney(request.getParameter("price"));
		listVo.setName(request.getParameter("place"));
		listVo.setPaid(request.getParameter("paid"));
		listVo.setCategory(request.getParameter("category"));
		listVo.setOperations(request.getParameter("operations"));
		listVo.setLocationX("0");
		listVo.setLocationY("0");

		listService.addList(listVo);
		System.out.println("성공햇따리");

	}

	@RequestMapping("/getList")
	@ResponseBody
	public Map<String, ListVo> loginUserVo(HttpServletRequest request) {
		String id = request.getParameter("id");
		List<ListVo> list = listService.getList(id);
		Map<String, ListVo> ListData = new HashMap<String, ListVo>();
		for (int i = 0; i < list.size(); i++) {
			ListData.put("ListVo" + i, list.get(i));
		}

		return ListData;
	}

}
