package com.travel.service.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.user.IDao_Mypage_user;
import com.travel.dto.user.DTO_Mypage_user;
import com.travel.service.admin.Interface_TravelService;

public class Service_Refund_Select_User implements Interface_TravelService{
	
	IDao_Mypage_user dao = null;
	
	public Service_Refund_Select_User(SqlSession sqlSession) {
		dao = sqlSession.getMapper(IDao_Mypage_user.class);
	}

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map=model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String m_no = request.getParameter("m_no");
		String order_no = request.getParameter("order_no"); 
		
		// 주문번호, 숙소명
		DTO_Mypage_user list = dao.orderInfoSelect(m_no, order_no);
		
		// 객실명 조회 (여러개)
		// DTO_Mypage_user list = dao.orderInfoSelect(m_no, order_no);		
		
		// 주문 -> 포인트 정보, 주문 -> 쿠폰 정보 가져옴...
		// DTO_Mypage_user list = dao.orderInfoSelect(m_no, order_no);
		
	}

}
