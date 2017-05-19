package com.hipo.account_book.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hipo.account_book.service.BoardService;
import com.hipo.account_book.service.NoticeService;
import com.hipo.account_book.service.OptionService;
import com.hipo.account_book.service.ProfileService;
import com.hipo.account_book.vo.ListVo;
import com.hipo.account_book.vo.NoticeVo;
import com.hipo.account_book.vo.OptionVo;
import com.hipo.account_book.vo.UserVo;

@Controller
@RequestMapping("/{id}")
public class NoticeController {
	
	@Autowired
	private BoardService boardService;
	@Autowired
	private OptionService optionservice;
	@Autowired
	private ProfileService Pservice;
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("/notice")
	public String Notice(Model model,  @PathVariable String id, @ModelAttribute NoticeVo noticeVo) {
		
		
		model.addAttribute("notice", noticeService.getNotice());
		/*
		UserVo v1 = Pservice.checkUpdate(id);
		model.addAttribute("v1",v1);
		
		List<OptionVo> option = optionservice.getCategory(optionvo);
		model.addAttribute("board", boardService.getBoardList(page, search));
		model.addAttribute("option", option);
		*/
		return "customer/notice/notice";
	}
	
	@RequestMapping("/faq")
	public String Faq(Model model, @ModelAttribute OptionVo optionvo, @RequestParam(value="p", required=true, defaultValue="1") int page, 
			@RequestParam(value="search", required=false) String search, @PathVariable String id) {
		UserVo v1 = Pservice.checkUpdate(id);
		model.addAttribute("v1",v1);
		
		List<OptionVo> option = optionservice.getCategory(optionvo);
		model.addAttribute("board", boardService.getBoardList(page, search));
		model.addAttribute("option", option);
		return "customer/notice/faq";
	}

}
