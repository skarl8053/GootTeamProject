package com.travel.service.user;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.user.IDao_Payment_user;
import com.travel.dto.user.DTO_Payment_user;
import com.travel.service.admin.Interface_TravelService;

public class Service_Payment_Service implements Interface_TravelService {

	IDao_Payment_user dao = null;
	
	public Service_Payment_Service(SqlSession sqlSession) {
		dao = sqlSession.getMapper(IDao_Payment_user.class);
	}
	
	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String checkin_date = request.getParameter("checkindate");
		String checkout_date = request.getParameter("checkoutdate");
		
		String m_no = request.getParameter("m_no");
		String stay_no = request.getParameter("stay_no");
		String[] room_no_str = request.getParameter("room_no").split("_");
		
		List<Integer> room_no = new ArrayList<Integer>();
		
        for (int i = 0; i < room_no_str.length; i++) {
        	room_no.add(Integer.parseInt(room_no_str[i]));
        }
		
		
		// 예약자 정보 조회
		DTO_Payment_user resvList = dao.getResvInfo(m_no);
		
		// 예약 숙소 / 객실 조회
		DTO_Payment_user stayList = dao.getStayList(stay_no);
		
		Map<String, Object> mp = new HashMap<String, Object>();
		mp.put("stay_no", stay_no);
		mp.put("room_no", room_no);
		mp.put("checkin_date", checkin_date);
		mp.put("checkout_date", checkout_date);
		
		List<DTO_Payment_user> roomList = dao.getRoomList(mp);
		
		int sumPrice = dao.getSumPrice(mp);
		
		long diffDay = 0;
		
		try {
			
			// 예약 총 일자 구함..
			Date checkin_date_dt = new SimpleDateFormat("yyyy-MM-dd").parse(checkin_date);
	        Date checkout_date_dt = new SimpleDateFormat("yyyy-MM-dd").parse(checkout_date);
	        
	        diffDay = (checkout_date_dt.getTime() - checkin_date_dt.getTime()) / 1000 / (24*60*60);
	        
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		
				
		model.addAttribute("checkin_date", checkin_date);
		model.addAttribute("checkout_date", checkout_date);
		model.addAttribute("diffDay", diffDay);
		model.addAttribute("resvList", resvList);
		model.addAttribute("stayList", stayList);
		model.addAttribute("roomList", roomList);
		model.addAttribute("sumPrice", sumPrice);
		model.addAttribute("earnpoint", (int)(sumPrice * 0.05));
	}

	
	
}
