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
	private ProfileService Pservice;
	@Autowired
	private NoticeService noticeService;

	@RequestMapping("/notice")
	public String Notice(Model model, @PathVariable String id) {

		UserVo v1 = Pservice.checkUpdate(id);
		model.addAttribute("v1", v1);
		Map<String, Object> map = new HashMap<String, Object>();
		map = noticeService.getNotice();
		model.addAttribute("notice", map);

		return "customer/notice/notice";
	}

	@RequestMapping("/faq")
	public String Faq(Model model, @PathVariable String id) {

		UserVo v1 = Pservice.checkUpdate(id);
		model.addAttribute("v1", v1);

		Map<String, Object> map = new HashMap<String, Object>();

		map = noticeService.getNotice();
		model.addAttribute("notice", map);

		return "customer/notice/faq";
	}

	@RequestMapping("/noticeview")
	public String NoticeView(Model model, @RequestParam("noticeId") int noticeId, @PathVariable String id) {

		System.out.println("noidnoidnoid::" + noticeId);
		noticeService.NoticeHit(noticeId);

		UserVo v1 = Pservice.checkUpdate(id);
		model.addAttribute("v1", v1);

		Map<String, Object> map = new HashMap<String, Object>();
		map = noticeService.getNotice();
		model.addAttribute("notice", map);

		System.out.println("mapmapmapmap::" + map);
		Map<String, Object> map1 = new HashMap<String, Object>();

		map1 = noticeService.noticeView(noticeId);
		model.addAttribute("view", map1);

		return "customer/notice/noticeView";
	}

	@RequestMapping("/qnaview")
	public String QnaView(@RequestParam("qnaId") int noticeId) {

		return "customer/notice/qnaView";
	}

	@RequestMapping("/noticeadd")
	public String NoticeAdd(Model model, @PathVariable String id,
			@ModelAttribute NoticeVo vo) {
		String content;
		System.out.println("novonovonovo:::"+vo);
		content = vo.getNoticeContent();
		content = content.replace("\n","<br>");
		vo.setNoticeContent(content);
		noticeService.NoticeAdd(vo);
		
		Map<String, Object> map = new HashMap<String, Object>();

		map = noticeService.getNotice();
		model.addAttribute("notice", map);

		return "customer/notice/notice";
	}

}
