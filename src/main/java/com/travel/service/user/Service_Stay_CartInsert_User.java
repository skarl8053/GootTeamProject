package com.travel.service.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.user.IDao_Stay_user;
import com.travel.service.admin.Interface_TravelService;


public class Service_Stay_CartInsert_User implements Interface_TravelService {
	private SqlSession sqlSession;

	public Service_Stay_CartInsert_User(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void execute(Model model) {
		System.out.println(">>>Service_Stay_CartInsert_User sign");
		

		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");

		String m_no=request.getParameter("m_no");
		String s_no=request.getParameter("s_no");
		String r_no=request.getParameter("r_no");
		
		System.out.println("정보가 잘 들어오나"+m_no+s_no+r_no);
		
		IDao_Stay_user dao= sqlSession.getMapper(IDao_Stay_user.class);
		
		String chek_r_no=dao.cartCheck(m_no,r_no);
		if (!r_no.equals(chek_r_no)) {
			dao.cartInsert(m_no,s_no,r_no);
		} 
		
		System.out.println("chek_r_no:"+chek_r_no+"r_no:"+r_no);
		
		model.addAttribute("s_no",s_no);
	}

}
