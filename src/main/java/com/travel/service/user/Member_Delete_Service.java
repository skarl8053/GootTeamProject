package com.travel.service.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.user.IDao_Member_user;
import com.travel.dto.user.DTO_Member_user;
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
			System.out.println("설마 여기야???");
			int m_no = (Integer) session.getAttribute("m_no");
			System.out.println("m_no");
			String pw = request.getParameter("pw");
			System.out.println("입력 비밀번호 : " + pw);
			String key = "1kjkjkjk$%!@#@#@#%ohhkkhkhk9999";
			String m_pw = CryptoUtil.encryptAES256(pw, key);
			System.out.println("m_pw : "+m_pw);

			DTO_Member_user dto = dao.part_info(m_no);
			String s_pw = dto.getM_pw();
			System.out.println("s_pw : "+s_pw);
			

			if (s_pw.equals(m_pw)) {
				System.out.println("회원탈퇴 되었습니다.");
				session.invalidate();
				dao.member_delete(m_no, m_pw);
				model.addAttribute("deleteSuccess", false);
			} else {
				System.out.println("비밀번호가 다릅니다.");
				model.addAttribute("deleteSuccess", true);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
