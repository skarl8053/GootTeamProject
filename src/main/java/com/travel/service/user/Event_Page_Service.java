package com.travel.service.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.user.IDao_Event_list_user;
import com.travel.dto.user.DTO_Event_List_user;
import com.travel.service.admin.Interface_TravelService;

public class Event_Page_Service implements Interface_TravelService {

//	신재환 
//	이벤트 리스트
//	유저

	IDao_Event_list_user dao;

	public Event_Page_Service(SqlSession sqlSession) {
		dao = sqlSession.getMapper(IDao_Event_list_user.class);
	}

	@Override
	public void execute(Model model) {

		System.out.println("Event_Page_Service 신호");

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int event_no = Integer.parseInt(request.getParameter("event_no"));
		System.out.println("event_no : "+event_no);
		
		DTO_Event_List_user event_page = dao.event_page(event_no);
		
		model.addAttribute("event_page",event_page);
		
		

	}

}
