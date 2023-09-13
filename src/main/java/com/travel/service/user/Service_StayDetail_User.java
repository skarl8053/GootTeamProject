package com.travel.service.user;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.user.IDao_Stay_user;
import com.travel.dto.user.DTO_StayDetail_user;
import com.travel.service.admin.Interface_TravelService;

public class Service_StayDetail_User implements Interface_TravelService {
	private SqlSession sqlSession;

	public Service_StayDetail_User(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void execute(Model model) {
		System.out.println(">>>StayDetail_User_Service sign");
		
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=
				(HttpServletRequest) map.get("request");

		String s_no=request.getParameter("s_no");
		String m_no=request.getParameter("m_no");
		
		String checkInDate =request.getParameter("checkInDate");
		String checkOutDate =request.getParameter("checkOutDate");
		String personCount =request.getParameter("personCount");
		
		 if (checkInDate==null || checkInDate=="" ){ checkInDate=""; }
		 if (checkOutDate==null || checkOutDate=="" ){ checkOutDate=""; }
		 if (personCount==null || personCount=="" ){ personCount="2"; }
		
		IDao_Stay_user dao= sqlSession.getMapper(IDao_Stay_user.class);
		ArrayList<DTO_StayDetail_user> dto=dao.sDList(s_no);
		ArrayList<DTO_StayDetail_user> dtoSD=dao.sDRList(s_no);
		
		
		model.addAttribute("m_no",m_no);
		
		model.addAttribute("listS",dto);
		model.addAttribute("listSDR",dtoSD);
		
		System.out.println("checkInDate"+checkInDate+"checkOutDate"+checkOutDate+"personCount"+personCount);
		
		model.addAttribute("checkInDate",checkInDate);
		model.addAttribute("checkOutDate",checkOutDate);
		model.addAttribute("personCount",personCount);
	
		
	}

}
