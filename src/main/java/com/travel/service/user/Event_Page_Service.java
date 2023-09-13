package com.travel.service.user;

import java.util.HashMap;
import java.util.List;
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
		
		String event_no = request.getParameter("event_no");
		
		
		// 여기 수정하고, xml mapper(쿼리)까지 수정할 것
		DTO_Event_List_user event_page = dao.event_page(event_no);
		
		model.addAttribute("event_page",event_page);
		
		
		
		
		
		
		
		// 메인으로 이동 (슬라이드)
		
//		List<DTO_Event_List_user> on_evt_img = dao.ongoing_event_img();
//		List<DTO_Event_List_user> on_evt_no = dao.ongoing_event_no();
//		
//		model.addAttribute("on_evt_img",on_evt_img);
//		model.addAttribute("on_evt_no",on_evt_no);
//		
//		String img = "";
//		
//		for (int i = 0; i < on_evt_img.size(); i++) {
//			if (i == on_evt_img.size() -1) {
//				img += on_evt_img.get(i).getFilename();
//			}
//			else {
//				img += on_evt_img.get(i).getFilename() + ",";
//			}
//		}
//		
//		model.addAttribute("img",img);
//		
//		String no = "";
//		
//		for (int i = 0; i < on_evt_no.size(); i++) {
//			if (i == on_evt_no.size() -1) {
//				no += on_evt_no.get(i).getEvent_no();
//			}
//			else {
//				no += on_evt_no.get(i).getEvent_no() + ",";
//			}
//		}
//		
//		model.addAttribute("no",no);
	}

}
