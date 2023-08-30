package com.travel.service.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.travel.dao.admin.IDao_Event_admin;
import com.travel.dto.admin.DTO_Event_admin;
import com.travel.usetools.SearchVO;

@Service
@Transactional
public class Service_Event_select_admin implements Interface_TravelService {

	IDao_Event_admin dao;
	
	public Service_Event_select_admin(SqlSession sqlSession) { 
		dao = sqlSession.getMapper(IDao_Event_admin.class); 
	}
	
	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
		
		String searchType = request.getParameter("searchType") != null ? request.getParameter("searchType") : "1";
		String keyword = request.getParameter("keyword")  != null &&  ! request.getParameter("keyword").equals("")
				? request.getParameter("keyword") : "";
		
		SearchVO vo = new SearchVO();
		vo.setPage(currentPage);
		vo.pageCalculate(dao.pageCalculate(searchType, keyword)); 
		
		List<DTO_Event_admin> list = dao.selectEvents(searchType, keyword, vo.getRowStart(), vo.getRowEnd());
		
		model.addAttribute("vo", vo);		
		model.addAttribute("list", list);
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
		
		if(request.getParameter("msg") == null || request.getParameter("msg").equals("")) {
			model.addAttribute("msg","");
		}
		else {
			model.addAttribute("msg",request.getParameter("msg"));
		}
		
	}
	
}
