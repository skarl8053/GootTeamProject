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
			
			System.out.println("회원가입 시작");
			
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
			
			
			// 남기문 수정 (테마 입력하는 부분) ///////////////////////
			
			String theme_list = request.getParameter("all_tema");
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
			
			System.out.println("2");
			// 남기문 수정 ( 선호지역 입력하는 부분 )
			
			String all_area = request.getParameter("all_area");
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
			
			////////////////////////////////////////////////////////////
			System.out.println("3");
			
			String key = "1kjkjkjk$%!@#@#@#%ohhkkhkhk9999";
			String encryStr = CryptoUtil.encryptAES256(m_pw, key);
					
			IDao_Member_user dao = sqlSession.getMapper(IDao_Member_user.class);
			dao.member_join(m_email, encryStr, m_name, m_tel, m_roadAddress, m_detailAddress, m_marketing, m_area1, m_area2, m_area3, m_theme1, m_theme2, m_theme3);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
