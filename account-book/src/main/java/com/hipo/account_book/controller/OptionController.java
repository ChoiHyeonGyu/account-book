package com.hipo.account_book.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hipo.account_book.service.OptionService;
import com.hipo.account_book.vo.OptionVo;
import com.hipo.account_book.vo.UserVo;

@Controller
@RequestMapping("/{id}")
public class OptionController {
	@Autowired
	private OptionService optionService;
	
	@RequestMapping(value="/categoryAdd", method=RequestMethod.POST)
	public String categoryAdd(@ModelAttribute @Valid OptionVo optionvo, BindingResult result, Model model, @PathVariable String id){
		if (result.hasErrors()) {
			model.addAttribute("result", result.getModel());
			model.addAttribute("error", result.getAllErrors());
			return "main";
		}
		optionService.Add(optionvo);
		return "redirect:/"+id+"/main#option";
	}
	
	@RequestMapping("/categoryModify")
	public String categoryModify(@ModelAttribute OptionVo optionvo, BindingResult result, Model model, @PathVariable String id){
		
		if (result.hasErrors()) {
			model.addAttribute("result", result.getModel());
			model.addAttribute("error", result.getAllErrors());
			return "main";
		}
		//optionvo.setCategeoryId(cid);
		System.out.println("수정수정수정"+ optionvo);
		optionService.Update(optionvo);
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
