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

	public Model defaultinfo(Model model, String id, OptionVo vo) {
		model.addAttribute("username", profileDao.checkUpdate(id));
		model.addAttribute("profile1", profileDao.profile1(id));
		model.addAttribute("profileall", profileDao.profileall(id));
		model.addAttribute("option", optionDao.category(vo));
		 model.addAttribute("profilegraph",profileDao.graph(id)); 
		model.addAttribute("profilegraph2", profileDao.graph2(id));
	
		return model;
	}
}
