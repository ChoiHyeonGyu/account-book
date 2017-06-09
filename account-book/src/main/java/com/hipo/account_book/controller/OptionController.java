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
		model.addAttribute("profile1",Pservice.profile1(id));// 프로필 설정
		model.addAttribute("profileall", Pservice.profileall(id));// 프로필 불러오기.
		List<OptionVo> option = optionService.getCategory(optionvo);
		model.addAttribute("option", option);
		model.addAttribute("v1",Pservice.checkUpdate(id));
			
		return "mypage/left_menu/option";
		
	}

	@RequestMapping(value = "/categoryAdd", method = RequestMethod.POST)
	public String categoryAdd(@ModelAttribute @Valid OptionVo optionvo, @PathVariable String id) {
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
	@RequestMapping(value = "/categoryModify", method = RequestMethod.POST)
	public String categoryModify(@ModelAttribute @Valid OptionVo optionvo, @PathVariable String id) {
		System.out.println("@@@@@@@@@@@@@@@@@" + optionvo);
		String category;
		String category2;
		String limit;
		int categoryId1;
		int categoryId;
		int categoryId2;
		
		
		category2 = optionvo.getCategory();
		category = optionService.Modify0(category2);
		System.out.println(category +"category2 " + category2);
		if (category2.equals(category) == true) {
			
			limit = optionService.Modify5(optionvo);
			System.out.println(limit);
			optionvo.setLimit(limit);
			categoryId2 = optionvo.getCategoryId();
			System.out.println("cococo123"+optionvo);
			categoryId = optionService.Modify1(optionvo);
			optionvo.setCategeoryId(categoryId);
			categoryId1 = optionService.Modify3(optionvo);
			
			System.out.println("categoryid"+categoryId);
			System.out.println("categoryid1"+categoryId1);
			

			if (categoryId1 == 0) {
				System.out.println("vovovo"+optionvo);
				optionService.Modify7(optionvo);
				optionvo.setCategeoryId(categoryId2);
				optionService.Modify6(optionvo);
			} else {
				optionService.Modify2(optionvo); //오퍼레이션스만 업데이트 해줌
			}
		} else {
			System.out.println("두번쨰!!!!!!!!!!!!!!");
			limit = optionService.Modify5(optionvo);
			optionvo.setLimit(limit);
			optionService.Modify(optionvo);
			categoryId = optionService.Modify1(optionvo);
			System.out.println("옵션보  11111111" +optionvo );
			categoryId2 = optionvo.getCategoryId();
			optionvo.setCategeoryId(categoryId);
			System.out.println("get"+categoryId);
			optionService.Modify4(optionvo);
			optionvo.setCategeoryId(categoryId2);
			
			System.out.println("dd?D??D?D?D??D?"+ optionvo);
			optionService.Modify6(optionvo);
			
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
	@RequestMapping("/categoryModify2")
	public JSONResult modify(@PathVariable String id, @RequestBody Map<String, Object> map) {
		return JSONResult.success(optionService.categoryModify(Integer.parseInt(map.get("categoryId").toString())));// 여기서
																													// 에러.

	}

	@RequestMapping("/categoryModify1")
	public String categoryModify(@ModelAttribute OptionVo vo, @PathVariable String id,
			@RequestParam("categoryId") int cid) {
		System.out.println("아이디 및 맵 넘김." + id + " = "+ vo);
		vo.setCategeoryId(cid);
		vo.setOperations(vo.getOperations());
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
