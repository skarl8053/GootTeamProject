package com.travel.service.user;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.user.IDao_Payment_user;
import com.travel.dto.admin.DTO_Item_admin;
import com.travel.service.admin.Interface_TravelService;
import com.travel.usetools.SearchVO;

public class Service_Payment_Coupon_Service implements Interface_TravelService {
	
	IDao_Payment_user dao = null;
	
	public Service_Payment_Coupon_Service(SqlSession sqlSession) {
		dao = sqlSession.getMapper(IDao_Payment_user.class);
	}

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
		
		String m_no = request.getParameter("m_no");
		
		String searchType = request.getParameter("searchType") != null ? request.getParameter("searchType") : "1";
		String keyword = request.getParameter("keyword")  != null &&  ! request.getParameter("keyword").equals("")
				? request.getParameter("keyword") : "";
		
		SearchVO vo = new SearchVO();
		vo.setPage(currentPage);
		vo.pageCalculate(dao.coupon_popup_pageCalculate(m_no, keyword)); 
		
		List<DTO_Item_admin> list = dao.coupon_selectPopupData(m_no, keyword, vo.getRowStart(), vo.getRowEnd());
		
		model.addAttribute("vo", vo);		
		model.addAttribute("list", list);
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
		
	}
	
}
