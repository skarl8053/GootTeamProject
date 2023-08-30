package com.travel.service.admin;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.admin.IDao_Report_admin;
import com.travel.dto.admin.DTO_Report_admin;
import com.travel.usetools.SearchVO;

public class Service_Report_select_admin implements Interface_TravelService {

	// 남기문
	// 관리자 - 신고 관리 기능
	
	IDao_Report_admin dao;
	
	public Service_Report_select_admin(SqlSession sqlSession) { 
		dao = sqlSession.getMapper(IDao_Report_admin.class); 
	}

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		// 현재 페이지 관련
		int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
		
		// 검색 관련
		
		String param1 = request.getParameter("param1") != null ? request.getParameter("param1") : "1";
		String keyword = request.getParameter("keyword")  != null &&  ! request.getParameter("keyword").equals("")
				? request.getParameter("keyword") : "";
		
		SearchVO vo = new SearchVO();
		vo.setPage(currentPage);
		vo.pageCalculate(dao.pageCalculate(param1, keyword)); 
		
		ArrayList<DTO_Report_admin> list = dao.selectReportData(param1, keyword, vo.getRowStart(), vo.getRowEnd()); 
		
		model.addAttribute("vo", vo);		
		model.addAttribute("list", list);
		model.addAttribute("param1", param1);
		model.addAttribute("keyword", keyword);
		
		
		if(request.getParameter("msg") == null || request.getParameter("msg").equals("")) {
			model.addAttribute("msg","");
		}
		else {
			model.addAttribute("msg",request.getParameter("msg"));
		}
		
	}
	
}
