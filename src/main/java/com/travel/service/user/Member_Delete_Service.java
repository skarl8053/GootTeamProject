package com.travel.service.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.user.IDao_Member_user;
import com.travel.service.admin.Interface_TravelService;
import com.travel.usetools.CryptoUtil;

public class Member_Delete_Service implements Interface_TravelService {

	SqlSession sqlSession;

	public Member_Delete_Service(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}

	@Override
	public void execute(Model model){

		try {
			
			Map<String, Object> map = model.asMap();
			HttpServletRequest request = (HttpServletRequest) map.get("request");

			String m_email = request.getParameter("m_email");
			String m_pw = request.getParameter("pw");

			String key = "1kjkjkjk$%!@#@#@#%ohhkkhkhk9999";
			String encryStr = CryptoUtil.encryptAES256(m_pw, key);
			IDao_Member_user dao = sqlSession.getMapper(IDao_Member_user.class);
			
			dao.member_delete(m_email, encryStr);
			
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
