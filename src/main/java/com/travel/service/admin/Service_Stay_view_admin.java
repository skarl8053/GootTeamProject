package com.travel.service.admin;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.annotation.ModelAndViewResolver;

import com.travel.dao.admin.IDao_stay_admin;
import com.travel.dto.admin.DTO_Stay_admin;
import com.travel.dto.admin.DTO_Stay_room_admin;

public class Service_Stay_view_admin implements Interface_TravelService {
	
	// 신재환
	// 숙소 상세 이미지
	// 관리자

	IDao_stay_admin dao;
	
	public Service_Stay_view_admin(SqlSession sqlSession) { 
		dao = sqlSession.getMapper(IDao_stay_admin.class); 
	}

	@Override
	public void execute(Model model) {
		
		System.out.println("Stay_view_service 신호");
	
		Map<String, Object> map = model.asMap();
		
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		// 숙소 공통정보
		String s_no = request.getParameter("s_no");
		
		ArrayList<DTO_Stay_admin> stay_view = dao.stay_view(s_no);
		ArrayList<DTO_Stay_room_admin> stay_room_view = dao.stay_room_view(s_no);
		
		
		model.addAttribute("stay_view",stay_view);
		model.addAttribute("stay_room_view",stay_room_view);
		
	}
	
}





