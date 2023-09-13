package com.travel.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.travel.service.admin.Interface_TravelService;
import com.travel.service.user.Service_CartToPayment_Select_user;
import com.travel.service.user.Service_Cart_Delete_user;
import com.travel.service.user.Service_Cart_Select_user;

@Controller
@RequestMapping("user")
public class Controller_Cart_user {
	
	@Autowired
	private SqlSession sqlSession;
	private Interface_TravelService service;
	
	@RequestMapping("cart")
	public String reviewlist(HttpServletRequest request, Model model) {
		
		model.addAttribute("request",request);
		
		service = new Service_Cart_Select_user(sqlSession);
		service.execute(model);
		
		return "user/cart_form_user"; 
	}
	
	@RequestMapping("cart_to_payment")
	public String cart_to_payment(HttpServletRequest request, Model model) {
		
		model.addAttribute("request",request);
		
		Service_CartToPayment_Select_user srv = new Service_CartToPayment_Select_user(sqlSession);
		String url = srv.execute(model);
		
		return "redirect:" + url;
	}
	
	@RequestMapping("cart_delete")
	public String cart_delete(HttpServletRequest request, Model model) {
		
		model.addAttribute("request",request);
		
		service = new Service_Cart_Delete_user(sqlSession);
		service.execute(model);
		
		return "redirect:cart?m_no=" + request.getParameter("m_no");
	}
	
	
}
