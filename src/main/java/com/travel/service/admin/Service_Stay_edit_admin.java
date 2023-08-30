package com.travel.service.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.admin.IDao_stay_admin;

public class Service_Stay_edit_admin implements Interface_TravelService {
	
//	신재환 
//	숙소 등록 리스트 
//	관리자

	IDao_stay_admin dao;
	
	public Service_Stay_edit_admin(SqlSession sqlSession) { 
		dao = sqlSession.getMapper(IDao_stay_admin.class); 
	}
	
	@Override
	public void execute(Model model) {
		
		System.out.println("stay_edit_service 신호");
		
		// 페이징 처리
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String s_no = request.getParameter("s_no");
		System.out.println("s_no"+s_no);
		
		// ArrayList<DTO_Stay_admin> dtos = dao.edit(s_no);
		
		// model.addAttribute("list",dtos);
		
	}

}
