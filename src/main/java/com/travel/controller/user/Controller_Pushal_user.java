package com.travel.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.travel.service.admin.Interface_TravelService;
import com.travel.service.user.Service_Pushal_Select_user;

@Controller
@RequestMapping("user")
public class Controller_Pushal_user {
	Interface_TravelService travelservice;
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("pushal")
	public String pushalpayment(Model model, HttpServletRequest request) {
		
		travelservice = new Service_Pushal_Select_user(sqlSession);
		model.addAttribute("request", request);
		travelservice.execute(model);
		
		return "user/pushal_list_user";
	}
	
}
