package com.travel.service.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.admin.IDao_Refund_admin;

public class Service_Refund_update_admin implements Interface_TravelService {
	
	// 남기문
	// 관리자 - 회원 환불 내역
	
	IDao_Refund_admin dao;
	
	public Service_Refund_update_admin(SqlSession sqlSession) { 
		dao = sqlSession.getMapper(IDao_Refund_admin.class); 
	}

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		// 환불 준비 완료 처리
		String m_no = request.getParameter("m_no");
		String order_no = request.getParameter("order_no"); 
		
		dao.refundUpdate(order_no);
		
		int useCoupon = dao.useCoupon(m_no, order_no); // 사용한 쿠폰번호 , 사용안했다면 0을 반환함..
		
		// 예약 환불로 인한 사용 포인트 환불
		// -1 * (사용한 포인트 - 적립 포인트) 만큼 환불
		dao.refundPoint(m_no, order_no);
		
		// 예약 환불로 인한 사용 포인트 이력 등록 (THISPOINT)
		// 적립 / 사용 이력 모두 추가
		dao.refundPointList(m_no, order_no);
		
		if(useCoupon > 0) {
			// 예약 환불로 인한 사용 쿠폰 환불
			dao.refundCoupon(m_no, useCoupon);			
			
			// 예약 환불로 인한 사용 포인트 이력 업데이트 (THISPOINT)
			
			// 쿠폰 사용이력 삭제
			dao.refundCouponList(m_no, order_no, useCoupon);
		}
		
		dao.insertPushAL(m_no, order_no, "해당 주문의 환불처리가 완료되었습니다.");
		
		model.addAttribute("msg", "환불처리가 완료되었습니다.");
		model.addAttribute("order_no", order_no);
	}
}
