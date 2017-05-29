package com.hipo.account_book.androidcontroller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectReader;

@Controller
@RequestMapping("/android/{id}")
public class AndroidChartController {

	@RequestMapping("findCategory")
	public void findCategory(HttpServletRequest request) {
		String categoryJson = request.getParameter("categoryJson");
		ObjectReader reader = new ObjectMapper().reader(Map.class);
		try {
			Map<String, String> map = reader.readValue(categoryJson);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("json to map fail");
		}

	}

}
