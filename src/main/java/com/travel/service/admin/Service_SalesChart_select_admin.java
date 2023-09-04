package com.travel.service.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.admin.IDao_SalesChart_admin;

public class Service_SalesChart_select_admin implements Interface_TravelService {
	IDao_SalesChart_admin dao;
	
	public Service_SalesChart_select_admin(SqlSession sqlSession) { 
		dao = sqlSession.getMapper(IDao_SalesChart_admin.class); 
	}

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		
		
	}
	
	
}
