package com.hipo.account_book.controller;

import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hipo.account_book.dto.JSONResult;
import com.hipo.account_book.service.OptionService;
import com.hipo.account_book.service.ProfileService;
import com.hipo.account_book.vo.OptionVo;

@Controller
@RequestMapping("/{id}")
public class OptionController {
	@Autowired
	private OptionService optionService;
	@Autowired
	private ProfileService Pservice;
	
	@RequestMapping("/option")
	public String option(Model model,@ModelAttribute OptionVo optionvo, @PathVariable String id) {
		System.out.println("erroeroeroeore++:"+id);
		List<OptionVo> option = optionService.getCategory(optionvo);
		System.out.println("erroeroeroeore++:");
		model.addAttribute("option", option);
		System.out.println("erroeroeroeore++:");
		model.addAttribute("v1",Pservice.checkUpdate(id));
		System.out.println("erroeroeroeore++:");
			
		return "mypage/left_menu/option";
		
	}

	@RequestMapping(value = "/categoryAdd", method = RequestMethod.POST)
	public String categoryAdd(@ModelAttribute @Valid OptionVo optionvo, @PathVariable String id) {
		String category;
		String category2;
		int categoryId1;
		int categoryId;

		category2 = optionvo.getCategory();
		category = optionService.Add0(category2);
		if (category2.equals(category) == true) {

			categoryId = optionService.Add1(optionvo);
			optionvo.setCategeoryId(categoryId);
			categoryId1 = optionService.Add3(optionvo);

			if (categoryId1 == 0) {
				optionService.Add2(optionvo);
			} else {
			}
		} else {
			optionService.Add(optionvo);
			categoryId = optionService.Add1(optionvo);
			optionvo.setCategeoryId(categoryId);
			optionService.Add2(optionvo);
		}

		return "redirect:/" + id + "/option";
	}

	@RequestMapping("/reset")
	public String reset(@RequestParam("resetPassword") String resetPassword, @PathVariable String id) {
		String pp = optionService.checkPassword(resetPassword, id);
		if (pp.equals("fail") == true) {
			return "redirect:/" + id + "/option";
		} else {
			optionService.reset(id);
			return "redirect:/" + id + "/option";
		}
	}

	@ResponseBody
	@RequestMapping("/limitModify2")
	public JSONResult limitmodify2(@PathVariable String id, @RequestBody Map<String, Object> map) {
		return JSONResult.success(optionService.limitModify2(map.get("category").toString()));// 여기서
																													// 에러.
	}
	
	@RequestMapping("/limitModify")
	public String limitModify(@ModelAttribute OptionVo optionvo, @PathVariable String id) {
		int categoryId;
		categoryId = optionService.limitModify(optionvo);
		optionvo.setCategeoryId(categoryId);
		optionService.limitModify1(optionvo);
		return "redirect:/" + id + "/option";
	}

	@ResponseBody
	@RequestMapping("/categoryModify")
	public JSONResult modify(@PathVariable String id, @RequestBody Map<String, Object> map) {
		return JSONResult.success(optionService.categoryModify(Integer.parseInt(map.get("categoryId").toString())));// 여기서
																													// 에러.

	}

	@RequestMapping("/categoryModify1")
	public String categoryModify(@ModelAttribute OptionVo vo, @PathVariable String id,
			@RequestParam("categoryId") int cid) {
		vo.setCategeoryId(cid);
		optionService.categoryModify1(vo);
		return "redirect:/" + id + "/option";
	}

	@RequestMapping("/categorydelete")
	public String categorydelete(@PathVariable String id, @ModelAttribute OptionVo vo,
			@RequestParam("categoryId") int cid) {
		vo.setCategeoryId(cid);

		optionService.delete(vo);

		// return "main";
		return "redirect:/" + id + "/option";
	}

}
