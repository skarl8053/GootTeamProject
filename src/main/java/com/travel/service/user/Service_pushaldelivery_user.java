package com.travel.service.user;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.user.IDao_pushal_user;
import com.travel.dto.user.DTO_pushal_user;
import com.travel.service.admin.Interface_TravelService;

public class Service_pushaldelivery_user implements Interface_TravelService{
	
	private SqlSession sqlSession;
	
	public Service_pushaldelivery_user(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String m_no = request.getParameter("m_no");	
		
		IDao_pushal_user dao = sqlSession.getMapper(IDao_pushal_user.class);
		
		List<DTO_pushal_user> dto = dao.pushaldelivery(m_no);
		
		model.addAttribute("dto", dto);
	}
}
