package com.travel.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.travel.service.admin.Interface_TravelService;
import com.travel.service.user.Service_refundcheck_user;

@Controller
public class Controller_refundcheck_user {
	Interface_TravelService travelservice;
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("refundcheck")
	public String refundcheck(Model model, HttpServletRequest request) {
		
		travelservice = new Service_refundcheck_user(sqlSession);
		model.addAttribute("request", request);
		travelservice.execute(model);
		
		return "refundinfo_check_user";
	}
}
