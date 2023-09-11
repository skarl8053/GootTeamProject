package com.travel.service.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.admin.IDao_Refund_admin;
import com.travel.dto.admin.DTO_Refund_admin;

public class Service_Refund_select_admin implements Interface_TravelService {
	
	// 남기문
	// 관리자 - 회원 환불 내역
	
	IDao_Refund_admin dao;
	
	public Service_Refund_select_admin(SqlSession sqlSession) { 
		dao = sqlSession.getMapper(IDao_Refund_admin.class); 
	}

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		boolean isRefund_noParamExists = request.getParameter("order_no") != null ? true : false;
		
		String order_no = request.getParameter("order_no") != null ? request.getParameter("order_no") : "";
		
		DTO_Refund_admin list = dao.refundStatusSelect(order_no);
		
		if(isRefund_noParamExists == true && list == null)
		{
//			if(order_no.length() < 1) {
				model.addAttribute("order_no", order_no);
				model.addAttribute("msg", "");
				return;
//			}
//			else {
//				model.addAttribute("msg", "입력하신 주문번호의 환불정보가 존재하지 않습니다.");
//			}
		}
		else {
			model.addAttribute("order_no", order_no);
			model.addAttribute("list", list);
			
			if(request.getParameter("msg") == null || request.getParameter("msg").equals("")) {
				model.addAttribute("msg","");
			}
			else {
				model.addAttribute("msg",request.getParameter("msg"));
			}
		}
		
	}
}
