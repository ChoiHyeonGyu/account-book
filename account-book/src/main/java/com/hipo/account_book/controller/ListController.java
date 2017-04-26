package com.hipo.account_book.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hipo.account_book.dto.JSONResult;
import com.hipo.account_book.service.ListService;
import com.hipo.account_book.service.OptionService;
import com.hipo.account_book.vo.BoardVo;
import com.hipo.account_book.vo.ListVo;
import com.hipo.account_book.vo.OptionVo;

@Controller
@RequestMapping("/{id}")
public class ListController {
	@Autowired
	private ListService service;
	@Autowired
	private OptionService optionservice;

	@RequestMapping("/main")
	public String List(Model model ,@ModelAttribute OptionVo optionvo,@ModelAttribute ListVo vo, @RequestParam(value="p", required=true, defaultValue="1") int page, 
			@RequestParam(value="search", required=false) String search) {
		List<ListVo> list = service.getList(vo);
		
		List<OptionVo> option = optionservice.getCategory(optionvo);

		model.addAttribute("board", service.getBoardList(page, search));
		
		model.addAttribute("list", list);
		System.out.println("카테고리 ~~~!!!!!!!!!"+ option);
		model.addAttribute("option", option);
		return "main";
	}
	@RequestMapping("/listdelete")
	public String List(@PathVariable String id,@ModelAttribute ListVo vo){
		 service.delete(vo);
		return "redirect:/"+id+"/main";
		
	}
	@RequestMapping("/add")
	public String add(@ModelAttribute ListVo vo,@PathVariable String id){
		System.out.println("더하는 부분 아이디 잘가지고 옵니다" + vo);
		String list = service.add(vo);
		
		return "redirect:/"+id+"/main";
		
	}
	
	@ResponseBody
	@RequestMapping("/modify")
	public JSONResult modify(@PathVariable String id, @RequestBody Map<String, Object> map){
		System.out.println("고치는 부분 입니다.무엇을 가지고 오나요" + map);
		//service.modify(map);
		
		return JSONResult.success(service.modify (Integer.parseInt(map.get("listId").toString())));
	} 
	
	@RequestMapping("/boardadd")
	public String boardadd(@PathVariable String id, @ModelAttribute BoardVo boardvo, @RequestParam("file") List<MultipartFile> file){
		service.boardadd(id, boardvo, file);
		return "redirect:/"+id+"/main";
	}
	
	@ResponseBody
	@RequestMapping("/boardcontent")
	public JSONResult boardcontent(@RequestBody Map<String, Object> map){
		return JSONResult.success(service.boardcontent(Integer.parseInt(map.get("boardid").toString())));
	}
	
	@RequestMapping("/boardedit")
	public String boardedit(@PathVariable String id, @ModelAttribute BoardVo boardvo, @RequestParam("file") List<MultipartFile> file){
		service.boardedit(id, boardvo, file);
		return "redirect:/"+id+"/main";
	}
	
	@RequestMapping("/boardremove")
	public String boardremove(@PathVariable String id, @ModelAttribute BoardVo boardvo){
		service.boardremove(boardvo.getBoardId());
		return "redirect:/"+id+"/main";
	}
}
