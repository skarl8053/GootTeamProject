package com.travel.service.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.user.IDao_Member_user;
import com.travel.dto.user.DTO_Member_user;

public class Member_Check_Service implements Interface_MemberService {

	SqlSession sqlSession;

	public Member_Check_Service(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}

	@Override
	public String execute(Model model) throws Exception{
		System.out.println("이메일 중복 확인 서비스");
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String m_email = request.getParameter("m_email");

		if(m_email.equals("")) {
			return "1";
		}else {
			IDao_Member_user dao = sqlSession.getMapper(IDao_Member_user.class);
			DTO_Member_user dto = dao.member_check(m_email);
			if(dto == null) {
				return "0";
			}else {
				String email_data = dto.getM_email();
				return email_data;
			}
			
		}
		
		
	}
}
