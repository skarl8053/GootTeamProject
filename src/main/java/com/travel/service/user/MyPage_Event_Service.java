package com.travel.service.user;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.user.IDao_Mypage_user;
import com.travel.dto.user.DTO_Mypage_user;
import com.travel.service.admin.Interface_TravelService;
import com.travel.usetools.SearchVO;

public class MyPage_Event_Service implements Interface_TravelService {

	SqlSession sqlSession;
	IDao_Mypage_user dao;

	public MyPage_Event_Service(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		this.dao = sqlSession.getMapper(IDao_Mypage_user.class);
	}

	@Override
	public void execute(Model model) {
		System.out.println("이벤트 서비스단");

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session = request.getSession();
		int m_no = (Integer) session.getAttribute("m_no");

		int currentPage1 = request.getParameter("ing_page") != null ? Integer.parseInt(request.getParameter("ing_page")) : 1;
		SearchVO vo1 = new SearchVO();
		vo1.setDisplayRowCount(3);
		vo1.setPage(currentPage1);
		vo1.pageCalculate(dao.paging_ing_event(m_no));
		int currentPage2 = request.getParameter("end_page") != null ? Integer.parseInt(request.getParameter("end_page")) : 1;
		SearchVO vo2 = new SearchVO();
		vo2.setDisplayRowCount(3);
		vo2.setPage(currentPage2);
		vo2.pageCalculate(dao.paging_end_event(m_no));

		List<DTO_Mypage_user> dtoS = dao.event_list(m_no, vo1.getRowStart(), vo1.getRowEnd());
		List<DTO_Mypage_user> dtoE = dao.endevent_list(m_no, vo2.getRowStart(), vo2.getRowEnd());
		
		model.addAttribute("dtoS", dtoS);
		model.addAttribute("dtoE", dtoE);
		model.addAttribute("vo1", vo1);
		model.addAttribute("vo2", vo2);

	}

}
