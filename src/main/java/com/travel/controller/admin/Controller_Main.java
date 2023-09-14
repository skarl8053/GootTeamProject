package com.travel.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.travel.service.admin.Interface_TravelService;
import com.travel.service.user.Event_On_Service;

@Controller
public class Controller_Main {
	
	@Autowired
	private SqlSession sqlSession;
	private Interface_TravelService service;
	
	@RequestMapping(value = "main")
	public String main(HttpServletRequest request, Model model) {
		
		if(request.getParameter("msg") == null || request.getParameter("msg").equals("")) {
			model.addAttribute("msg","");
		}
		else {
			model.addAttribute("msg",request.getParameter("msg"));
		}
		
		System.out.println("main Controller");
		model.addAttribute("request", request);

		service = new Event_On_Service(sqlSession);
		service.execute(model);
		
		return "main/main_page";
	}
	@RequestMapping("main_loading")
	public String main_loading(HttpServletRequest request, Model model) {
		
		return "main/main_loading";
		
	}
	
}
