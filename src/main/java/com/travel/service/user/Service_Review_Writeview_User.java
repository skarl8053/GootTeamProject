package com.travel.service.user;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.user.IDao_Review_user;
import com.travel.dao.user.IDao_Stay_user;
import com.travel.dto.user.DTO_StayDetail_user;
import com.travel.service.admin.Interface_TravelService;

public class Service_Review_Writeview_User implements Interface_TravelService {
private SqlSession sqlSession;
	
	public Service_Review_Writeview_User(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}


	@Override
	public void execute(Model model) {
		System.out.println(">>review write sign");

		Map<String, Object> map= model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String m_no = request.getParameter("m_no");
		String s_no = request.getParameter("s_no");
		String r_no = request.getParameter("r_no");
		
	

		IDao_Review_user dao=sqlSession.getMapper(IDao_Review_user.class);
		ArrayList<DTO_StayDetail_user> dto=dao.rwriteview(s_no,r_no);

		
		System.out.println("m_no:"+m_no);
		System.out.println("stay_code"+s_no);
		System.out.println("room_code"+r_no);
		
	
		
		
		model.addAttribute("srName",dto);
		model.addAttribute("m_no",m_no);
		model.addAttribute("s_no",s_no);
		model.addAttribute("r_no",r_no);
		
	}
	
}
