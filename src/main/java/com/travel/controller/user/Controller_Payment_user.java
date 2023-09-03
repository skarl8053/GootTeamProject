package com.travel.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.travel.service.admin.Interface_TravelService;
import com.travel.service.user.Service_Payment_Coupon_Service;
import com.travel.service.user.Service_Payment_Insert_Service;
import com.travel.service.user.Service_Payment_Service;

@Controller
@RequestMapping("user")
public class Controller_Payment_user {

	// 남기문
	// 회원 숙소 예약 화면
	@Autowired
	private SqlSession sqlSession;
	private Interface_TravelService service;
	
	@RequestMapping("payment")
	public String reviewlist(HttpServletRequest request, Model model) {
		
		model.addAttribute("request",request);
		
		service = new Service_Payment_Service(sqlSession);
		service.execute(model);
		
		return "user/payment_form_user";
	}
	
	@RequestMapping("payment_exec")
	public String payment_exec(HttpServletRequest request, Model model) {
		
		model.addAttribute("request",request);
		
		service = new Service_Payment_Insert_Service(sqlSession);
		service.execute(model);
		
		return "redirect:/main";
	}
	
	@RequestMapping("couponpopup")
	public String coupon_popup(HttpServletRequest request, Model model) {
		
		model.addAttribute("request",request);
		
		service = new Service_Payment_Coupon_Service(sqlSession);
		service.execute(model);
		
		return "/user/payment_coupon_popup_user";
	}
}
