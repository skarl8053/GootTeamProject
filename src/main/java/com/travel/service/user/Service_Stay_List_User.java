package com.travel.service.user;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.user.IDao_Stay_user;
import com.travel.dto.user.DTO_StayDetail_user;
import com.travel.service.admin.Interface_TravelService;

public class Service_Stay_List_User implements Interface_TravelService {
	private SqlSession sqlSession;

	public Service_Stay_List_User(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void execute( Model model) {
		System.out.println(">>>Service_Stay_List_User sign");

		Map<String, Object> map=model.asMap();
		HttpServletRequest request= (HttpServletRequest) map.get("request");
		
		String m_no=request.getParameter("m_no");
		String s_loca=request.getParameter("s_loca");
		String checkInDate =request.getParameter("checkInDate");
		String checkOutDate =request.getParameter("checkOutDate");
		String personCount =request.getParameter("personCount");
		
		 if (checkInDate==null || checkInDate=="" ){ checkInDate=""; }
		 if (checkOutDate==null || checkOutDate=="" ){ checkOutDate=""; }
		 if (personCount==null || personCount=="" ){ personCount="2"; }
		
		 System.out.println("11checkInDate"+checkInDate+"checkOutDate"+checkOutDate+"personCount"+personCount);
		
	
		 
		
		System.out.println("m_no :"+m_no+" s_loca :"+s_loca);
		
		IDao_Stay_user dao= sqlSession.getMapper(IDao_Stay_user.class);
		ArrayList<DTO_StayDetail_user> dto=dao.sList(s_loca);
		ArrayList<DTO_StayDetail_user> dtoSD=dao.sRList();
		
		int totalRCont=0;
		totalRCont=dao.selectStayLlistTotCount(s_loca);
		
		System.out.println("22checkInDate"+checkInDate+"checkOutDate"+checkOutDate+"personCount"+personCount);
		
		model.addAttribute("m_no",m_no);
		model.addAttribute("s_loca",s_loca);
		
		model.addAttribute("checkInDate",checkInDate);
		model.addAttribute("checkOutDate",checkOutDate);
		model.addAttribute("personCount",personCount);
		
		model.addAttribute("SLtotalRCont",totalRCont);
		model.addAttribute("listS",dto);
		model.addAttribute("listSDR",dtoSD);
		
	
		
	}

}
