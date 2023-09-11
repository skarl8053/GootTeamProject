package com.travel.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.travel.service.admin.Interface_TravelService;

@Controller
@RequestMapping("member")
public class Controller_Event_user {

	@Autowired
	private SqlSession sqlSession;
	private Interface_TravelService service;

	@RequestMapping(value = "event_page")
	public String event_page(HttpServletRequest request, Model model) throws Exception {

		model.addAttribute("request", request);
		return null;

	}

}
