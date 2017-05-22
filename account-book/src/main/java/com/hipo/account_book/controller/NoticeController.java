package com.hipo.account_book.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map = noticeService.getNotice();
		model.addAttribute("notice", map);
		
		
		return "customer/notice/notice";
	}
	
	@RequestMapping("/faq")
	public String Faq(Model model, @ModelAttribute OptionVo optionvo, @RequestParam(value="p", required=true, defaultValue="1") int page, 
			@RequestParam(value="search", required=false) String search, @PathVariable String id) {
	
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		map = noticeService.getNotice();
		model.addAttribute("notice", map);
	
		return "customer/notice/faq";
	}

}
