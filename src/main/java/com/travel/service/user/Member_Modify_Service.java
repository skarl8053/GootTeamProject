package com.travel.service.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.user.IDao_Member_user;
import com.travel.service.admin.Interface_TravelService;
import com.travel.usetools.CryptoUtil;

public class Member_Modify_Service implements Interface_TravelService {

	SqlSession sqlSession;

	public Member_Modify_Service(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}

	@Override
	public void execute(Model model) {

		try {
			
			Map<String, Object> map = model.asMap();
			HttpServletRequest request = (HttpServletRequest) map.get("request");

			int m_no = Integer.parseInt(request.getParameter("m_no"));
			String m_pw = request.getParameter("m_pw");
			int m_tel = Integer.parseInt(request.getParameter("m_tel"));
			String m_roadAddress = request.getParameter("m_roadAddress");
			String m_detailAddress = request.getParameter("m_detailAddress");
			String m_address = String.format("%s-%s", m_roadAddress,m_detailAddress);
			
			int m_marketing = Integer.parseInt(request.getParameter("m_marketing"));
			
			int m_area1 = Integer.parseInt(request.getParameter("m_area1"));
			int m_area2 = Integer.parseInt(request.getParameter("m_area2"));
			int m_area3 = Integer.parseInt(request.getParameter("m_area3"));
			int m_theme1 = Integer.parseInt(request.getParameter("m_theme1"));
			int m_theme2 = Integer.parseInt(request.getParameter("m_theme2"));
			int m_theme3 = Integer.parseInt(request.getParameter("m_theme3"));
			
			String key = "1kjkjkjk$%!@#@#@#%ohhkkhkhk9999";
			String encryStr = CryptoUtil.encryptAES256(m_pw, key);
			
					
			IDao_Member_user dao = sqlSession.getMapper(IDao_Member_user.class);
			dao.member_modify(m_no, encryStr, m_tel, m_roadAddress, m_detailAddress, m_marketing, m_area1, m_area2, m_area3, m_theme1, m_theme2, m_theme3);
		
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		

	}

}
