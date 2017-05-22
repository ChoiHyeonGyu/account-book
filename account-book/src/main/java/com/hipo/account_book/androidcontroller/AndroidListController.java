package com.hipo.account_book.androidcontroller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hipo.account_book.service.AndroidListService;
import com.hipo.account_book.vo.ListVo;

@Controller
@RequestMapping("/android/{id}")
public class AndroidListController {

	@Autowired
	private AndroidListService listService;

	@RequestMapping("/addList")
	public void addList(HttpServletRequest request) throws JsonParseException, JsonMappingException, IOException {
		ListVo listVo = null;
		/*
		 * listVo.setId(request.getParameter("id"));
		 * listVo.setBank(request.getParameter("bank"));
		 * listVo.setMoney(request.getParameter("price"));
		 * listVo.setName(request.getParameter("place"));
		 * listVo.setPaid(request.getParameter("paid"));
		 * listVo.setCategory(request.getParameter("category"));
		 * listVo.setOperations(request.getParameter("operations"));
		 * listVo.setLocationX("0"); listVo.setLocationY("0");
		 * 
		 * listService.addList(listVo); System.out.println("성공햇따리");
		 */

		String jsonListVo = request.getParameter("listVo");
		System.out.println("jsonListVo ..check location : " + jsonListVo);
		ObjectMapper mapper = new ObjectMapper();
		listVo = mapper.readValue(jsonListVo, ListVo.class);
		listService.addList(listVo);
		System.out.println("자동입력성공");
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

	@RequestMapping("/updateList")
	public void updateList(HttpServletRequest request) throws JsonParseException, JsonMappingException, IOException {
		System.out.println("updateListMethod : " + request.getParameter("updateListVo"));
		ObjectMapper mapper = new ObjectMapper();
		ListVo listVo = mapper.readValue(request.getParameter("updateListVo"), ListVo.class);

		StringBuilder dateSet = new StringBuilder(listVo.getDay());
		dateSet.append(":00");
		listVo.setDay("");
		listVo.setDay(dateSet.toString());
		System.out.println("convert! : " + listVo);
		dateSet.setLength(0);
		listService.updateList(listVo);
	}

	@RequestMapping("/addVo")
	public void addListVo(HttpServletRequest request) throws JsonParseException, JsonMappingException, IOException {
		ListVo vo = null;
		String jsonListVo = request.getParameter("addVo");

		ObjectMapper mapper = new ObjectMapper();
		vo = mapper.readValue(jsonListVo, ListVo.class);
		System.out.println("addVo Jsonconverting : " + vo.toString());
		listService.addList(vo);
		System.out.println("성공햇따리(수동추가)");
	}

	@RequestMapping("/deleteVo")
	public void deleteListVo(HttpServletRequest request) {
		String listId = request.getParameter("list_id");
		System.out.println("checking listId! : " + listId);
		listService.deleteList(listId);

	}

	@RequestMapping("location")
	@ResponseBody
	public Map<String, ListVo> getByTime(HttpServletRequest request, @PathVariable String id) {
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		List<ListVo> list = listService.getLocationVos(year, month, id);
		Map<String, ListVo> ListData = new HashMap<String, ListVo>();
		for (int i = 0; i < list.size(); i++) {
			ListData.put("ListVo" + i, list.get(i));
		}
		return ListData;
	}

}
