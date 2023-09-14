package com.travel.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.travel.service.admin.Interface_TravelService;
import com.travel.service.user.Event_Attend_Service;
import com.travel.service.user.Event_List_Service;
import com.travel.service.user.Event_Page_Service;

@Controller
@RequestMapping("user")
public class Controller_Event_user { 

	@Autowired
	private SqlSession sqlSession;
	private Interface_TravelService service;

	@RequestMapping(value = "event_notice")
	public String event_notice(HttpServletRequest request, Model model) {
		
		System.out.println("event_notice Controller");
		model.addAttribute("request", request);

		service = new Event_List_Service(sqlSession);
		service.execute(model);
		
		return "user/event_notice_user";
	}
	
	// 이벤트 참가하기 버튼 클릭 시
	@RequestMapping(value = "event_attend")
	public String event_attend(HttpServletRequest request, Model model) {
		
		System.out.println("event_attend Controller");
		model.addAttribute("request", request);
		
		service = new Event_Attend_Service(sqlSession);
		service.execute(model);
		
		return "redirect:/main";
	}
	
	@RequestMapping(value = "event_page")
	public String event_page(HttpServletRequest request, Model model) {
		
		System.out.println("event_page Controller");
		model.addAttribute("request", request);

		service = new Event_Page_Service(sqlSession);
		service.execute(model);
		
		return "user/event_user";
	}

}
