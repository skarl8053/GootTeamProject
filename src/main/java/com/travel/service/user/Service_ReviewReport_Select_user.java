package com.travel.service.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.user.IDao_ReviewReport_user;

public class Service_ReviewReport_Select_user{

	IDao_ReviewReport_user dao;
	
	public Service_ReviewReport_Select_user(SqlSession sqlSession) { 
		dao = sqlSession.getMapper(IDao_ReviewReport_user.class); 
	}
	
	
	public String execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String review_no = request.getParameter("review_no");
		String m_no = request.getParameter("m_no");
		String s_no = request.getParameter("s_no");
		
		
		// 신고 된 댓글인지 확인
		// 0일경우 신고가 안됨
		// 1일 경우 신고가 됨..
		int isReport = dao.reportCheck(review_no);
		
		if(isReport == 0) {
			return "user/report_insertform_admin";
		}
		else {
			model.addAttribute("msg", "이미 신고된 내역입니다.");
			return "redirect:review_list_user?m_no=" + m_no + "&s_no=" + s_no;
		}
		
	}

}
