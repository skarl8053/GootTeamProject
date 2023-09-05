package com.travel.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.travel.service.admin.Interface_TravelService;
import com.travel.service.user.Service_Refund_Insert_User;
import com.travel.service.user.Service_Refund_Select_User;

@Controller
@RequestMapping("user")
public class Controller_Mypage_user {
	
	@Autowired
	private SqlSession sqlSession;
	private Interface_TravelService service;
	
	@RequestMapping("mypage/refund_popup")
	public String refund_popup(HttpServletRequest request, Model model) {
		
		// 남기문
		// 환불 팝업
		// M_NO, ORDER_NO 파라미터 필요함..
		
		model.addAttribute("request",request);
		
		service = new Service_Refund_Select_User(sqlSession);
		service.execute(model);

		return "/user/mypage_refundpopup_user";
		
	}
	
	@RequestMapping("mypage/refund_insert")
	public String refund_insert(HttpServletRequest request, Model model) {
		
		// 남기문
		// 환불 진행
		
		// 돌아갈 주소 정할 것
		
		model.addAttribute("request",request);
		
		service = new Service_Refund_Insert_User(sqlSession);
		service.execute(model);

		return "";
	}
	
}
