package com.hipo.account_book.androidservice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hipo.account_book.androidrepository.AndroidUserDao;
import com.hipo.account_book.vo.UserVo;

@Service
public class AndroidUserService {

	@Autowired
	private AndroidUserDao dao;

	public boolean join(UserVo vo) {
		String age = vo.getAge();
		if (age.equals(null)) {
			System.out.println("age is null");
			vo.setAge("0");

		}
		System.out.println("service ! " + vo.toString());

		return dao.join(vo);
	}

	public UserVo login(String id) {
		return dao.login(id);
	}

}
