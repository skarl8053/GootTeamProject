package com.travel.service.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.admin.IDao_Report_admin;
import com.travel.dto.admin.DTO_Report_admin;

public class Service_Report_selectdetail_admin implements Interface_TravelService {
	IDao_Report_admin dao;
	
	public Service_Report_selectdetail_admin(SqlSession sqlSession) { 
		dao = sqlSession.getMapper(IDao_Report_admin.class); 
	}

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		int report_no = Integer.parseInt(request.getParameter("report_no"));
		
		DTO_Report_admin list = dao.selectDetailReportData(report_no);
		
		model.addAttribute("list", list);
	}
	
}
