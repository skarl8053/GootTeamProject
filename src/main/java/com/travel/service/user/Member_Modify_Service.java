package com.travel.service.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.user.IDao_Member_user;
import com.travel.dto.user.DTO_Member_user;
import com.travel.service.admin.Interface_TravelService;

public class Member_Modify_Service implements Interface_TravelService {

	SqlSession sqlSession;
	IDao_Member_user dao;

	public Member_Modify_Service(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
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
			
			String tel = dto.getM_tel();
			String roadAddress = dto.getM_roadaddress();
			String detailAddress = dto.getM_detailaddress();
			String marketing = dto.getM_marketing();
			int area1 = dto.getM_area1();
			int area2 = dto.getM_area2();
			int area3 = dto.getM_area3();
			int theme1 = dto.getM_theme1();
			int theme2 = dto.getM_theme2();
			int theme3 = dto.getM_theme3();
			
			
			model.addAttribute("m_tel",tel);
			model.addAttribute("m_roadAddress",roadAddress);
			model.addAttribute("m_detailAddress",detailAddress);
			model.addAttribute("m_marketing",marketing);
			model.addAttribute("m_area1",area1);
			model.addAttribute("m_area2",area2);
			model.addAttribute("m_area3",area3);
			model.addAttribute("m_theme1",theme1);
			model.addAttribute("m_theme2",theme2);
			model.addAttribute("m_theme3",theme3);


		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		

	}

}
