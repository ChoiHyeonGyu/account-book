package com.hipo.account_book.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hipo.account_book.dto.JSONResult;
import com.hipo.account_book.service.NoticeService;
import com.hipo.account_book.vo.NoticeVo;

@Controller
public class OutNoticeController {
	@Autowired
	private NoticeService noticeService;

	@RequestMapping("/notice")
	public String Notice(Model model, @RequestParam(value="p", required=true, defaultValue="1") int page) {		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map = noticeService.getNotice(page);
		model.addAttribute("notice", map);

		return "customer/notice/notice";
	}

	@RequestMapping("/faq")
	public String Faq(Model model, @RequestParam(value="p", required=true, defaultValue="1") int page) {
		Map<String, Object> map = new HashMap<String, Object>();

		map = noticeService.getNotice(page);
		model.addAttribute("notice", map);

		return "customer/notice/faq";
	}

	@RequestMapping("/noticeview")
	public String NoticeView(Model model, @RequestParam("noticeId") int noticeId, @RequestParam(value="p", required=true, defaultValue="1") int page) {

		System.out.println("noidnoidnoid::" + noticeId);
		noticeService.NoticeHit(noticeId);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map = noticeService.getNotice(page);
		model.addAttribute("notice", map);

		System.out.println("mapmapmapmap::" + map);
		Map<String, Object> map1 = new HashMap<String, Object>();

		map1 = noticeService.noticeView(noticeId);
		model.addAttribute("view", map1);

		return "customer/notice/noticeView";
	}

	@RequestMapping("/qnaview")
	public String QnaView(Model model, @RequestParam("qnaId") int qnaId, @RequestParam(value="p", required=true, defaultValue="1") int page) {
		
		noticeService.QnaHit(qnaId);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map = noticeService.getNotice(page);
		model.addAttribute("notice", map);

		System.out.println("mapmapmapmap::" + map);
		Map<String, Object> map1 = new HashMap<String, Object>();

		map1 = noticeService.noticeView(qnaId);
		model.addAttribute("view", map1);

		return "customer/notice/qnaView";
	}

	@RequestMapping("/noticeadd")
	public String NoticeAdd(Model model, @ModelAttribute NoticeVo vo, @RequestParam(value="p", required=true, defaultValue="1") int page) {		
		String content;
		System.out.println("nvo:::"+vo);
		content = vo.getNoticeContent();
		content = content.replace("\n","<br>");
		vo.setNoticeContent(content);
		noticeService.NoticeAdd(vo);
		
		Map<String, Object> map = new HashMap<String, Object>();

		map = noticeService.getNotice(page);
		model.addAttribute("notice", map);

		return "customer/notice/notice";
	}
	
	@RequestMapping("/qnaadd")
	public String QnaAdd(Model model, @ModelAttribute NoticeVo vo, @RequestParam(value="p", required=true, defaultValue="1") int page) {		
		String content;
		System.out.println("qvo:::"+vo);
		content = vo.getQnaContent();
		content = content.replace("\n","<br>");
		vo.setQnaContent(content);
		noticeService.QnaAdd(vo);
		
		Map<String, Object> map = new HashMap<String, Object>();

		map = noticeService.getNotice(page);
		model.addAttribute("notice", map);

		return "customer/notice/faq";
	}
	
	@ResponseBody
	@RequestMapping("/noticemodify1")
	public JSONResult noticeModify1(@RequestBody Map<String, Object> map) {
		NoticeVo vo;
		String content;
		
		System.out.println("oooooooooooooo-----:"+map);
		
		vo = noticeService.NoticeModify1(Integer.parseInt(map.get("noticeId").toString()));
		content = vo.getNoticeContent();
		content = content.replace("<br>","\n");
		vo.setNoticeContent(content);
		
		return JSONResult.success(vo);// 여기서																							// 에러.
	}
	
	@RequestMapping("/noticemodify")
	public String NoticeModify(Model model, @ModelAttribute NoticeVo vo, @RequestParam(value="p", required=true, defaultValue="1") int page) {
		int noticeId = vo.getNoticeId();
		String content;
		
		System.out.println("vovovomodify:"+vo);
		
		content = vo.getNoticeContent();
		content = content.replace("\n","<br>");
		vo.setNoticeContent(content);
		noticeService.NoticeModify(vo);

		Map<String, Object> map = new HashMap<String, Object>();
		map = noticeService.getNotice(page);
		model.addAttribute("notice", map);
		
		Map<String, Object> map1 = new HashMap<String, Object>();

		map1 = noticeService.noticeView(noticeId);
		model.addAttribute("view", map1);
		
		return "customer/notice/noticeView";
	}
	
	@ResponseBody
	@RequestMapping("/qnamodify1")
	public JSONResult QnaModify1(@RequestBody Map<String, Object> map) {
		NoticeVo vo;
		String content;
		
		System.out.println("qqqq-----:"+map);
		
		vo = noticeService.QnaModify1(Integer.parseInt(map.get("qnaId").toString()));
		content = vo.getQnaContent();
		content = content.replace("<br>","\n");
		vo.setQnaContent(content);
		
		return JSONResult.success(vo);// 여기서																							// 에러.
	}
	
	@RequestMapping("/qnamodify")
	public String QnaModify(Model model, @ModelAttribute NoticeVo vo, @RequestParam(value="p", required=true, defaultValue="1") int page) {
		int qnaId = vo.getQnaId();
		String content;
		
		System.out.println("qqqmodify:"+vo);
		
		content = vo.getQnaContent();
		content = content.replace("\n","<br>");
		vo.setQnaContent(content);
		noticeService.QnaModify(vo);

		Map<String, Object> map = new HashMap<String, Object>();
		map = noticeService.getNotice(page);
		model.addAttribute("notice", map);
		
		Map<String, Object> map1 = new HashMap<String, Object>();

		map1 = noticeService.noticeView(qnaId);
		model.addAttribute("view", map1);
		
		return "customer/notice/qnaView";
	}
	
	@RequestMapping("/noticedelete")
	public String NoticeDelete(Model model, @ModelAttribute NoticeVo vo, @RequestParam(value="p", required=true, defaultValue="1") int page) {
		System.out.println("deleteidididi:"+vo);
		
		noticeService.NoticeDelete(vo);

		Map<String, Object> map = new HashMap<String, Object>();
		map = noticeService.getNotice(page);
		model.addAttribute("notice", map);
		
		return "customer/notice/notice";
	}
	
	@RequestMapping("/qnadelete")
	public String QnaDelete(Model model, @ModelAttribute NoticeVo vo, @RequestParam(value="p", required=true, defaultValue="1") int page) {
		System.out.println("deleteqqqq:"+vo);
		
		noticeService.QnaDelete(vo);

		Map<String, Object> map = new HashMap<String, Object>();
		map = noticeService.getNotice(page);
		model.addAttribute("notice", map);
		
		return "customer/notice/faq";
	}

}
