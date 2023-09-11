package com.travel.service.user;

import java.security.SecureRandom;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.user.IDao_Member_user;
import com.travel.dto.user.DTO_Member_user;
import com.travel.service.admin.Interface_TravelService;
import com.travel.usetools.CryptoUtil;
import com.travel.usetools.EmailSend;

public class Member_FindPw_Service implements Interface_TravelService {

	SqlSession sqlSession;

	public Member_FindPw_Service(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}

	@Override
	public void execute(Model model){

		try {
			
			Map<String, Object> map = model.asMap();
			HttpServletRequest request = (HttpServletRequest) map.get("request");

			String m_name = request.getParameter("m_name");
			String m_email = request.getParameter("m_email");
			String m_tel = request.getParameter("m_tel");

			IDao_Member_user dao = sqlSession.getMapper(IDao_Member_user.class);
			DTO_Member_user dto = dao.Member_FindPw(m_name, m_tel, m_email);
			
			String email_data = dto.getM_email();
			
			// 임시 비밀번호 생성
			char[] charSet = new char[] {
	                '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
	                'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
	                '!', '@', '#', '$', '%', '^', '&' };
	 
	        StringBuffer sb = new StringBuffer();
	        SecureRandom sr = new SecureRandom();
	        sr.setSeed(new Date().getTime());
	 
	        int idx = 0;
	        int len = charSet.length;
	        for (int i=0; i<12; i++) {
	            idx = sr.nextInt(len);
	            sb.append(charSet[idx]);
	        }
	        String t_pw = sb.toString();
	        String key = "1kjkjkjk$%!@#@#@#%ohhkkhkhk9999";
			String tem_pw = CryptoUtil.encryptAES256(t_pw, key);
					
			try {
				dao.Change_Pw(m_email, tem_pw);
				EmailSend email_send = new EmailSend(email_data);
				System.out.println("비밀번호 이메일로 전송 시작");
				email_send.PwSendAction(m_name,t_pw);
				System.out.println("비밀번호 이메일 전송 끝");
				model.addAttribute("PwSendSuccess", true);
			} catch (Exception e) {
				System.out.println("비밀번호 전송 실패");
				model.addAttribute("PwSendSuccess", false);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		

	}

}
