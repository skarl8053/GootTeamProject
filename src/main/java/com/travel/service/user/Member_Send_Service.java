package com.travel.service.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.user.IDao_Member_user;
import com.travel.dto.user.DTO_Member_user;
import com.travel.service.admin.Interface_TravelService;
import com.travel.usetools.EmailSend;

public class Member_Send_Service implements Interface_TravelService {

	SqlSession sqlSession;

	public Member_Send_Service(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public void execute(Model model) {
		
		try {
			
			System.out.println("이메일 전송 서비스");
			Map<String, Object> map = model.asMap();
			HttpServletRequest request = (HttpServletRequest) map.get("request");
			String m_email = request.getParameter("m_email");
			IDao_Member_user dao = sqlSession.getMapper(IDao_Member_user.class);
			
			DTO_Member_user dto = dao.member_check(m_email);
			String email_data = dto.getM_email();

			EmailSend email_send = new EmailSend(email_data);
			System.out.println("확인 이메일 전송 시작");
			email_send.emailSendAction();
			System.out.println("확인 이메일 전송 끝");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
}
