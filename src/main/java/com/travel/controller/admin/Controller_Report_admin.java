package com.travel.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.travel.service.admin.Service_Report_blockall_admin;
import com.travel.service.admin.Service_Report_blockone_admin;
import com.travel.service.admin.Service_Report_select_admin;
import com.travel.service.admin.Service_Report_selectdetail_admin;
import com.travel.service.admin.Interface_TravelService;

@Controller
@RequestMapping("admin")
public class Controller_Report_admin {

	// 남기문	
	// 관리자 - 신고 관리 기능
	
	@Autowired
	private SqlSession sqlSession;
	private Interface_TravelService service;
	
	@RequestMapping(value="report")
	public String report(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
		
		service = new Service_Report_select_admin(sqlSession);
		service.execute(model);
		
		return "admin/report_admin";
	}
	@RequestMapping(value="reportdetail")
	public String reportdetail(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
		
		service = new Service_Report_selectdetail_admin(sqlSession);
		service.execute(model);
		
		return "admin/report_detail_admin";
	}
	
	// 블랙리스트 스위치 변경	
	@RequestMapping(value="report/blockone")
	public String report_blockone(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
		
		service = new Service_Report_blockone_admin(sqlSession);
		service.execute(model);
		
		return "redirect:/admin/report";
	}
	
	// 차단 일괄 승인
	@RequestMapping(value="report/blockall")
	public String report_blockall(HttpServletRequest request, Model model) {
			
		model.addAttribute("request", request);
		
		service = new Service_Report_blockall_admin(sqlSession);
		service.execute(model);
		
		return "redirect:/admin/report";
	}
}
