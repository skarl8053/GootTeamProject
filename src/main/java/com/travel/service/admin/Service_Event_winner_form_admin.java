package com.travel.service.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.admin.IDao_Event_admin;
import com.travel.dto.admin.DTO_Event_admin;

public class Service_Event_winner_form_admin implements Interface_TravelService {

	IDao_Event_admin dao;
	
	public Service_Event_winner_form_admin(SqlSession sqlSession) { 
		dao = sqlSession.getMapper(IDao_Event_admin.class); 
	}

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String event_no = request.getParameter("event_no");
		DTO_Event_admin list = dao.selectEventWinner(event_no);
		
		model.addAttribute("list", list);
	}
}
