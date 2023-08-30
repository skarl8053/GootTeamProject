package com.travel.service.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.travel.dao.admin.IDao_Event_admin;

@Service
@Transactional
public class Service_Event_winner_insert_admin implements Interface_TravelService {

	IDao_Event_admin dao;
	
	public Service_Event_winner_insert_admin(SqlSession sqlSession) { 
		dao = sqlSession.getMapper(IDao_Event_admin.class); 
	}

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String event_no = request.getParameter("event_no");
		String first_mno = request.getParameter("first_mno");
		String second_mno = request.getParameter("second_mno");
		String third_mno = request.getParameter("third_mno");
		
		// 당첨자 정보 업데이트
		dao.updateEventWinner(event_no, first_mno, second_mno, third_mno);
		
		// 당첨 완료되면 바로 배송 준비
		
		for (int item_no = 1; item_no < 4; item_no++) {
			
			dao.insertDelivery(event_no, item_no);
		}	
		
		model.addAttribute("msg","당첨자 지정이 완료되었습니다.");
		
	}

}
