package com.travel.service.admin;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.admin.IDao_purchase_list_admin;
import com.travel.dto.admin.DTO_Purchase_admin;
import com.travel.usetools.SearchVO;

public class Service_Purchase_list_admin implements Interface_TravelService {

	// 신재환
	// 관리자 - 회원 구매 내역

	IDao_purchase_list_admin dao;

	public Service_Purchase_list_admin(SqlSession sqlSession) {
		dao = sqlSession.getMapper(IDao_purchase_list_admin.class);
	}

	@Override
	public void execute(Model model) {

		System.out.println("Purchase_list_admin_Service 신호");

		// 페이징 처리
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		String searchType_Str = request.getParameter("searchType");

		int searchType = 1;
		if (searchType_Str != null && !searchType_Str.isEmpty()) {
			searchType = Integer.parseInt(searchType_Str);
		}

		String keyword = request.getParameter("keyword");
		if (keyword == null) {
			keyword = "";
		}

		System.out.println("searchType : " + searchType);
		System.out.println("keyword : " + keyword);

		// 페이징 처리
		int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

		SearchVO vo = new SearchVO();
		vo.setPage(currentPage);
		vo.pageCalculate(dao.purchase_pageCalculate(searchType, keyword));

		ArrayList<DTO_Purchase_admin> p_list = dao.purchase_list(searchType, keyword, vo.getRowStart(), vo.getRowEnd());

		if(p_list.size() < 1) {
			
//			if(keyword.equals("")) {
				
				model.addAttribute("msg", "");
				model.addAttribute("searchType", searchType);
				model.addAttribute("keyword", keyword);
				model.addAttribute("vo", vo);
				
				if(request.getParameter("msg") == null || request.getParameter("msg").equals("")) {
					model.addAttribute("msg","");
				}
				else {
					model.addAttribute("msg",request.getParameter("msg"));
				}
				
				return;
//			}
//			else {
//				model.addAttribute("msg", "검색 결과가 없습니다.");
//			}
			
		}
		
		model.addAttribute("vo", vo);
		model.addAttribute("p_list", p_list);
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
		
		
		
	}

}
