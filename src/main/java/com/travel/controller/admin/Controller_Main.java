package com.travel.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Controller_Main {
	
	@RequestMapping(value = "main")
	public String main(HttpServletRequest request, Model model) {
		
		if(request.getParameter("msg") == null || request.getParameter("msg").equals("")) {
			model.addAttribute("msg","");
		}
		else {
			model.addAttribute("msg",request.getParameter("msg"));
		}
		
		return "main/main_page";
	}
	@RequestMapping("main_loading")
	public String main_loading(HttpServletRequest request, Model model) {
		
		return "main/main_loading";
		
	}
	
}
