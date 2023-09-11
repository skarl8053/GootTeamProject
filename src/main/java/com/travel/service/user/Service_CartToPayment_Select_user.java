package com.travel.service.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.user.IDao_Cart_user;

public class Service_CartToPayment_Select_user{
	IDao_Cart_user dao = null;
	
	public Service_CartToPayment_Select_user(SqlSession sqlSession) {
		dao = sqlSession.getMapper(IDao_Cart_user.class);
	}

	public String execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String m_no = request.getParameter("m_no");
		String s_no = request.getParameter("s_no");
		String[] r_list = dao.selectCartInfo(m_no, s_no);
		
		String r_url = "";
		
		for (int i = 0; i < r_list.length; i++) {
			if(i == r_list.length -1) {
				r_url += r_list[i];
			}
			else {
				r_url += r_list[i] + "_";
			}
		}
		// Example : http://localhost:8090/travel/user/payment?m_no=1&s_no=1&r_no=1_2_3
		return "payment?m_no=" + m_no + "&s_no=" + s_no + "&r_no=" + r_url;
	}
}
