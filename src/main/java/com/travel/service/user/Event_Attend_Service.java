package com.travel.service.user;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.user.IDao_Event_list_user;
import com.travel.dto.user.DTO_Event_List_user;
import com.travel.service.admin.Interface_TravelService;
import com.travel.usetools.SearchVO;

public class Event_Attend_Service implements Interface_TravelService {

//	신재환 
//	이벤트 참가
//	유저

	IDao_Event_list_user dao;

	public Event_Attend_Service(SqlSession sqlSession) {
		dao = sqlSession.getMapper(IDao_Event_list_user.class);
	}

	@Override
	public void execute(Model model) {

		System.out.println("Event_Attend_Service 신호");

		Map<String, Object> map = model.asMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session = request.getSession();
		
		int event_no = Integer.parseInt(request.getParameter("event_no"));
		int m_no = (Integer) session.getAttribute("m_no");
		
		System.out.println("event_no : "+event_no);
		System.out.println("m_no : "+m_no);
		
		// 중복 참여체크
		int check_event = dao.check_event(event_no,m_no);
		
		System.out.println("check_event : "+check_event);
		
		if (check_event > 0) {
            model.addAttribute("msg", "이미 이벤트에 참가하셨습니다.");
        } else {
            dao.event_attend(event_no, m_no);
            model.addAttribute("msg", "이벤트 참여완료되었습니다.");
        }
		
	}

}
