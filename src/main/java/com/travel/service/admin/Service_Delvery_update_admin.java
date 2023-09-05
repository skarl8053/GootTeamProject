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
		
		// 
		dao.deliveryStatusUpdate(delivery_no, update);
		
		// 알림 등록 (THISPUSHAL)
		
		String alarm_msg = "";
		
		if(update.equals("1")) {
			alarm_msg = "이벤트에 당첨되어 경품 배송 주문 확인중입니다.";
		}
		else if(update.equals("2")) {
			alarm_msg = "경품 배송준비가 완료되었습니다.";
		}
		else if(update.equals("3")) {
			alarm_msg = "경품이 주소지로 배송중입니다.";
		}
		else if(update.equals("4")) {
			alarm_msg = "경품이 배송완료되었습니다.";
		}
		
		dao.insertPushAL(delivery_no, alarm_msg);
		
		model.addAttribute("delivery_no", delivery_no);
		model.addAttribute("msg", "배송 상태가 변경되었습니다.");
	}
}
