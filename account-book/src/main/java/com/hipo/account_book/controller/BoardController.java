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
	
	@RequestMapping("/logon")
	public String logon(@PathVariable String id, Model model){
		UserVo v1 = Pservice.checkUpdate(id);
		model.addAttribute("v1",v1);
		return "frontpage/logon";
	}
	
	@RequestMapping("/board")
	public String List(Model model, @ModelAttribute OptionVo optionvo, @RequestParam(value="p", required=true, defaultValue="1") int page, 
			@RequestParam(value="search", required=false) String search, @PathVariable String id) {
		UserVo v1 = Pservice.checkUpdate(id);
		model.addAttribute("v1",v1);
		
		List<OptionVo> option = optionservice.getCategory(optionvo);
		model.addAttribute("board", boardService.getBoardList(page, search));
		model.addAttribute("option", option);
		return "mypage/mystory/mystory";
	}
	
	@RequestMapping("/boardadd")
	public String boardadd(@PathVariable String id, @ModelAttribute BoardVo boardvo, @RequestParam("file") List<MultipartFile> file){
		boardService.boardadd(id, boardvo, file);
		return "redirect:/"+id+"/board";
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
		return "redirect:/"+id+"/board";
	}
	
	@RequestMapping("/boardremove")
	public String boardremove(@PathVariable String id, @ModelAttribute BoardVo boardvo){
		if(id.equals(boardvo.getId())){
			boardService.boardremove(boardvo.getBoardId());
		}
		return "redirect:/"+id+"/board";
	}
	
	@ResponseBody
	@RequestMapping("/commentlist")
	public JSONResult commentlist(@RequestBody Map<String, Object> map){
		return JSONResult.success(boardService.commentlist(Integer.parseInt(map.get("boardid").toString())));
	}
	
	@RequestMapping("/comment")
	public String comment(@PathVariable String id, @ModelAttribute BoardVo boardvo){
		boardService.comment(id, boardvo);
		return "redirect:/"+id+"/board";
	}
	
	@ResponseBody
	@RequestMapping("/replylist")
	public JSONResult replylist(@RequestBody Map<String, Object> map){
		return JSONResult.success(boardService.replylist(Integer.parseInt(map.get("commentid").toString())));
	}
	
	@RequestMapping("/reply")
	public String reply(@PathVariable String id, @ModelAttribute BoardVo boardvo){
		boardService.reply(id, boardvo);
		return "redirect:/"+id+"/board";
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
	@RequestMapping("/graphmonth")
	public JSONResult graphmonth(@PathVariable String id, @RequestBody Map<String, Object> map){
		return JSONResult.success(boardService.graphmonth(id));
	}
	
	@ResponseBody
	@RequestMapping("/graphyear")
	public JSONResult graphyear(@PathVariable String id, @RequestBody Map<String, Object> map){
		return JSONResult.success(boardService.graphyear(id));
	}
	
	@ResponseBody
	@RequestMapping("/graphavgdefault")
	public JSONResult graphavgdefault(@PathVariable String id, @RequestBody Map<String, Object> map){
		return JSONResult.success(boardService.graphavgdefault(id));
	}
	
	@ResponseBody
	@RequestMapping("/transgraphavg")
	public JSONResult transgraphavg(@PathVariable String id, @RequestBody Map<String, Object> map){
		if(map.get("gender").toString().equals("성별") == false && map.get("age").toString().equals("나이") == false){
			return JSONResult.success(boardService.transgraphavg(map.get("gender").toString(), map.get("age").toString()));
		} else if(map.get("gender").toString().equals("성별") == false && map.get("age").toString().equals("나이")) {
			return JSONResult.success(boardService.transgraphavg1(map.get("gender").toString()));
		} else if(map.get("gender").toString().equals("성별") && map.get("age").toString().equals("나이") == false) {
			return JSONResult.success(boardService.transgraphavg2(map.get("age").toString()));
		}
		return JSONResult.success(boardService.graphavgdefault(id));
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
		UserVo v1 = Pservice.checkUpdate(id);
		model.addAttribute("v1",v1);
		List<OptionVo> option = optionservice.getCategory(optionvo);
		model.addAttribute("option", option);
		return "report/mygraph";
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
}
