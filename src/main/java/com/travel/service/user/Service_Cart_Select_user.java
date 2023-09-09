package com.travel.service.user;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.user.IDao_Cart_user;
import com.travel.dto.user.DTO_Cart_user;
import com.travel.service.admin.Interface_TravelService;

public class Service_Cart_Select_user implements Interface_TravelService{
	IDao_Cart_user dao = null;
	
	public Service_Cart_Select_user(SqlSession sqlSession) {
		dao = sqlSession.getMapper(IDao_Cart_user.class);
	}

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String m_no = request.getParameter("m_no");
		
		List<DTO_Cart_user> s_list = dao.selectCartStayList(m_no);
		
		List<List<DTO_Cart_user>> r_list_arr = new ArrayList<List<DTO_Cart_user>>();
		
		for (int i = 0; i < s_list.size(); i++) {
			List<DTO_Cart_user> r_list = dao.selectCartRoomList(m_no, s_list.get(i).getS_no());
			r_list_arr.add(r_list);
		}
		
		
		model.addAttribute("s_list", s_list);
		model.addAttribute("r_list", r_list_arr);
		
	}
}
