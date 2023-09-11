package com.travel.service.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.user.IDao_Cart_user;
import com.travel.service.admin.Interface_TravelService;

public class Service_Cart_Delete_user implements Interface_TravelService{
	IDao_Cart_user dao = null;
	
	public Service_Cart_Delete_user(SqlSession sqlSession) {
		dao = sqlSession.getMapper(IDao_Cart_user.class);
	}

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String m_no = request.getParameter("m_no");
		String s_no = request.getParameter("s_no");
		
		dao.deleteCartInfo(m_no, s_no);
		
		
		model.addAttribute("msg", "해당 숙소를 장바구니에서 삭제하였습니다.");
		
	}
}
