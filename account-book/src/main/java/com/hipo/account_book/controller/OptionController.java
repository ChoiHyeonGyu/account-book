package com.hipo.account_book.controller;

import java.util.Map;

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
import com.hipo.account_book.service.CommonnessService;
import com.hipo.account_book.service.OptionService;
import com.hipo.account_book.vo.OptionVo;

@Controller
@RequestMapping("/{id}")
public class OptionController {
	@Autowired
	private OptionService optionService;
	@Autowired
	private CommonnessService cs;
	
	@RequestMapping("/option")
	public String option(Model model,@ModelAttribute OptionVo optionvo, @PathVariable String id) {
		model.addAttribute("defaultinfo", cs.defaultinfo(model, id, optionvo));
		return "mypage/left_menu/option";
	}

	@RequestMapping(value = "/categoryAdd", method = RequestMethod.POST)
	public String categoryAdd(@ModelAttribute OptionVo optionvo, @PathVariable String id) {
		String category;
		String category2;
		int categoryId1;
		int categoryId;
		
		category2 = optionvo.getCategory();  //추가하는 카테고리 이름
		category = optionService.Add0(category2); // 데이터베이스에서 확인 결과 같은값인지 아닌지 판별 (카테고리테이블)
		if (category2.equals(category) == true) {
			//카테고리 테이블에 이미 같은 카테고리 이름이 있을때
			categoryId = optionService.Add1(optionvo);  //데이터베이스에서 카테고리이름으로 카테고리 아이디를 가져옴(카테고리테이블)
			optionvo.setCategeoryId(categoryId); 
			categoryId1 = optionService.Add3(optionvo); //카테고리 테이블에 있는 카테고리아이디로 유저스 카테고리에 같은 카테고리 아이디가 있는지 판별

			if (categoryId1 == 0) {  //카테고리 테이블에 있는 카테고리아이디로 유저스카테고리 테이블에 같은 카테고리 아이디가 있는지 판별
				optionService.Add2(optionvo); //유저스 카테고리에 카테고리아이디가 없으면 유저스 카테고리를 추가
			} else {
				//유저스 카테고리에 카테고리아이디가 있으면 아무것도 안함
			}
		} else {
			//카테고리 테이블에 이미 같은 카테고리 이름이 없을때
			optionService.Add(optionvo); //카테고리테이블에 새로 추가
			categoryId = optionService.Add1(optionvo);  //추가한 카테고리 테이블에서 카테고리 아이디값을 가져옴
			optionvo.setCategeoryId(categoryId);
			optionService.Add2(optionvo);   //유저스카테고리 테이블에 추가함
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
		return JSONResult.success(optionService.limitModify2(map.get("category").toString(), id));																							// 에러.
	}
	
	@RequestMapping("/limitModify")
	public String limitModify(@ModelAttribute OptionVo optionvo, @PathVariable String id) {
		int categoryId;
		categoryId = optionService.limitModify(optionvo, id);
		optionvo.setCategeoryId(categoryId);
		optionService.limitModify1(optionvo);
		return "redirect:/" + id + "/option";
	}

	@ResponseBody
	@RequestMapping("/categoryModify2")
	public JSONResult modify(@PathVariable String id, @RequestBody Map<String, Object> map) {
		return JSONResult.success(optionService.categoryModify(Integer.parseInt(map.get("categoryId").toString())));// 여기서
																													// 에러
	}

	@RequestMapping("/categoryModify1")
	public String categoryModify(@ModelAttribute OptionVo vo, @PathVariable String id,
			@RequestParam("categoryId") int cid) {
		vo.setCategeoryId(cid);
		vo.setOperations(vo.getOperations());
		vo.setId(id);
		
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
