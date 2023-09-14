package com.travel.service.user;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.user.IDao_Mypage_user;
import com.travel.dto.user.DTO_Mypage_user;
import com.travel.service.admin.Interface_TravelService;
import com.travel.usetools.SearchVO;

public class MyPage_Point_Coupon_Service implements Interface_TravelService {

	SqlSession sqlSession;
	IDao_Mypage_user dao;
	public MyPage_Point_Coupon_Service(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		this.dao = sqlSession.getMapper(IDao_Mypage_user.class);
	}

	@Override
	public void execute(Model model) {
		System.out.println("포인트, 쿠폰 서비스단");

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session = request.getSession();
		int m_no = (Integer) session.getAttribute("m_no");

		int currentPage1= request.getParameter("point_page") != null ? Integer.parseInt(request.getParameter("point_page")) : 1;
		int currentPage2= request.getParameter("coupon_page") != null ? Integer.parseInt(request.getParameter("coupon_page")) : 1;
		
		// 포인트 페이징
		SearchVO vo1 = new SearchVO();
		vo1.setDisplayRowCount(5);
		vo1.setPage(currentPage1);;
		vo1.pageCalculate(dao.paging_point(m_no));
		
		// 쿠폰 페이징
		SearchVO vo2 = new SearchVO();
		vo2.setDisplayRowCount(5);
		vo2.setPage(currentPage2);
		vo2.pageCalculate(dao.paging_coupon(m_no));

		List<DTO_Mypage_user> dto_point = dao.point_list(m_no, vo1.getRowStart(), vo1.getRowEnd());
		List<DTO_Mypage_user> dto_coupon = dao.coupon_list(m_no);
		List<DTO_Mypage_user> dto_usecoupon = dao.usecoupon_list(m_no, vo2.getRowStart(), vo2.getRowEnd());
			
		model.addAttribute("dto_point", dto_point);
		model.addAttribute("dto_coupon", dto_coupon);
		model.addAttribute("dto_usecoupon", dto_usecoupon);
		model.addAttribute("vo1", vo1);
		model.addAttribute("vo2", vo2);

	}

}
