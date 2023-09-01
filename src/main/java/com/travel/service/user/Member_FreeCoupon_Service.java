package com.travel.service.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.user.IDao_Member_user;
import com.travel.service.admin.Interface_TravelService;

public class Member_FreeCoupon_Service implements Interface_TravelService {

	SqlSession sqlSession;
	IDao_Member_user dao;

	public Member_FreeCoupon_Service(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
		this.dao=sqlSession.getMapper(IDao_Member_user.class);
	}


	@Override
	public void execute(Model model){
		
		System.out.println("회원가입 쿠폰 증정 서비스");
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String m_email = request.getParameter("m_email");
		int m_no = Integer.parseInt(dao.search_no(m_email));
		dao.member_join_coupon(m_no);
		
	}
	
}
