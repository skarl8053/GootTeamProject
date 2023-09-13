package com.travel.service.user;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.user.IDao_pushal_user;
import com.travel.dto.admin.DTO_Event_admin;
import com.travel.dto.user.DTO_pushal_user;
import com.travel.service.admin.Interface_TravelService;
import com.travel.usetools.SearchVO;

public class Service_Pushal_Select_user implements Interface_TravelService{
	
	private IDao_pushal_user dao = null;
	
	public Service_Pushal_Select_user(SqlSession sqlSession) {
		dao = sqlSession.getMapper(IDao_pushal_user.class);
	}
	
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String m_no = request.getParameter("m_no");
		
		int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
		
		String searchType_str = request.getParameter("searchType") != null ? request.getParameter("searchType") : "0";
		String searchType = (! searchType_str.equals("")) ? request.getParameter("searchType") : "0";
		
		SearchVO vo = new SearchVO();
		vo.setPage(currentPage);
		vo.pageCalculate(dao.pageCalculate_pushal(m_no, searchType)); 
		
		List<DTO_pushal_user> list = dao.pushalSelect(m_no, searchType, vo.getRowStart(), vo.getRowEnd());
		
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		model.addAttribute("searchType", searchType);
	}
}
