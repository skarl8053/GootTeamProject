package com.travel.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.travel.dao.user.IDao_pushal_user;
import com.travel.service.admin.Interface_TravelService;
import com.travel.service.user.Service_pushaldelivery_user;
import com.travel.service.user.Service_pushalrefund_user;
import com.travel.service.user.Service_pushpayment_user;
import com.travel.service.user.Service_refundcheck_user;

@Controller
@RequestMapping("user")
public class Controller_Pushal_user {

	Interface_TravelService travelservice;
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("pushaldelivery")
	public String pushaldelivery(Model model, HttpServletRequest request) {
		
		travelservice = new Service_pushaldelivery_user(sqlSession);
		model.addAttribute("request", request);
		travelservice.execute(model);
		
		return "user/pushal_delivery_user";
	}
	
	@RequestMapping("pushalpayment")
	public String pushalpayment(Model model, HttpServletRequest request) {
		
		travelservice = new Service_pushpayment_user(sqlSession);
		model.addAttribute("request", request);
		travelservice.execute(model);
		
		return "user/pushal_payment_user";
	}
	
	@RequestMapping("pushalrefund")
	public String pushalrefund(Model model, HttpServletRequest request) {
		
		travelservice = new Service_pushalrefund_user(sqlSession);
		model.addAttribute("request",request);
		travelservice.execute(model);
		
		return "user/pushal_refund_user";
	}
	
	
}
