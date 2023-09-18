package com.travel.service.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.admin.IDao_stay_admin;
import com.travel.dto.admin.DTO_Stay_admin;
import com.travel.dto.admin.DTO_Stay_room_admin;
import com.travel.usetools.SearchVO;

public class Service_Stay_list_room_confirm_admin implements Interface_TravelService {

//	신재환 
//	숙소 등록 리스트 
//	관리자

	IDao_stay_admin dao;

	public Service_Stay_list_room_confirm_admin(SqlSession sqlSession) {
		dao = sqlSession.getMapper(IDao_stay_admin.class);
	}

	@Override
	public void execute(Model model) {

		System.out.println("Service_Stay_list_room_confirm_admin 신호");

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String s_no_str = request.getParameter("s_no");

		int s_no = Integer.parseInt(s_no_str);

		int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

		SearchVO vo = new SearchVO();
		vo.setPage(currentPage);
		vo.pageCalculate(dao.room_list_pageCalculate(s_no));

		DTO_Stay_room_admin stay_list = dao.stay_list(s_no);
		List<DTO_Stay_admin> room_list = dao.room_list(vo.getRowStart(), vo.getRowEnd(), s_no);

		model.addAttribute("s_no", s_no);
		model.addAttribute("vo", vo);
		model.addAttribute("stay_list", stay_list);
		model.addAttribute("room_list", room_list);
		
		model.addAttribute("msg2", request.getParameter("msg2"));
		
//		if(request.getParameter("msg2") == null || request.getParameter("msg2").equals("")) {
//			model.addAttribute("msg2", "해당 객실이 삭제되었습니다.");
//		}
//		else {
//			model.addAttribute("msg2", "");
//		}
		
	}
}
