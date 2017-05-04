package com.hipo.account_book.controller;

import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hipo.account_book.dto.JSONResult;
import com.hipo.account_book.service.OptionService;
import com.hipo.account_book.vo.OptionVo;
import com.hipo.account_book.vo.UserVo;

@Controller
@RequestMapping("/{id}")
public class OptionController {
	@Autowired
	private OptionService optionService;
	
	@RequestMapping(value="/categoryAdd", method=RequestMethod.POST)
	public String categoryAdd(@ModelAttribute @Valid OptionVo optionvo, @PathVariable String id){
		OptionVo vo;
		System.out.println("더하기더하기더하기"+optionvo);
		
		optionService.Add(optionvo);
		//int num = optionService.Add2(optionvo);
		//optionService.Add1(optionvo);
		//System.out.println("2222222더하기더하기더하기"+num);
		return "redirect:/"+id+"/main#option";
	}
	
	
	
	
	@ResponseBody
	@RequestMapping("/categoryModify")
	public JSONResult modify(@PathVariable String id, @RequestBody Map<String, Object> map){
		System.out.println("ididididididi"+map);
		return JSONResult.success(optionService.categoryModify(Integer.parseInt(map.get("categoryId").toString())));//여기서 에러.
		
	} 
	
	
	
	@RequestMapping("/categoryModify1")
	public String categoryModify(@ModelAttribute OptionVo vo, @PathVariable String id, @RequestParam("categoryId") int cid){
		System.out.println("--------------------------------vovovovovo---------"+vo);
		System.out.println("idididcatididicatid"+cid);
		System.out.println("------------------idididi----------------------"+id);
		vo.setCategeoryId(cid);
		System.out.println("vovovovovo---------"+vo);
		optionService.categoryModify1(vo);
		return "redirect:/"+id+"/main#option";
	}
	
	@RequestMapping("/categorydelete")
	public String categorydelete(@PathVariable String id, @ModelAttribute OptionVo vo, @RequestParam("categoryId") int cid){
		vo.setCategeoryId(cid); 
		System.out.println("딜리트.............."+vo);
		 System.out.println("아이디.............."+id);
		 System.out.println("호로로로로롤.............."+cid);
		
		optionService.delete(vo);
		
		//return "main";
		return "redirect:/"+id+"/main#option";
	}
	
}
