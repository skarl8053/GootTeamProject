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

public class MyPage_Review_Service implements Interface_TravelService {

	SqlSession sqlSession;
	IDao_Mypage_user dao;

	public MyPage_Review_Service(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		this.dao = sqlSession.getMapper(IDao_Mypage_user.class);
	}

	@Override
	public void execute(Model model) {
		System.out.println("숙소 후기 서비스단");

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session = request.getSession();
		int m_no = (Integer) session.getAttribute("m_no");

		int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
		SearchVO vo = new SearchVO();
		vo.setPage(currentPage);
		vo.pageCalculate(dao.paging_review(m_no));

		List<DTO_Mypage_user> dto = dao.review_list(m_no, vo.getRowStart(), vo.getRowEnd());
		
		model.addAttribute("dto", dto);
		model.addAttribute("vo", vo);

	}
}
