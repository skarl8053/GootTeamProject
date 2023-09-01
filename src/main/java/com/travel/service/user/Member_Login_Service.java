package com.travel.service.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.user.IDao_Member_user;
import com.travel.dto.user.DTO_Member_user;
import com.travel.usetools.CryptoUtil;

public class Member_Login_Service implements Interface_MemberService {

	SqlSession sqlSession;
	IDao_Member_user dao;

	public Member_Login_Service(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		this.dao = sqlSession.getMapper(IDao_Member_user.class);
	}

	@Override
	public String execute(Model model) throws Exception {
		System.out.println("로그인 서비스");
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		String m_email = request.getParameter("m_email");
		String pw = request.getParameter("m_pw");

		String key = "1kjkjkjk$%!@#@#@#%ohhkkhkhk9999";
		String m_pw = CryptoUtil.encryptAES256(pw, key);
		String m_lock = dao.search_lock(m_email);
		
		m_lock = m_lock != null ? m_lock : "";

		
		
		DTO_Member_user dto = dao.member_login(m_email, m_pw);
		
		
		if(dto == null)
		{
			 // 에러
			model.addAttribute("loginmsg", "로그인에 실패하셨습니다.");
			return "main/main_page";
		}
		
		int m_sec = dto.getM_sec();
		if(m_lock.equals("Y")) {
			System.out.println("차단");
			return "redirect:/main";
		}else if(m_sec == 1) {		
			System.out.println("관리자");
			return "";
		}else {
			System.out.println("로그인 성공");
			return "redirect:/main";
		}
		 


	}

}
