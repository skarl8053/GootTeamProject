package com.travel.service.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.user.IDao_Member_user;
import com.travel.dto.user.DTO_Member_user;
import com.travel.usetools.EmailSHA;

public class Member_EmailCheck_Service implements Interface_MemberService {

	SqlSession sqlSession;
	IDao_Member_user dao;

	public Member_EmailCheck_Service(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
		this.dao=sqlSession.getMapper(IDao_Member_user.class);
	}


	@Override
	public String execute(Model model) throws Exception{
		System.out.println("이메일 인증 확인 서비스");
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
	
		String m_email = request.getParameter("m_email");
		String code = request.getParameter("code");
	
		DTO_Member_user email = dao.member_check(m_email);	
		
		String emailSHA = new EmailSHA().getSHA256(email.getM_email());
		boolean isRight=(emailSHA.equals(code))?true:false;
		
		if(isRight==true){
			dao.member_check(m_email);
			dao.update_m_lock(m_email);
			return "member/member_emailcheck_user";
		}else {
			return "error";		
		}
	}
}
