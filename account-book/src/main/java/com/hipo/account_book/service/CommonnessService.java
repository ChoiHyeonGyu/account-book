package com.hipo.account_book.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.hipo.account_book.repository.OptionDao;
import com.hipo.account_book.repository.ProfileDao;
import com.hipo.account_book.vo.OptionVo;

@Service
public class CommonnessService {
	@Autowired
	private ProfileDao profileDao;
	@Autowired
	private OptionDao optionDao;
	
	public Model defaultinfo(Model model, String id, OptionVo vo){
		model.addAttribute("username", profileDao.checkUpdate(id));
		model.addAttribute("profile1", profileDao.profile1(id));
		model.addAttribute("profileall", profileDao.profileall(id));
		model.addAttribute("option", optionDao.category(vo));
		model.addAttribute("profilegraph", profileDao.graph(id));
		/*model.addAttribute("profilegraph2", profileDao.graph2(id));
		model.addAttribute("profilegraph3", profileDao.graph3(id));
		model.addAttribute("profilegraph4", profileDao.graph4(id));
		model.addAttribute("profilegraph5", profileDao.graph5(id));
		model.addAttribute("profilegraph6", profileDao.graph6(id));
		model.addAttribute("profilegraph7", profileDao.graph7(id));*/
		return model;
	}
}
