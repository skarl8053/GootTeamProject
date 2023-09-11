package com.travel.service.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.user.IDao_Review_user;
import com.travel.dto.user.DTO_Review_user;
import com.travel.service.admin.Interface_TravelService;

public class Service_Review_Like_User implements Interface_TravelService {
	private SqlSession sqlSession;

	public Service_Review_Like_User(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void execute(Model model) {
		System.out.println(">>>StayDetail_User_Service sign");
		

		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");

		String review_no=request.getParameter("review_no");
		String m_no=request.getParameter("m_no");
		String s_no=request.getParameter("s_no");
		
		
		
		IDao_Review_user dao=sqlSession.getMapper(IDao_Review_user.class);
		String chek_m_no=dao.rlikeCheck(review_no);
		
		if (m_no.equals(chek_m_no)) {
			dao.rlikeMinusL(m_no);
			dao.rlikeMinusR(review_no);
		} else {
			dao.rlikePlusL(review_no,m_no);
			dao.rlikePlusR(review_no);
		}
		
		model.addAttribute("s_no",s_no);
	}

}
