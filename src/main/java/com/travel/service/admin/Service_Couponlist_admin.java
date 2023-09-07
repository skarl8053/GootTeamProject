package com.travel.service.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.admin.IDao_coupon_admin;
import com.travel.dto.admin.DTO_coupon_admin;
import com.travel.usetools.SearchVO;

public class Service_Couponlist_admin implements Interface_TravelService {

	private SqlSession sqlSession;
	
	public Service_Couponlist_admin(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void execute(Model model) {
		
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		IDao_coupon_admin dao = sqlSession.getMapper(IDao_coupon_admin.class);
		
		String keyword = request.getParameter("keyword") != null ? request.getParameter("keyword") : "";

		
//		paging 처리
//		검색결과 유지 과정
		int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

		SearchVO vo = new SearchVO();
//		현재 페이지 구하는 식
		vo.setPage(currentPage);
		
//		검색한 결과의 갯수 구하는 식
		vo.pageCalculate(dao.pageCalculate(keyword));
		
		List<DTO_coupon_admin> dto = dao.couponlist(keyword, vo.getRowStart(), vo.getRowEnd());	
		
		model.addAttribute("dto", dto);
		model.addAttribute("keyword", keyword);
		model.addAttribute("vo", vo);
		

	}

}
