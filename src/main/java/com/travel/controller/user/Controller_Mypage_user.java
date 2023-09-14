package com.travel.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.travel.service.admin.Interface_TravelService;
import com.travel.service.user.MyPage_Event_Service;
import com.travel.service.user.MyPage_Info_Service;
import com.travel.service.user.MyPage_Pay_Service;
import com.travel.service.user.MyPage_Point_Coupon_Service;
import com.travel.service.user.MyPage_Review_Service;

@Controller
@RequestMapping("user")
public class Controller_Mypage_user {
	
	@Autowired
	private SqlSession sqlSession;
	private Interface_TravelService service;
	
	
	@RequestMapping("mypage_info")
	public String mypage_info(HttpServletRequest request, Model model) {
		
		System.out.println("마이페이지 회원정보");
		
		model.addAttribute("request",request);
		service = new MyPage_Info_Service(sqlSession);
		service.execute(model);
		
		return "user/mypage_info_user";
	}
	@RequestMapping("mypage_event")
	public String mypage_event(HttpServletRequest request, Model model) {
		
		System.out.println("마이페이지 이벤트");
		
		model.addAttribute("request",request);
		service = new MyPage_Event_Service(sqlSession);
		service.execute(model);
		
		return "user/mypage_event_user";
	}
	@RequestMapping("mypage_pay")
	public String mypage_pay(HttpServletRequest request, Model model) {
		
		System.out.println("마이페이지 결제내역");
		
		model.addAttribute("request",request);
		service = new MyPage_Pay_Service(sqlSession);
		service.execute(model);
		
		return "user/mypage_pay_user";
	}
	@RequestMapping("mypage_point")
	public String mypage_point(HttpServletRequest request, Model model) {
		
		System.out.println("마이페이지 포인트/쿠폰");
		
		model.addAttribute("request",request);
		service = new MyPage_Point_Coupon_Service(sqlSession);
		service.execute(model);
		
		return "user/mypage_point_user";
	}
	@RequestMapping("mypage_review")
	public String mypage_review(HttpServletRequest request, Model model) {
		
		System.out.println("마이페이지 숙소후기");
		
		model.addAttribute("request",request);
		service = new MyPage_Review_Service(sqlSession);
		service.execute(model);
		
		return "user/mypage_review_user";
	}
	
}
