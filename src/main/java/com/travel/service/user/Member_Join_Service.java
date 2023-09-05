package com.travel.service.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.user.IDao_Member_user;
import com.travel.service.admin.Interface_TravelService;
import com.travel.usetools.CryptoUtil;

public class Member_Join_Service implements Interface_TravelService {

	SqlSession sqlSession;

	public Member_Join_Service(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}

	@Override
	public void execute(Model model){

		try {
			
			Map<String, Object> map = model.asMap();
			HttpServletRequest request = (HttpServletRequest) map.get("request");

			String m_email = request.getParameter("m_email");
			String m_pw = request.getParameter("m_pw");
			String m_name = request.getParameter("m_name");
			String m_tel = request.getParameter("m_tel");
			
			String m_roadAddress = request.getParameter("m_roadAddress");
			String m_detailAddress = request.getParameter("m_detailAddress");
			String m_address = String.format("%s %s", m_roadAddress,m_detailAddress);
			
			String m_marketing = request.getParameter("m_marketing") == null ? "N" : "Y";	
			
			
			String all_area = request.getParameter("all_area");
			String[] area=all_area.split(",");
			int m_area1 = Integer.parseInt(area[0]);
			int m_area2 = Integer.parseInt(area[1]);
			int m_area3 = Integer.parseInt(area[2]);
			if (area[0]==null) {
				m_area1=0; m_area2=0; m_area3=0;
			}else if (area[1]==null) {
				m_area2=0; m_area3=0;
			}else if (area[2]==null) {
				m_area3=0;
			}
			
			String all_tema = request.getParameter("all_tema");
			String[] tema=all_tema.split(",");
			int m_theme1 = Integer.parseInt(tema[0]);
			int m_theme2 = Integer.parseInt(tema[1]);
			int m_theme3 = Integer.parseInt(tema[2]);
			if (tema[0]==null) {
				m_theme1=0; m_theme2=0; m_theme3=0;
			}else if (tema[1]==null) {
				m_theme2=0; m_theme3=0;
			}else if (tema[2]==null) {
				m_theme3=0;
			}
			
			String key = "1kjkjkjk$%!@#@#@#%ohhkkhkhk9999";
			String encryStr = CryptoUtil.encryptAES256(m_pw, key);
					
			IDao_Member_user dao = sqlSession.getMapper(IDao_Member_user.class);
			dao.member_join(m_email, encryStr, m_name, m_tel, m_address, m_marketing, m_area1, m_area2, m_area3, m_theme1, m_theme2, m_theme3);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
