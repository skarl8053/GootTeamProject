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

		// 업데이트 후 창 닫기 구현 필요
		
		return "";
	}
	@RequestMapping("mypage_info")
	public String mypage_info(HttpServletRequest request, Model model) {
		
		System.out.println("마이페이지 회원정보");
		
//		model.addAttribute("request",request);
//		service = new Service_Refund_Insert_User(sqlSession);
//		service.execute(model);
		
		return "user/mypage_info_user";
	}
	@RequestMapping("mypage_event")
	public String mypage_event(HttpServletRequest request, Model model) {
		
		System.out.println("마이페이지 이벤트");
		
//		model.addAttribute("request",request);
//		service = new Service_Refund_Insert_User(sqlSession);
//		service.execute(model);
		
		return "user/mypage_event_user";
	}
	@RequestMapping("mypage_pay")
	public String mypage_pay(HttpServletRequest request, Model model) {
		
		System.out.println("마이페이지 결제내역");
		
//		model.addAttribute("request",request);
//		service = new Service_Refund_Insert_User(sqlSession);
//		service.execute(model);
		
		return "user/mypage_pay_user";
	}
	@RequestMapping("mypage_point")
	public String mypage_point(HttpServletRequest request, Model model) {
		
		System.out.println("마이페이지 포인트/쿠폰");
		
//		model.addAttribute("request",request);
//		service = new Service_Refund_Insert_User(sqlSession);
//		service.execute(model);
		
		return "user/mypage_point_user";
	}
	@RequestMapping("mypage_review")
	public String mypage_review(HttpServletRequest request, Model model) {
		
		System.out.println("마이페이지 숙소후기");
		
//		model.addAttribute("request",request);
//		service = new Service_Refund_Insert_User(sqlSession);
//		service.execute(model);
		
		return "user/mypage_review_user";
	}
	
}
