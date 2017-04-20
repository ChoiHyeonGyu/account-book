package com.hipo.account_book.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hipo.account_book.repository.UserDao;
import com.hipo.account_book.vo.UserVo;

/**
 * Servlet implementation class UserController
 */

@Controller
@RequestMapping( "/user" )
public class UserController extends HttpServlet {
	@Override
	 protected void doPost(HttpServletRequest req, HttpServletResponse resp)
	 throws ServletException, IOException {
	 
		System.out.println("test");
		
	 req.setCharacterEncoding("UTF-8");
	 //req.setCharacterEncoding("EUC-KR");
	 //한글처리
	 
	 UserVo vo = new UserVo();
	 UserDao dao = new UserDao();
	 PrintWriter out = resp.getWriter();
	 int result;
	 
	 int age;
	 age = 2017 - (Integer.parseInt(req.getParameter("year")));
	 
	 vo.setId(req.getParameter("id"));
	 vo.setPassword(req.getParameter("password"));
	 vo.setName(req.getParameter("name"));
	 vo.setGender(req.getParameter("gender"));
	 vo.setTotal(Integer.parseInt(req.getParameter("total")));
	 vo.setAge(age);
	 
	 

	 result = dao.insertjoin(vo);
	 
	 if(result==0){
	 System.out.println("Faile");
	 }else{
	 System.out.println("Sucsses");
	 }
	 }

}
