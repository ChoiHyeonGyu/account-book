package com.hipo.account_book.service;

import java.util.Calendar;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hipo.account_book.repository.FrontDao;
import com.hipo.account_book.vo.UserVo;

@Service
public class FrontService {
	@Autowired
	private FrontDao frontDao;
	
	Calendar calendar = Calendar.getInstance();
	
	public UserVo fblogin(Map<String, Object> map){
		return frontDao.fbselect(map.get("id").toString());
	}
	
	public void fbjoin(Map<String, Object> map){
		UserVo uservo = new UserVo();
		if(map.get("email") != null){
			uservo.setId(map.get("email").toString());
		} else {
			uservo.setId(map.get("id").toString());
		}
		uservo.setName(map.get("name").toString());
		if(map.get("gender").toString().equals("male")){
			uservo.setGender("남자");
		} else {
			uservo.setGender("여자");
		}
		if(map.get("birthday") != null){
			String birth = map.get("birthday").toString();
			Pattern p = Pattern.compile("(\\d{2})/(\\d{2})/(\\d{4})");
			Matcher m = p.matcher(birth);
			if(m.find()){
				uservo.setAge(String.valueOf(calendar.getWeekYear()-Integer.parseInt(m.group(3))+1));
			}
		} else if(map.get("age_range") != null) {
			@SuppressWarnings("unchecked")
			Map<String, Object> map2 = (Map<String, Object>) map.get("age_range");
			if(map2.get("max") != null) {
				uservo.setAge(map2.get("max").toString());
			}
		} else {
			uservo.setAge("0");
		}
		uservo.setPassword(uservo.getId());
		frontDao.fbinsert(uservo);
	}
	
	public String checkId(Map<String, Object> map){
		String id = frontDao.checkselect(map.get("id").toString());
		if(id!=null){
			return "fail";
		}
		return "success";
	}
	
	public void join(UserVo uservo){
		uservo.setAge(String.valueOf(calendar.getWeekYear()-uservo.getBirthYear()+1));
		frontDao.insert(uservo);
	}
	
	public UserVo connmain(UserVo uservo){
		return frontDao.login(uservo);
	}
}
