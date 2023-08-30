package com.travel.service.admin;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.admin.IDao_stay_admin;
import com.travel.dto.admin.DTO_Stay_admin;

public class Service_Stay_delete_admin implements Interface_TravelService {

//	신재환 
//	숙소 등록 리스트 
//	관리자

	IDao_stay_admin dao;
	
	public Service_Stay_delete_admin(SqlSession sqlSession) { 
		dao = sqlSession.getMapper(IDao_stay_admin.class); 
	}
	
	@Override
	public void execute(Model model) {
		
		System.out.println("stay_delete_service 신호");
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String s_no = request.getParameter("s_no");
		
		dao.stay_delete(s_no);
		
	}
}
