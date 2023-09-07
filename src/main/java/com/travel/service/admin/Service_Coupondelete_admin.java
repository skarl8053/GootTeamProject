package com.travel.service.admin;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.admin.IDao_coupon_admin;

public class Service_Coupondelete_admin implements Interface_TravelService {

	private SqlSession sqlSession;

	public Service_Coupondelete_admin(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map =  model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String[] coupon_no = request.getParameter("coupon_no").split(",");
		
		int[] coupon_no_list = new int[coupon_no.length];
		
		for (int i = 0; i < coupon_no_list.length; i++) {
			
			coupon_no_list[i] = Integer.parseInt(coupon_no[i]);
			
		}
		
		IDao_coupon_admin dao = sqlSession.getMapper(IDao_coupon_admin.class);
		
		Map<String, Object> mp = new HashMap<String, Object>();
		
		mp.put("coupon_no", coupon_no_list);
		
		dao.coupondelete(mp);

	}
}