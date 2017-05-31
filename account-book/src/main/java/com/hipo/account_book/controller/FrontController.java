package com.hipo.account_book.controller;

import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hipo.account_book.dto.JSONResult;
import com.hipo.account_book.service.BoardService;
import com.hipo.account_book.service.FrontService;
import com.hipo.account_book.vo.UserVo;

@Controller
public class FrontController {
	@Autowired
	private FrontService frontService;
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("")
	public String login(){
		return "frontpage/login";
	}
	
	@ResponseBody
	@RequestMapping("/fbjoin")
	public JSONResult fbjoin(@RequestBody Map<String, Object> map){
		UserVo uservo = frontService.fblogin(map);
		if(uservo==null){
			frontService.fbjoin(map);
		}
		return JSONResult.success(map.get("id"));
	}
	
	@ResponseBody
	@RequestMapping("/checkid")
	public JSONResult checkid(@RequestBody Map<String, Object> map){
		if(frontService.checkId(map)=="fail"){
			return JSONResult.fail("");
		}
		return JSONResult.success(frontService.checkId(map));
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(@ModelAttribute @Valid UserVo uservo, BindingResult result, Model model){
		if (result.hasErrors()) {
			model.addAttribute("result", result.getModel());
			model.addAttribute("error", result.getAllErrors());
			return "login";
		}
		frontService.join(uservo);
		return "redirect:/";
	}
	
	@RequestMapping("/connmain")
	public String connmain(@ModelAttribute UserVo uservo, Model model){
		UserVo uservo2 = frontService.connmain(uservo);
		if(uservo2==null){
			model.addAttribute("res", uservo);
			model.addAttribute("ult", uservo2);
			return "login";
		}
		return "redirect:/"+uservo.getId()+"/logon";
	}
	
	@RequestMapping("/main")
	public String main(@RequestParam(value="id", required=false, defaultValue="") String id){
		return "redirect:/"+id+"/logon";
	}
	
	@RequestMapping("/story")
	public String story(Model model, @RequestParam(value="p", required=true, defaultValue="1") int page, @RequestParam(value="search", required=false) String search) {
		model.addAttribute("board", boardService.getBoardList(page, search));
		return "story/viewboard";
	}
	
	@ResponseBody
	@RequestMapping("/boardcontent")
	public JSONResult boardcontent(@RequestBody Map<String, Object> map){
		boardService.hit(Integer.parseInt(map.get("boardid").toString()));
		return JSONResult.success(boardService.boardcontent(Integer.parseInt(map.get("boardid").toString())));
	}
	
	@ResponseBody
	@RequestMapping("/commentlist")
	public JSONResult commentlist(@RequestBody Map<String, Object> map){
		return JSONResult.success(boardService.commentlist(Integer.parseInt(map.get("boardid").toString())));
	}
	
	@ResponseBody
	@RequestMapping("/replylist")
	public JSONResult replylist(@RequestBody Map<String, Object> map){
		return JSONResult.success(boardService.replylist(Integer.parseInt(map.get("commentid").toString())));
	}
	
	@RequestMapping("/graph")
	public String graph(Model model){
		model.addAttribute("currentuserid", "");
		return "report/graph";
	}
	
	@ResponseBody
	@RequestMapping("/graphjinanmonth")
	public JSONResult graphjinanmonth(@RequestBody Map<String, Object> map){
		return JSONResult.success(boardService.graphjinanmonth());
	}
	
	@ResponseBody
	@RequestMapping("/graphttmonth")
	public JSONResult graphttmonth(@RequestBody Map<String, Object> map){
		return JSONResult.success(boardService.graphttmonth());
	}
	
	@ResponseBody
	@RequestMapping("/allexportgraph")
	public JSONResult allexportgraph(@RequestBody Map<String, Object> map){
		return JSONResult.success(boardService.allexportgraph());
	}
	
	@ResponseBody
	@RequestMapping("/alllimitgraph")
	public JSONResult alllimitgraph(@RequestBody Map<String, Object> map){
		return JSONResult.success(boardService.alllimitgraph());
	}
}
