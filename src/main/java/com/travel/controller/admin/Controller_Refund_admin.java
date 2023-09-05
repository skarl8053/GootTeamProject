package com.travel.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.travel.service.admin.Interface_TravelService;
import com.travel.service.admin.Service_Refund_select_admin;
import com.travel.service.admin.Service_Refund_update_admin;

@Controller
@RequestMapping("admin")
public class Controller_Refund_admin {

	// 남기문
	// 관리자 - 배송관리 기능
	
	@Autowired
	private SqlSession sqlSession;
	private Interface_TravelService service;
	
	@RequestMapping(value="refund")
	public String refund_select(HttpServletRequest request, Model model) {
		
		// 이벤트 조회
		model.addAttribute("request", request);
		
		service = new Service_Refund_select_admin(sqlSession);
		service.execute(model);
		
		return "admin/refund_admin";
	}
	
	@RequestMapping(value="refund_update")
	public String refund_update(HttpServletRequest request, Model model) {
		
		// 이벤트 조회
		model.addAttribute("request", request);
		
		service = new Service_Refund_update_admin(sqlSession);
		service.execute(model);
		
		return "redirect:refund";
	}
}
