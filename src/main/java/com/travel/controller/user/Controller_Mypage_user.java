package com.travel.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.travel.service.admin.Interface_TravelService;
import com.travel.service.user.Service_Refund_Insert_User;
import com.travel.service.user.Service_Review_List_User;

@Controller
@RequestMapping("user")
public class Controller_Mypage_user {
	
	@Autowired
	private SqlSession sqlSession;
	private Interface_TravelService service;
	
	@RequestMapping("refund_insert")
	public String reviewlist(HttpServletRequest request, Model model) {
		
		// 환불 진행
		
		model.addAttribute("request",request);
		
		service = new Service_Refund_Insert_User(sqlSession);
		service.execute(model);

		return "";
	}
	
}
