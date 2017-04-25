package com.hipo.account_book.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.hipo.account_book.service.OptionService;
import com.hipo.account_book.vo.OptionVo;
import com.hipo.account_book.vo.UserVo;

@Controller
public class MainController {
	
	@Autowired
	private OptionService optionService;
	
	@RequestMapping("/main")
	public String main(@RequestParam(value="id", required=false, defaultValue="") String id){
		return "redirect:/"+id+"/main";
	}
	
	@RequestMapping(value="/categoryadd", method=RequestMethod.POST)
	public String option(@ModelAttribute @Valid OptionVo optionvo, BindingResult result, Model model, @ModelAttribute UserVo uservo){
		if (result.hasErrors()) {
			model.addAttribute("result", result.getModel());
			model.addAttribute("error", result.getAllErrors());
			return "main";
		}
		optionService.Add(optionvo);
		return "redirect:/"+uservo.getId()+"/main";
	}
}
