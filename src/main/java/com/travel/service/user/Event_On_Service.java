package com.travel.service.user;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.user.IDao_Event_On_user;
import com.travel.dto.user.DTO_Event_List_user;
import com.travel.dto.user.DTO_Recommend_Stay_user;
import com.travel.service.admin.Interface_TravelService;

public class Event_On_Service implements Interface_TravelService {

//	신재환 
//	진행중인 이벤트 정보 가져오기
//	유저

	IDao_Event_On_user dao;

	public Event_On_Service(SqlSession sqlSession) {
		dao = sqlSession.getMapper(IDao_Event_On_user.class);
	}

	@Override
	public void execute(Model model) {

		System.out.println("Event_On_Service 신호");
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		List<DTO_Event_List_user> on_evt_img = dao.ongoing_event_img();
		List<DTO_Event_List_user> on_evt_no = dao.ongoing_event_no();
		
		model.addAttribute("on_evt_img",on_evt_img);
		model.addAttribute("on_evt_no",on_evt_no);
		
		String img = "";
		
		for (int i = 0; i < on_evt_img.size(); i++) {
			if (i == on_evt_img.size() -1) {
				img += on_evt_img.get(i).getFilename();
			}
			else {
				img += on_evt_img.get(i).getFilename() + ",";
			}
		}
		
		model.addAttribute("img",img);
		
		String no = "";
		
		for (int i = 0; i < on_evt_no.size(); i++) {
			if (i == on_evt_no.size() -1) {
				no += on_evt_no.get(i).getEvent_no();
			}
			else {
				no += on_evt_no.get(i).getEvent_no() + ",";
			}
		}
		
		model.addAttribute("no",no);
		
		HttpSession session = request.getSession();
		Integer m_no = (Integer) session.getAttribute("m_no");

		if (m_no == null) {
		    List<DTO_Recommend_Stay_user> not_login_stay = dao.recommend_not_login();
		    
		    String not_login_img = "";
			
			for (int i = 0; i < not_login_stay.size(); i++) {
				if (i == not_login_stay.size() -1) {
					not_login_img += not_login_stay.get(i).getS_img1();
				} else {
					not_login_img += not_login_stay.get(i).getS_img1() + ",";
				}
			}
			model.addAttribute("not_login_img",not_login_img);
		} 
		else {
			List<DTO_Recommend_Stay_user> login_stay = dao.recommend(m_no);
			
			String login_img = "";
			String login_s_no = "";
			
			for (int i = 0; i < login_stay.size(); i++) {
				if (i == login_stay.size() -1) {
					login_img += login_stay.get(i).getS_img1();
					login_s_no += login_stay.get(i).getS_no();
				} else {
					login_img += login_stay.get(i).getS_img1() + ",";
					login_s_no += login_stay.get(i).getS_no() + ",";
				}
			}
			model.addAttribute("login_img",login_img);
			model.addAttribute("login_s_no",login_s_no);
		}
		
		
	}

}
