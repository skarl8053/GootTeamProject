package com.travel.service.user;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.user.IDao_Event_list_user;
import com.travel.dto.user.DTO_Event_List_user;
import com.travel.service.admin.Interface_TravelService;
import com.travel.usetools.SearchVO;

public class Event_List_Service implements Interface_TravelService {

//	신재환 
//	이벤트 리스트
//	유저

	IDao_Event_list_user dao;

	public Event_List_Service(SqlSession sqlSession) {
		dao = sqlSession.getMapper(IDao_Event_list_user.class);
	}

	@Override
	public void execute(Model model) {

		System.out.println("Event_List_Service 신호");

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
		
		String searchType = request.getParameter("searchType") != null ? request.getParameter("searchType") : "1";
		String keyword = request.getParameter("keyword")  != null &&  ! request.getParameter("keyword").equals("")
				? request.getParameter("keyword") : "";
		
		SearchVO vo = new SearchVO();
		vo.setPage(currentPage);
		vo.pageCalculate(dao.event_notice_pageCalculate(searchType, keyword)); 
		
		List<DTO_Event_List_user> event_list = dao.event_list(searchType, keyword, vo.getRowStart(), vo.getRowEnd());
		
		model.addAttribute("vo", vo);		
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
		model.addAttribute("event_list",event_list);

	}

}
