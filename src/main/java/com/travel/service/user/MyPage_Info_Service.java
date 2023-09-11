package com.travel.service.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.user.IDao_Member_user;
import com.travel.dto.user.DTO_Member_user;
import com.travel.service.admin.Interface_TravelService;

public class MyPage_Info_Service implements Interface_TravelService {

	SqlSession sqlSession;
	IDao_Member_user dao;

	public MyPage_Info_Service(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		this.dao = sqlSession.getMapper(IDao_Member_user.class);
	}

	@Override
	public void execute(Model model) {

		try {

			Map<String, Object> map = model.asMap();
			HttpServletRequest request = (HttpServletRequest) map.get("request");
			HttpSession session = request.getSession();
			int m_no = (Integer) session.getAttribute("m_no");


			DTO_Member_user dto = dao.part_info(m_no);
			String m_tel = dto.getM_tel();
			String m_roadAddress = dto.getM_roadaddress();
			String m_detailAddress = dto.getM_detailaddress();
			
			String m_address = String.format("%s %s", m_roadAddress,m_detailAddress);
			
			model.addAttribute("m_tel",m_tel);
			model.addAttribute("m_address",m_address);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
