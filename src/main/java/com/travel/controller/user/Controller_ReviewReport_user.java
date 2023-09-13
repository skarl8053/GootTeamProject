package com.travel.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.travel.service.admin.Interface_TravelService;
import com.travel.service.user.ReviewReport_Insert_Service;

@Controller
@RequestMapping("user")
public class Controller_ReviewReport_user {
	
	@Autowired
	private SqlSession sqlSession;
	private Interface_TravelService service;
	
	@RequestMapping(value="report")
	public String report(HttpServletRequest request, Model model) {
		return "user/report_insertform_admin";
	}
	
	@RequestMapping(value="reportinsert")
	public String reportinsert(HttpServletRequest request, Model model) {
		
		//  참고 ( 파라미터 )
		
		//		int review_no = Integer.parseInt(request.getParameter("review_no"));
		//		int report_type = Integer.parseInt(request.getParameter("report_type"));
		//		String report_content = request.getParameter("report_content");
		
		
		model.addAttribute("request", request);
		
		service = new ReviewReport_Insert_Service(sqlSession);
		service.execute(model);
		
		// 변경할 것
		return "";
	}
	
}