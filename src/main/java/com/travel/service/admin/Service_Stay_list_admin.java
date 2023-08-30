package com.travel.service.admin;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.admin.IDao_stay_admin;
import com.travel.dto.admin.DTO_Stay_admin;
import com.travel.usetools.SearchVO;

public class Service_Stay_list_admin implements Interface_TravelService {
	
//	신재환 
//	숙소 등록 리스트 
//	관리자

	IDao_stay_admin dao;
	
	public Service_Stay_list_admin(SqlSession sqlSession) { 
		dao = sqlSession.getMapper(IDao_stay_admin.class); 
	}
	
	@Override
	public void execute(Model model) {
		
		System.out.println("stay_list_service 신호");
		
		// 페이징 처리
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SearchVO searchVO = (SearchVO) map.get("searchVO");
		
		String strPage = request.getParameter("page");
		if (strPage == null) strPage="1";
		int page = Integer.parseInt(strPage);
		searchVO.setPage(page);
		
		int total = dao.selectBoardTotCount();
		searchVO.pageCalculate(total);
		
		System.out.println("total cnt : "+total);
		System.out.println("total row : "+total);
		System.out.println("clickpage : "+searchVO.getPage());
		System.out.println("pageStart : "+searchVO.getPageStart());
		System.out.println("pageEnd : "+searchVO.getPageEnd());
		System.out.println("pageTot : "+searchVO.getTotPage());
		System.out.println("rowStart : "+searchVO.getRowStart());
		System.out.println("rowEnd : "+searchVO.getRowEnd());
		
		int rowStart = searchVO.getRowStart();
		int rowEnd = searchVO.getRowEnd();
		
		ArrayList<DTO_Stay_admin> dtos = dao.list(rowStart,rowEnd);
		
		// 리스트 불러오기
		// ArrayList<DTO_Stay_admin> s_list = dao.stay_list();
		// model.addAttribute("s_list",s_list);
		
		model.addAttribute("list",dtos);
		model.addAttribute("totRowcnt",total);
		model.addAttribute("searchVO",searchVO);
		
	}

}
