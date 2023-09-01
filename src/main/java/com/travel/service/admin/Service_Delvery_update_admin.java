package com.travel.service.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.admin.IDao_Delivery_admin;

public class Service_Delvery_update_admin implements Interface_TravelService {

	IDao_Delivery_admin dao;
	
	public Service_Delvery_update_admin(SqlSession sqlSession) { 
		dao = sqlSession.getMapper(IDao_Delivery_admin.class); 
	}

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String delivery_no = request.getParameter("delivery_no");
		String update = request.getParameter("update");
		
		dao.deliveryStatusUpdate(delivery_no, update);
		
		model.addAttribute("delivery_no", delivery_no);
		model.addAttribute("msg", "배송 상태가 변경되었습니다.");
	}
}
