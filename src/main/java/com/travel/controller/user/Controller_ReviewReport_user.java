package com.travel.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.travel.service.admin.Interface_TravelService;
import com.travel.service.user.Service_ReviewReport_Insert_user;
import com.travel.service.user.Service_ReviewReport_Select_user;

@Controller
@RequestMapping("user")
public class Controller_ReviewReport_user {
	
	@Autowired
	private SqlSession sqlSession;
	private Interface_TravelService service;
	
	@RequestMapping(value="report")
	public String report(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
		
		Service_ReviewReport_Select_user serv = new Service_ReviewReport_Select_user(sqlSession);
		String returnUrl = serv.execute(model);
		
		return returnUrl;
	}
	
	@RequestMapping(value="reportinsert")
	public String reportinsert(HttpServletRequest request, Model model) {
		
		//  참고 ( 파라미터 )
		
		//		int review_no = Integer.parseInt(request.getParameter("review_no"));
		//		int report_type = Integer.parseInt(request.getParameter("report_type"));
		//		String report_content = request.getParameter("report_content");
		
		String m_no = request.getParameter("m_no");
		String s_no = request.getParameter("s_no");
		
		model.addAttribute("request", request);
		
		service = new Service_ReviewReport_Insert_user(sqlSession);
		service.execute(model);
		
		// 변경할 것
		return "redirect:review_list_user?m_no=" + m_no + "&s_no="+ s_no;
	}
	
}