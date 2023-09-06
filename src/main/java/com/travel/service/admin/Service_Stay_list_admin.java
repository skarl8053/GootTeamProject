package com.travel.service.admin;

import java.util.List;
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

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		// 검색 결과 유지 과정
		int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

		int location = request.getParameter("location") != null ? Integer.parseInt(request.getParameter("location"))
				: 0;
		int type = request.getParameter("type") != null ? Integer.parseInt(request.getParameter("type")) : 0;

		SearchVO vo = new SearchVO();
		vo.setPage(currentPage);
		vo.pageCalculate(dao.pageCalculate(location, type));

		List<DTO_Stay_admin> list = dao.list(vo.getRowStart(), vo.getRowEnd(), location, type);

		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		model.addAttribute("location", location);
		model.addAttribute("type", type);

	}

}
