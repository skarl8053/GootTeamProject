package com.travel.service.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.user.IDao_ReviewReport_user;
import com.travel.service.admin.Interface_TravelService;

public class Service_ReviewReport_Insert_user implements Interface_TravelService {

	IDao_ReviewReport_user dao;
	
	public Service_ReviewReport_Insert_user(SqlSession sqlSession) { 
		dao = sqlSession.getMapper(IDao_ReviewReport_user.class); 
	}

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		int review_no = Integer.parseInt(request.getParameter("review_no"));
		int report_type = Integer.parseInt(request.getParameter("report_type"));
		String report_content = request.getParameter("report_content");
		
		// 새로운 신고 번호 생성
		int new_report_no = dao.reviewReport_createIndex();
		
		// THISREPORT에 신고 정보 등록
		dao.reviewReport_insert(new_report_no, report_type, report_content);
		
		// THISREVIEW의 REPORT_NO가 업데이트됨
		dao.reviewReport_update(review_no, new_report_no);
		
		model.addAttribute("msg", "신고가 완료되었습니다.");
		
	}
	
}
