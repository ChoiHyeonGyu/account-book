package com.hipo.account_book.controller;

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
import com.hipo.account_book.service.BoardService;
import com.hipo.account_book.service.OptionService;
import com.hipo.account_book.service.ProfileService;
import com.hipo.account_book.vo.BoardVo;
import com.hipo.account_book.vo.OptionVo;
import com.hipo.account_book.vo.UserVo;

@Controller
@RequestMapping("/{id}")
public class BoardController {
	@Autowired
	private BoardService boardService;
	@Autowired
	private OptionService optionservice;
	@Autowired
	private ProfileService Pservice;
	
	@RequestMapping("/story")
	public String story(Model model, @ModelAttribute OptionVo optionvo, @RequestParam(value="p", required=true, defaultValue="1") int page, 
			@RequestParam(value="search", required=false) String search, @PathVariable String id) {
		UserVo username = Pservice.checkUpdate(id);
		model.addAttribute("profile1",Pservice.profile1(id));// 프로필 설정
		model.addAttribute("profileall", Pservice.profileall(id));// 프로필 불러오기.
		model.addAttribute("username", username);
		model.addAttribute("profile1",Pservice.profile1(id));
		model.addAttribute("option", optionservice.getCategory(optionvo));
		model.addAttribute("board", boardService.getBoardList(page, search));
		return "story/board";
	}
	
	@RequestMapping("/mystory")
	public String mystory(Model model, @ModelAttribute OptionVo optionvo, @RequestParam(value="p", required=true, defaultValue="1") int page, 
			@RequestParam(value="search", required=false) String search, @PathVariable String id) {
		UserVo username = Pservice.checkUpdate(id);
		model.addAttribute("profile1",Pservice.profile1(id));// 프로필 설정
		model.addAttribute("profileall", Pservice.profileall(id));// 프로필 불러오기.
		model.addAttribute("username", username);
		model.addAttribute("profile1",Pservice.profile1(id));
		model.addAttribute("option", optionservice.getCategory(optionvo));
		model.addAttribute("story", boardService.getBoardList(id, page, search));
		return "story/mystory";
	}
	
	@ResponseBody
	@RequestMapping("/table")
	public JSONResult table(@PathVariable String id, @RequestBody Map<String, Object> map){
		return JSONResult.success(boardService.boardcontenttable(map));
	}
	
	@RequestMapping("/boardadd")
	public String boardadd(@PathVariable String id, @ModelAttribute BoardVo boardvo, @RequestParam("file") List<MultipartFile> file){
		boardService.boardadd(id, boardvo, file);
		return "redirect:/"+id+"/story";
	}
	
	@ResponseBody
	@RequestMapping("/boardcontent")
	public JSONResult boardcontent(@RequestBody Map<String, Object> map){
		boardService.hit(Integer.parseInt(map.get("boardid").toString()));
		return JSONResult.success(boardService.boardcontent(Integer.parseInt(map.get("boardid").toString())));
	}
	
	@RequestMapping("/boardedit")
	public String boardedit(@PathVariable String id, @ModelAttribute BoardVo boardvo, @RequestParam("file") List<MultipartFile> file){
		if(id.equals(boardvo.getId())){
			boardService.boardedit(id, boardvo, file);
		}
		return "redirect:/"+id+"/story";
	}
	
	@RequestMapping("/boardremove")
	public String boardremove(@PathVariable String id, @ModelAttribute BoardVo boardvo){
		if(id.equals(boardvo.getId())){
			boardService.boardremove(boardvo.getBoardId());
		}
		return "redirect:/"+id+"/story";
	}
	
	@ResponseBody
	@RequestMapping("/commentlist")
	public JSONResult commentlist(@RequestBody Map<String, Object> map){
		return JSONResult.success(boardService.commentlist(Integer.parseInt(map.get("boardid").toString())));
	}
	
	@RequestMapping("/comment")
	public String comment(@PathVariable String id, @ModelAttribute BoardVo boardvo){
		boardService.comment(id, boardvo);
		return "redirect:/"+id+"/story";
	}
	
	@ResponseBody
	@RequestMapping("/replylist")
	public JSONResult replylist(@RequestBody Map<String, Object> map){
		return JSONResult.success(boardService.replylist(Integer.parseInt(map.get("commentid").toString())));
	}
	
	@RequestMapping("/reply")
	public String reply(@PathVariable String id, @ModelAttribute BoardVo boardvo){
		boardService.reply(id, boardvo);
		return "redirect:/"+id+"/story";
	}
	
	@ResponseBody
	@RequestMapping("/commentremove")
	public JSONResult commentremove(@PathVariable String id, @RequestBody Map<String, Object> map){
		if(id.equals(map.get("id").toString())){
			boardService.commentremove(Integer.parseInt(map.get("commentid").toString()));
			return JSONResult.success(new Object());
		}
		return JSONResult.fail("실패");
	}
	
	@ResponseBody
	@RequestMapping("/good")
	public JSONResult good(@PathVariable String id, @RequestBody Map<String, Object> map){
		if(boardService.good(id, Integer.parseInt(map.get("boardid").toString()))==false){
			return JSONResult.fail("실패");
		}
		return JSONResult.success(map);
	}
	
	@RequestMapping("/graph")
	public String graph(){
		return "report/graph";
	}
	
	@ResponseBody
	@RequestMapping("/limitgraph")
	public JSONResult limitgraph(@PathVariable String id, @RequestBody Map<String, Object> map){
		return JSONResult.success(boardService.limitgraph(id));
	}
	
	@ResponseBody
	@RequestMapping("/movelimitgraph")
	public JSONResult movelimitgraph(@PathVariable String id, @RequestBody Map<String, Object> map){
		map.put("id", id);
		return JSONResult.success(boardService.movelimitgraph(map));
	}
	
	@RequestMapping("/mygraph")
	public String mygraph(@PathVariable String id, Model model, @ModelAttribute OptionVo optionvo){
		UserVo username = Pservice.checkUpdate(id);
		model.addAttribute("username", username);
		model.addAttribute("profile1",Pservice.profile1(id));// 프로필 설정
		model.addAttribute("profileall", Pservice.profileall(id));
		model.addAttribute("option", optionservice.getCategory(optionvo));
		
		model.addAttribute("date", boardService.date());
		model.addAttribute("catemonth", boardService.imreporttable(id));
		model.addAttribute("cmsum", boardService.imreporttablesum(id));
		return "report/mygraph";
	}
	
	@RequestMapping("/mygraph2")
	public String mygraph2(@PathVariable String id, Model model, @ModelAttribute OptionVo optionvo){
		UserVo username = Pservice.checkUpdate(id); 
		model.addAttribute("username", username);
		model.addAttribute("profile1",Pservice.profile1(id));// 프로필 설정
		model.addAttribute("profileall", Pservice.profileall(id));
		model.addAttribute("option", optionservice.getCategory(optionvo));
		
		model.addAttribute("date", boardService.date());
		model.addAttribute("catemonth", boardService.exreporttable(id));
		model.addAttribute("cmsum", boardService.exreporttablesum(id));
		return "report/mygraph2";
	}
	
	@ResponseBody
	@RequestMapping("/importgraph")
	public JSONResult importgraph(@PathVariable String id, @RequestBody Map<String, Object> map){
		return JSONResult.success(boardService.importgraph(id));
	}
	
	@ResponseBody
	@RequestMapping("/exportgraph")
	public JSONResult exportgraph(@PathVariable String id, @RequestBody Map<String, Object> map){
		return JSONResult.success(boardService.exportgraph(id));
	}
	
	@RequestMapping("/mydetail")
	public String mydetail(@PathVariable String id, Model model, @ModelAttribute OptionVo optionvo, @RequestParam("month") String month){
		UserVo username = Pservice.checkUpdate(id);
		model.addAttribute("username", username);
		model.addAttribute("profile1",Pservice.profile1(id));// 프로필 설정
		model.addAttribute("profileall", Pservice.profileall(id));
		model.addAttribute("option", optionservice.getCategory(optionvo));
		
		model.addAttribute("month", month);
		model.addAttribute("date", boardService.datedetail(month));
		model.addAttribute("cateday", boardService.pselectedtable(id, month));
		model.addAttribute("cmsum", boardService.pselectedtablesum(id, month));
		return "report/mygraph_detail";
	}
	
	@RequestMapping("/mydetail2")
	public String mydetail2(@PathVariable String id, Model model, @ModelAttribute OptionVo optionvo, @RequestParam("month") String month){
		UserVo username = Pservice.checkUpdate(id); 
		model.addAttribute("username", username);
		model.addAttribute("profile1",Pservice.profile1(id));// 프로필 설정
		model.addAttribute("profileall", Pservice.profileall(id));
		model.addAttribute("option", optionservice.getCategory(optionvo));
		
		model.addAttribute("month", month);
		model.addAttribute("date", boardService.datedetail(month));
		model.addAttribute("cateday", boardService.mselectedtable(id, month));
		model.addAttribute("cmsum", boardService.mselectedtablesum(id, month));
		return "report/mygraph_detail2";
	}
	
	@ResponseBody
	@RequestMapping("/pselectedmonth")
	public JSONResult pselectedmonth(@PathVariable String id, @RequestBody Map<String, Object> map){
		map.put("id", id);
		return JSONResult.success(boardService.pselectedmonth(map));
	}
	
	@ResponseBody
	@RequestMapping("/mselectedmonth")
	public JSONResult mselectedmonth(@PathVariable String id, @RequestBody Map<String, Object> map){
		map.put("id", id);
		return JSONResult.success(boardService.mselectedmonth(map));
	}
	
	@ResponseBody
	@RequestMapping("/mselectedmonth2")
	public JSONResult mselectedmonth2(@RequestBody Map<String, Object> map){
		return JSONResult.success(boardService.mselectedmonth2(map));
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
	
	@ResponseBody
	@RequestMapping("/transgraphavg")
	public JSONResult transgraphavg(@PathVariable String id, @RequestBody Map<String, Object> map){
		return JSONResult.success(boardService.transgraphavg(map));
	}
}
