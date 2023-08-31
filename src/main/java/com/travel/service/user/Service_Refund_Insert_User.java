package com.travel.service.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.user.IDao_Mypage_user;
import com.travel.service.admin.Interface_TravelService;

public class Service_Refund_Insert_User implements Interface_TravelService{
	
	IDao_Mypage_user dao = null;
	
	public Service_Refund_Insert_User(SqlSession sqlSession) {
		dao = sqlSession.getMapper(IDao_Mypage_user.class);
	}

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map=model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String m_no = request.getParameter("m_no");
		String order_no = request.getParameter("order_no"); 
		String refund_reason = request.getParameter("refund_reason"); 
		
		// 환불 정보 등록
		dao.refundInsert(m_no, order_no, refund_reason);
		
		int usePoint = dao.usePoint(m_no, order_no); // 사용한 포인트, 사용 안했다면 0을 반환...
		int useCoupon = dao.useCoupon(m_no, order_no); // 사용한 쿠폰번호 , 사용안했다면 0을 반환함..
		
		if(usePoint > 0)
		{
			// 예약 환불로 인한 사용 포인트 환불
			dao.refundPoint(m_no, usePoint);
			
			// 예약 환불로 인한 사용 포인트 이력 등록 (THISPOINT)
			dao.refundPointList(m_no, order_no, usePoint);
		}
		
		if(useCoupon > 0) {
			// 예약 환불로 인한 사용 쿠폰 환불
			dao.refundCoupon(m_no, useCoupon);			
			
			// 예약 환불로 인한 사용 포인트 이력 업데이트 (THISPOINT)
			
			// COUPON_USEFLAG = Y인 경우 예약 시 쿠폰 사용
			// COUPON_USEFLAG = N인 경우 예약 -> 환불한 경우
			// 이력이 없다면? 아예 예약을 안한거임..
			
			dao.refundCouponList(m_no, order_no, usePoint);
		}
		
		// 알림 이력 추가
		dao.insertPushAL(m_no, order_no, "환불이 완료되었습니다.");
		
		model.addAttribute("msg", "환불이 완료되었습니다.");
		
	}
}
