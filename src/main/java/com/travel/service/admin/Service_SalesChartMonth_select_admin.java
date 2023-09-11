package com.travel.service.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.ui.Model;

import com.travel.dao.admin.IDao_SalesChart_admin;
import com.travel.dto.admin.DTO_SalesChart_admin;

public class Service_SalesChartMonth_select_admin implements Interface_TravelService {
	IDao_SalesChart_admin dao;
	
	public Service_SalesChartMonth_select_admin(SqlSession sqlSession) { 
		dao = sqlSession.getMapper(IDao_SalesChart_admin.class); 
	}

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String s_no = request.getParameter("s_no");
		String s_name = request.getParameter("s_name") != null ?  request.getParameter("s_name") : "";
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String msg = request.getParameter("msg");
		
		JSONArray arr = new JSONArray();
		JSONObject obj = null;
		
		if(s_no != null) {
			
			List<DTO_SalesChart_admin> list = dao.salesChartMonthSelect(s_no, year, month);
			
			for(int i = 1; i <= 31; i++) {
				
				obj = new JSONObject();
				boolean isSalesDataExists = false;
				
				for (int j = 0; j < list.size(); j++) {
					
					if( i == list.get(j).getOrder_day() )
					{
						obj.put("order_day",  list.get(j).getOrder_day() + "일");
						obj.put("sum_payment_price", list.get(j).getSum_payment_price());
						
						arr.add(obj);
						
						isSalesDataExists = true;
						break;
					}
				}
				
				if( ! isSalesDataExists ) {
					obj.put("order_day",  i + "일");
					obj.put("sum_payment_price", 0);
					arr.add(obj);
				}
			}
			
			if(list.size() < 1) {
				if(msg != null && msg.length() > 0)
				{
					model.addAttribute("msg","");
				}
				else {
					model.addAttribute("msg", year + "년 " + month + "월 에는 해당 숙소의 매출 내역이 존재하지 않습니다.");
				}
				
			}
			
			model.addAttribute("arr",arr);
		}
		else {
			
			for(int i = 1; i <= 31; i++) {
				obj = new JSONObject();
				obj.put("order_day",  i + "일");
				obj.put("sum_payment_price", 0);
				arr.add(obj);
			}
			
			model.addAttribute("arr",arr);
		}
		
		model.addAttribute("s_no", s_no);
		model.addAttribute("s_name", s_name);
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		
	}
	
	
}
