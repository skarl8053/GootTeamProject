package com.travel.service.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.travel.dao.admin.IDao_Delivery_admin;
import com.travel.dto.admin.DTO_Delivery_admin;

@Service
@Transactional
public class Service_Delvery_select_admin  implements Interface_TravelService {

	IDao_Delivery_admin dao;
	
	public Service_Delvery_select_admin(SqlSession sqlSession) { 
		dao = sqlSession.getMapper(IDao_Delivery_admin.class); 
	}

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		boolean isdelivery_noParamExists = request.getParameter("delivery_no") != null ? true : false;
		
		String delivery_no = request.getParameter("delivery_no") != null ? request.getParameter("delivery_no") : "";
		
		DTO_Delivery_admin list = dao.deliveryStatusSelect(delivery_no);
		
		// delivery_no 파라미터(배송번호)를 입력했는데, 리스트가 없는 경우
		// 해당하는 배송번호가 없다는 것을 의미함.
		
		if(isdelivery_noParamExists == true && list == null)
		{
			if(delivery_no.length() < 1)
			{
				model.addAttribute("msg", "");
				return;
			}
			else {
				model.addAttribute("msg", "입력하신 배송번호의 배송정보가 존재하지 않습니다.");
			}
			//model.addAttribute("delivery_no", delivery_no);
			
		}
		else {
			model.addAttribute("delivery_no", delivery_no);
			model.addAttribute("list", list);
			
			if(request.getParameter("msg") == null || request.getParameter("msg").equals("")) {
				model.addAttribute("msg","");
			}
			else {
				model.addAttribute("msg",request.getParameter("msg"));
			}
			
		}
	}
}
