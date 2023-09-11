package com.travel.service.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.travel.dao.admin.IDao_SalesChart_admin;
import com.travel.dto.admin.DTO_SalesChart_admin;
import com.travel.usetools.SearchVO;

@Service
@Transactional
public class Service_SalesChart_staypopup_admin implements Interface_TravelService{

	IDao_SalesChart_admin dao;
	
	public Service_SalesChart_staypopup_admin(SqlSession sqlSession) { 
		dao = sqlSession.getMapper(IDao_SalesChart_admin.class); 
	}

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
		
		String keyword = request.getParameter("keyword")  != null &&  ! request.getParameter("keyword").equals("")
				? request.getParameter("keyword") : "";
		
		SearchVO vo = new SearchVO();
		vo.setPage(currentPage);
		vo.pageCalculate(dao.stay_popup_pageCalculate(keyword)); 
		
		List<DTO_SalesChart_admin> list = dao.stay_selectPopupData(keyword, vo.getRowStart(), vo.getRowEnd());
		
		model.addAttribute("vo", vo);		
		model.addAttribute("list", list);
		model.addAttribute("keyword", keyword);
		
	}
	
}
