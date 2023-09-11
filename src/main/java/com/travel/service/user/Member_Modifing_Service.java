package com.travel.service.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.user.IDao_Member_user;
import com.travel.service.admin.Interface_TravelService;
import com.travel.usetools.CryptoUtil;

public class Member_Modifing_Service implements Interface_TravelService {

	SqlSession sqlSession;
	IDao_Member_user dao;

	public Member_Modifing_Service(SqlSession sqlSession) {
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
			
			String pw = request.getParameter("m_pw");
			String m_tel = request.getParameter("m_tel");
			String m_roadAddress = request.getParameter("m_roadAddress");
			String m_detailAddress = request.getParameter("m_detailAddress");

//			여기서부터 null
			System.out.println("시작");
			String m_marketing = request.getParameter("m_marketing");
			System.out.println(m_marketing);

			String theme_list = request.getParameter("modify_tema");
			System.out.println("?????"+theme_list);
			String[] theme=theme_list.split(",");
			System.out.println("123123"+theme);
			
			int[] theme_Arr = new int[3];
			
			for (int i = 0; i < 3; i++) {
				if( i > theme.length-1 ) {
					theme_Arr[i] = 0;
				}
				else {
					theme_Arr[i] = Integer.parseInt(theme[i]);
				}
			}
			
			int m_theme1 = theme_Arr[0];
			int m_theme2 = theme_Arr[1];
			int m_theme3 = theme_Arr[2];
			
			String all_area = request.getParameter("modify_area");
			String[] area=all_area.split(",");
			
			int[] location_Arr = new int[3];
			
			for (int i = 0; i < 3; i++) {
				if( i > area.length-1 ) {
					location_Arr[i] = 0;
				}
				else {
					location_Arr[i] = Integer.parseInt(area[i]);
				}
			}
			
			int m_area1 = location_Arr[0];
			int m_area2 = location_Arr[1];
			int m_area3 = location_Arr[2];
			
			String key = "1kjkjkjk$%!@#@#@#%ohhkkhkhk9999";
			String m_pw = CryptoUtil.encryptAES256(pw, key);
			
			dao.member_modify(m_no, m_pw, m_tel, m_roadAddress, m_detailAddress, m_marketing, m_area1, m_area2, m_area3, m_theme1, m_theme2, m_theme3);
		
			
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		

	}

}
