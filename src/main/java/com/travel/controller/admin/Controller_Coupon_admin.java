package com.travel.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.travel.service.admin.Interface_TravelService;
import com.travel.service.admin.Service_Coupondelete_admin;
import com.travel.service.admin.Service_Couponinsert_admin;
import com.travel.service.admin.Service_Couponlist_admin;

@Controller
@RequestMapping("admin")
public class Controller_Coupon_admin {
	
	Interface_TravelService travelservice = null;
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("coupon")
	public String couponlist(Model model, HttpServletRequest request) {
		
		travelservice = new Service_Couponlist_admin(sqlSession);
		model.addAttribute("request", request);
		travelservice.execute(model);
		
		return "couponlist_admin";

	}
	
	@RequestMapping("couponinsertview")
	public String couponinsert() {
		
		return "couponinsertview_admin";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "couponinsert")
	public String insert(Model model, HttpServletRequest request) {
		
		travelservice = new Service_Couponinsert_admin(sqlSession);
		model.addAttribute("request", request);
		travelservice.execute(model);
		
		return "redirect:couponinsertview";
	}
	
	@RequestMapping("coupondelete")
	public String coupondelete(Model model, HttpServletRequest request) {
		
		model.addAttribute("request", request);
		
		travelservice = new Service_Coupondelete_admin(sqlSession);
		travelservice.execute(model);
		
		return "redirect:couponlist";
	}
	
}
