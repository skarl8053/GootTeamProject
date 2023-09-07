package com.travel.service.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.user.IDao_Member_user;
import com.travel.service.admin.Interface_TravelService;
import com.travel.usetools.CryptoUtil;

public class Member_Delete_Service implements Interface_TravelService {

	SqlSession sqlSession;
	IDao_Member_user dao;

	public Member_Delete_Service(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		this.dao = sqlSession.getMapper(IDao_Member_user.class);
	}

	@Override
	public void execute(Model model) {

		try {

			Map<String, Object> map = model.asMap();
			HttpServletRequest request = (HttpServletRequest) map.get("request");
			HttpSession session = request.getSession();
			int m_no = (Integer) session.getAttribute("m_no");
			String s_pw = (String) session.getAttribute("m_pw");
			System.out.println("세션 비밀번호 : " + s_pw);
			String pw = request.getParameter("pw");
			System.out.println("입력 비밀번호 : " + pw);

			String key = "1kjkjkjk$%!@#@#@#%ohhkkhkhk9999";
			String m_pw = CryptoUtil.encryptAES256(pw, key);
			System.out.println("암호화한 비밀번호 : " + m_pw);

			if (s_pw.equals(m_pw)) {
				System.out.println("회원탈퇴 되었습니다.");
				session.invalidate();
				dao.member_delete(m_no, m_pw);
				model.addAttribute("deleteSuccess", true);
			} else {
				System.out.println("비밀번호가 다릅니다.");
				model.addAttribute("deleteSuccess", false);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
