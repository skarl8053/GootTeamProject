package com.travel.service.admin;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.admin.IDao_Item_admin;
import com.travel.dto.admin.DTO_Item_admin;

public class Service_Item_form_admin implements Interface_TravelService{

	IDao_Item_admin dao;
	
	public Service_Item_form_admin(SqlSession sqlSession) { 
		dao = sqlSession.getMapper(IDao_Item_admin.class); 
	}

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String event_no = request.getParameter("event_no");
		String event_name = request.getParameter("event_name");
		String gubun = request.getParameter("gubun");
		
		model.addAttribute("event_no", event_no);
		model.addAttribute("event_name", event_name);
		model.addAttribute("gubun", gubun);
		
	}
	
}
