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

public class Service_SalesChartYear_select_admin implements Interface_TravelService {
	IDao_SalesChart_admin dao;
	
	public Service_SalesChartYear_select_admin(SqlSession sqlSession) { 
		dao = sqlSession.getMapper(IDao_SalesChart_admin.class); 
	}

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String s_no = request.getParameter("s_no");
		String s_name = request.getParameter("s_name") != null ?  request.getParameter("s_name") : "";
		String year = request.getParameter("year");
		String msg = request.getParameter("msg");
		
		JSONArray arr = new JSONArray();
		JSONObject obj = null;
		
		if(s_no != null) {
			
			List<DTO_SalesChart_admin> list = dao.salesChartYearSelect(s_no, year);
			
			for(int i = 1; i <= 12; i++) {
				
				obj = new JSONObject();
				boolean isSalesDataExists = false;
				
				for (int j = 0; j < list.size(); j++) {
					
					if( i == list.get(j).getOrder_month() )
					{
						obj.put("order_month",  list.get(j).getOrder_month() + "월");
						obj.put("sum_payment_price", list.get(j).getSum_payment_price());
						
						arr.add(obj);
						
						isSalesDataExists = true;
						break;
					}
					
				}
				
				if( ! isSalesDataExists ) {
					obj.put("order_month",  i + "월");
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
					model.addAttribute("msg", year + "년에는 해당 숙소의 매출 내역이 존재하지 않습니다.");
				}
				
			}
			
			model.addAttribute("arr",arr);
		}
		else {
			
			for(int i = 1; i <= 12; i++) {
				obj = new JSONObject();
				obj.put("order_month",  i + "월");
				obj.put("sum_payment_price", 0);
				arr.add(obj);
			}
			
			model.addAttribute("arr",arr);
		}
		
		model.addAttribute("s_no", s_no);
		model.addAttribute("s_name", s_name);
		model.addAttribute("year", year);
		
	}
	
	
}
