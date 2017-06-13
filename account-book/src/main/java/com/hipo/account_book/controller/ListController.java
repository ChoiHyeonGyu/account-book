package com.hipo.account_book.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hipo.account_book.dto.JSONResult;
import com.hipo.account_book.service.ListService;
import com.hipo.account_book.service.OptionService;
import com.hipo.account_book.service.ProfileService;
import com.hipo.account_book.vo.ListVo;
import com.hipo.account_book.vo.OptionVo;
import com.hipo.account_book.vo.UserVo;

@Controller
@RequestMapping("/{id}")
public class ListController {
	@Autowired
	private ListService service;
	@Autowired
	private OptionService optionservice;
	@Autowired
	private ProfileService Pservice;
	
	@ResponseBody
	@RequestMapping("/movelist")
	public JSONResult movelist(@RequestBody Map<String, Object> map, @PathVariable String id, Model model) {
		return JSONResult.success(service.movelist(map.get("operation").toString(),1,"",id));
	}
	
	@RequestMapping("/list")
	public String Listaj(Model model, @ModelAttribute OptionVo optionvo,
			@RequestParam(value = "pagination", required = true, defaultValue = "1") int pagination,
			@RequestParam(value = "searching", required = true, defaultValue = "") String searching, @PathVariable String id,
			@RequestParam(value = "operation", required = true, defaultValue = "0") String operation,@ModelAttribute ListVo listvo) {
		UserVo username = Pservice.checkUpdate(id);// about profile 
		model.addAttribute("username", username);
		model.addAttribute("profile1",Pservice.profile1(id));// 프로필 설정
		model.addAttribute("profileall", Pservice.profileall(id));// 프로필 불러오기.
		Map<String, Object> vo = service.movelist(operation, pagination, searching, id);
		model.addAttribute("ps", vo);
		model.addAttribute("v2", service.totalmonth(id, operation));
		model.addAttribute("v3", service.totalmonth1(id, operation));
		model.addAttribute("v4",service.totalmonth2(id, operation));
		model.addAttribute("v5",service.totalmoney(id, operation));
		model.addAttribute("categorylist",service.categorylist(id));
		model.addAttribute("operationslist",service.operationslist(id));
		model.addAttribute("plusoption", optionservice.getPlusCategory(optionvo));
		model.addAttribute("minusoption", optionservice.getMinusCategory(optionvo));
		model.addAttribute("investmentoption", optionservice.getInvestmentCategory(optionvo));
		model.addAttribute("profilegraph",Pservice.graph(id));// 프로필 사이드 그래프 1
		model.addAttribute("profilegraph2",Pservice.graph2(id));
		model.addAttribute("profilegraph3",Pservice.graph3(id));
		model.addAttribute("profilegraph4",Pservice.graph4(id));
		model.addAttribute("profilegraph5",Pservice.graph5(id));
		model.addAttribute("profilegraph6",Pservice.graph6(id));
		model.addAttribute("profilegraph7",Pservice.graph7(id));
		 
		return "mypage/list/list";
	}
	
	@RequestMapping("/userinfo")
	public String changing(@RequestParam("id") String id, @RequestParam("name") String name,
			@RequestParam("photo") MultipartFile photo, @RequestParam("password") String password,Model model) {

		Pservice.updateProfile(id, name, photo, password);
		return "redirect:/{id}/list";

	}
	@ResponseBody
	@RequestMapping("/profileModify")
	public JSONResult profilemodify(@PathVariable String id,@RequestParam Map<String,Object> map)
	{
		return JSONResult.success(Pservice.profileModify(id));
	}
	

	@RequestMapping("/listdelete")
	public String List(@PathVariable String id, @ModelAttribute ListVo vo) {
		service.delete(vo);
		return "redirect:/" + id + "/list";

	}

	@RequestMapping("/add")
	public String add(@ModelAttribute ListVo vo, @PathVariable String id) {
		service.add(vo);
		return "redirect:/" + id + "/list";

	}

	@ResponseBody
	@RequestMapping("/modify")
	public JSONResult modify(@PathVariable String id, @RequestBody Map<String, Object> map) {
		return JSONResult.success(service.modify(Integer.parseInt(map.get("listid").toString())));// 여기서
																									// 에러.
	}

	@ResponseBody
	@RequestMapping("/modify1")/*날짜! */
	public JSONResult modify1(@RequestBody Map<String, Object> map, @PathVariable String id) {
		return JSONResult.success(service.modify2(map));
	}
	
	@ResponseBody
	@RequestMapping("/modify2") /* 상호명 이름*/
	public JSONResult modify2(@RequestBody Map<String, Object> map, @PathVariable String id) {
		return JSONResult.success(service.modify3(map));
	}
	
	@ResponseBody
	@RequestMapping("/modify3")/*돈돈!!!*/
	public JSONResult modify3(@RequestBody Map<String, Object> map, @PathVariable String id) {
		return JSONResult.success(service.modify4(map));
	}
	@ResponseBody
	@RequestMapping("/modify4")
	 /* 은행 !*/
	public JSONResult modify4(@RequestBody Map<String, Object> map, @PathVariable String id) {
		return JSONResult.success(service.modify5(map));
	}
	@ResponseBody
	@RequestMapping("/modifyl")
	public JSONResult modifyl(@RequestBody Map<String, Object> map, @PathVariable String id) {
		return null;
	}
	@ResponseBody
	@RequestMapping("/modify5")
	 /* paid!*/
	public JSONResult modify5(@RequestBody Map<String, Object> map, @PathVariable String id) {
		return JSONResult.success(service.modify6(map));
		
		
	}
	@ResponseBody
	@RequestMapping("/modify6")
	 /* paid!*/
	public JSONResult modify6(@RequestBody Map<String, Object> map, @PathVariable String id) {
		map.put("id", id);
		return JSONResult.success(service.modify7(map));
	}
	
	@ResponseBody
	@RequestMapping("/modify7")
	 /* paid!*/
	public JSONResult modify7(@RequestBody Map<String, Object> map, @PathVariable String id) {
		return JSONResult.success(service.modify8(map));
	}
	

	@ResponseBody
	@RequestMapping("/maps")
	public JSONResult maps(@RequestBody Map<String, Object> map) {
		return JSONResult.success(service.loadmap(map.get("lid").toString()));
	}
}
