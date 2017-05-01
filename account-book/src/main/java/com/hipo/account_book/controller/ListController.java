package com.hipo.account_book.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.javassist.tools.reflect.Sample;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hipo.account_book.dto.JSONResult;
import com.hipo.account_book.service.ListService;
import com.hipo.account_book.service.OptionService;
import com.hipo.account_book.vo.BoardVo;
import com.hipo.account_book.vo.ListPagingVo;
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
		String list = service.add(vo);
		
		return "redirect:/"+id+"/main";
		
	}
	
	@ResponseBody
	@RequestMapping("/modify")
	public JSONResult modify(@PathVariable String id, @RequestBody Map<String, Object> map){
		System.out.println("sssssss"+map);
		return JSONResult.success(service.modify(Integer.parseInt(map.get("listid").toString())));//여기서 에러.
		
	} 
	@RequestMapping("/modify1")
	public String modify1(@ModelAttribute ListVo vo,@PathVariable String id){
		System.out.println("마지막 수정 옵니까.?" + vo);
		service.modify1(vo);
		
		return "redirect:/"+id+"/main";
		
	}
	
	@RequestMapping("/boardadd")
	public String boardadd(@PathVariable String id, @ModelAttribute BoardVo boardvo, @RequestParam("file") List<MultipartFile> file){
		service.boardadd(id, boardvo, file);
		return "redirect:/"+id+"/main";
	}
	
	@ResponseBody
	@RequestMapping("/boardcontent")
	public JSONResult boardcontent(@RequestBody Map<String, Object> map){
		service.hit(Integer.parseInt(map.get("boardid").toString()));
		return JSONResult.success(service.boardcontent(Integer.parseInt(map.get("boardid").toString())));
	}
	
	@RequestMapping("/boardedit")
	public String boardedit(@PathVariable String id, @ModelAttribute BoardVo boardvo, @RequestParam("file") List<MultipartFile> file){
		if(id.equals(boardvo.getId())){
			service.boardedit(id, boardvo, file);
		}
		return "redirect:/"+id+"/main";
	}
	
	@RequestMapping("/boardremove")
	public String boardremove(@PathVariable String id, @ModelAttribute BoardVo boardvo){
		if(id.equals(boardvo.getId())){
			service.boardremove(boardvo.getBoardId());
		}
		return "redirect:/"+id+"/main";
	}
	
	@ResponseBody
	@RequestMapping("/commentlist")
	public JSONResult commentlist(@RequestBody Map<String, Object> map){
		return JSONResult.success(service.commentlist(Integer.parseInt(map.get("boardid").toString())));
	}
	
	@RequestMapping("/comment")
	public String comment(@PathVariable String id, @ModelAttribute BoardVo boardvo){
		service.comment(id, boardvo);
		return "redirect:/"+id+"/main";
	}
	
	@ResponseBody
	@RequestMapping("/replylist")
	public JSONResult replylist(@RequestBody Map<String, Object> map){
		return JSONResult.success(service.replylist(Integer.parseInt(map.get("commentid").toString())));
	}
	
	@RequestMapping("/reply")
	public String reply(@PathVariable String id, @ModelAttribute BoardVo boardvo){
		service.reply(id, boardvo);
		return "redirect:/"+id+"/main";
	}
	
	@ResponseBody
	@RequestMapping("/commentremove")
	public JSONResult commentremove(@PathVariable String id, @RequestBody Map<String, Object> map){
		if(id.equals(map.get("id").toString())){
			service.commentremove(Integer.parseInt(map.get("commentid").toString()));
			return JSONResult.success(new Object());
		}
		return JSONResult.fail("실패");
	}
	
	@ResponseBody
	@RequestMapping("/good")
	public JSONResult good(@PathVariable String id, @RequestBody Map<String, Object> map){
		if(service.good(id, Integer.parseInt(map.get("boardid").toString()))==false){
			return JSONResult.fail("실패");
		}
		return JSONResult.success(map);
	}
	
}
