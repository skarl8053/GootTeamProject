package com.travel.service.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
		
		DTO_Member_user dto = dao.member_login(m_email, m_pw);
		
		if(dto == null)
		{
			model.addAttribute("msg", "로그인에 실패하셨습니다.");
			return "redirect:login";
		}
		
		String m_lock = dto.getM_lock();
		
		if(m_lock.equals("Y")) {
			model.addAttribute("msg", "신고로 인하여 해당 계정이 차단되었습니다.");
			return "redirect:login";
		}
		
		int m_no = dto.getM_no();
		String m_name = dto.getM_name();
		String m_emailcheck = dto.getM_emailcheck() != null ?  dto.getM_emailcheck() : "";
		
		int m_sec = dto.getM_sec();
		
		if(m_emailcheck.equals("N")) {
			model.addAttribute("msg","이메일 인증이 완료되어야 로그인을 진행할 수 있습니다.");
			return "redirect:login";
		}
		else {
			if(m_sec == 1) {		
				System.out.println("관리자");
				model.addAttribute("msg","관리자님 환영합니다!!");
				return "";
			}
			else
			{
				System.out.println("로그인 성공");
				model.addAttribute("InUse",dto);
				HttpSession session = request.getSession();
				session.setAttribute("m_no", m_no);
				session.setAttribute("m_email", m_email);
				session.setAttribute("m_name", m_name);
				
				model.addAttribute("msg", m_name + " 님 환영합니다 !!");
				
				return "main/main_loading";
			}
		}
	}

}
