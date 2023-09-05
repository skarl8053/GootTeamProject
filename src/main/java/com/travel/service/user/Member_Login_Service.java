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
		String m_lock = request.getParameter("m_lock");
		
		DTO_Member_user dto = dao.member_login(m_email, m_pw);
		
		String m_name = dto.getM_name();
		String m_tel = dto.getM_tel();
		String m_marketing = dto.getM_marketing();
		int m_theme1 = dto.getM_theme1();
		int m_theme2 = dto.getM_theme2();
		int m_theme3 = dto.getM_theme3();
		int m_area1 = dto.getM_area1();
		int m_area2 = dto.getM_area2();
		int m_area3 = dto.getM_area3();

		String m_emailcheck = dto.getM_emailcheck();
		
		m_emailcheck = m_emailcheck != null ? m_emailcheck : "";
		
		if(dto == null)
		{
			model.addAttribute("loginmsg", "로그인에 실패하셨습니다.");
			return "main/main_page";
		}
		
		int m_sec = dto.getM_sec();
		
		if(m_emailcheck.equals("N")) {
			System.out.println("이메일 인증 필요");
			return "redirect:/main";
		}else if(m_lock.equals("Y")) {		
			System.out.println("신고 차단");
			return "redirect:/main";
		}else if(m_sec == 1) {		
			System.out.println("관리자");
			return "";
		}else {
			System.out.println("로그인 성공");
			model.addAttribute("InUse",dto);
			HttpSession session = request.getSession();
			session.setAttribute("m_email", m_email);
			session.setAttribute("m_pw", m_pw);
			session.setAttribute("m_name", m_name);
			session.setAttribute("m_tel", m_tel);
			session.setAttribute("m_marketing", m_marketing);
			session.setAttribute("m_theme1", m_theme1);
			session.setAttribute("m_theme2", m_theme2);
			session.setAttribute("m_theme3", m_theme3);
			session.setAttribute("m_area1", m_area1);
			session.setAttribute("m_area2", m_area2);
			session.setAttribute("m_area3", m_area3);
			return "redirect:/main";
		}
		 


	}

}
