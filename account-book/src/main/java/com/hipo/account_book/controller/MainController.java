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

import com.hipo.account_book.service.FrontService;
import com.hipo.account_book.service.OptionService;
import com.hipo.account_book.vo.OptionVo;
import com.hipo.account_book.vo.UserVo;

@Controller
public class MainController {
	
	@Autowired
	private OptionService optionService;
	
	@RequestMapping("/main")
	public String main(@RequestParam(value="fbhidden", required=false, defaultValue="") String id, Model model){
		model.addAttribute("id", id);
		return "main";
	}
	
	@RequestMapping(value="/option", method=RequestMethod.POST)
	public String join(@ModelAttribute @Valid OptionVo optionvo, BindingResult result, Model model){
		if (result.hasErrors()) {
			model.addAttribute("result", result.getModel());
			model.addAttribute("error", result.getAllErrors());
			return "main";
		}
		optionService.Add(optionvo);
		return "redirect:/main";
	}
}
