package com.hipo.account_book.service;

import java.util.Calendar;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hipo.account_book.repository.FrontDao;
import com.hipo.account_book.vo.FBUserVo;

@Service
public class FrontService {
	@Autowired
	private FrontDao frontDao;
	
	public void fbjoin(FBUserVo fbuservo){
		if(true){
			String birth = fbuservo.getBirth();
			Pattern p = Pattern.compile("/");
			Matcher m = p.matcher(birth);
			Calendar calendar = null;
			System.out.println(calendar.getWeekYear());
			System.out.println(m.group(3));
			//uservo.setAge();
		} else {
			//frontDao.fbinsert(uservo);
		}
	}
}
