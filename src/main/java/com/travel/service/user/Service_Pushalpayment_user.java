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

public class Service_Pushalpayment_user implements Interface_TravelService{
	
	private SqlSession sqlSession;
	
	public Service_Pushalpayment_user(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String m_no = request.getParameter("m_no");
		
//		HttpSession session = request.getSession();
//		int m_no = (Integer)session.getAttribute("m_no");
		
		IDao_pushal_user dao = sqlSession.getMapper(IDao_pushal_user.class);
		
//		paging 처리
//		검색결과 유지 과정
		int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
		
		SearchVO vo = new SearchVO();
//		현재 페이지 구하는 식
		vo.setDisplayRowCount(8);
		vo.setPage(currentPage);
		
//		사용자 번호에 따라 결제 갯수를 받아온다
		vo.pageCalculate(dao.countpayment(m_no));
		
		
		List<DTO_pushal_user> dto = dao.pushalpayment(m_no, vo.getRowStart(), vo.getRowEnd());
		
		model.addAttribute("m_no", m_no);
		model.addAttribute("dto", dto);
		model.addAttribute("vo", vo);
	}
}
