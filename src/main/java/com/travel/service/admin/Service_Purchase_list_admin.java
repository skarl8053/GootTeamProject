package com.travel.service.admin;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.admin.IDao_purchase_list_admin;
import com.travel.dao.admin.IDao_stay_admin;
import com.travel.dto.admin.DTO_Purchase_admin;
import com.travel.usetools.SearchVO;

public class Service_Purchase_list_admin implements Interface_TravelService {
	
	// 신재환
	// 관리자 - 회원 구매 내역
	
	IDao_purchase_list_admin dao;
	
	public Service_Purchase_list_admin(SqlSession sqlSession) { 
		dao = sqlSession.getMapper(IDao_purchase_list_admin.class); 
	}

	@Override
	public void execute(Model model) {
		
		System.out.println("Purchase_list_admin_Service 신호");
		
		// 페이징 처리
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SearchVO searchVO = (SearchVO) map.get("searchVO");
		
		String strPage = request.getParameter("page");
		if (strPage == null) strPage="1";
		int page = Integer.parseInt(strPage);
		searchVO.setPage(page);
	
		
		// int total = dao.p_list_count();
		
		ArrayList<DTO_Purchase_admin> p_list = dao.purchase_list();
		
		model.addAttribute("p_list",p_list);
		
	}

}


