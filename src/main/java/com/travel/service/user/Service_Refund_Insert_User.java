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
		
		// 환불 신청 정보 등록
		dao.refundInsert(m_no, order_no, refund_reason);
		
		// 포인트 및 쿠폰을 정상적으로 환불받는 경우 : admin/refund에서 최종 환불 처리가 완료되어야 한다.

		dao.insertPushAL(m_no, order_no, "환불 신청이 완료되었습니다.");
		
		model.addAttribute("msg", "환불 신청이 완료되었습니다.");
		
	}
}
