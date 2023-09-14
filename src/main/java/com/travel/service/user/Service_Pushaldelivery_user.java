package com.travel.service.user;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.user.IDao_pushal_user;
import com.travel.dto.user.DTO_pushal_user;
import com.travel.service.admin.Interface_TravelService;
import com.travel.usetools.SearchVO;

public class Service_Pushaldelivery_user implements Interface_TravelService{
	
	private SqlSession sqlSession;
	
	public Service_Pushaldelivery_user(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String m_no = request.getParameter("m_no");	
		
		IDao_pushal_user dao = sqlSession.getMapper(IDao_pushal_user.class);
		
//		paging 처리
//		검색결과 유지 과정
		int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
		
		SearchVO vo = new SearchVO();
		
//		현재 페이지 구하는 식
		vo.setDisplayRowCount(8);
		vo.setPage(currentPage);
		
//		사용자 배송 갯수에 따라 페이지를 받아옴
		vo.pageCalculate(dao.countdelivery(m_no));
		
		List<DTO_pushal_user> dto = dao.pushaldelivery(m_no, vo.getRowStart(), vo.getRowEnd());
		
		model.addAttribute("dto", dto);
		model.addAttribute("vo", vo);
		model.addAttribute("m_no", m_no);
	}
}
