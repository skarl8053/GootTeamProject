package com.travel.service.user;

import java.util.ArrayList;

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

		IDao_Stay_user dao= sqlSession.getMapper(IDao_Stay_user.class);
		ArrayList<DTO_StayDetail_user> dto=dao.sList();
		ArrayList<DTO_StayDetail_user> dtoSD=dao.sRList();
		
		int totalRCont=0;
		totalRCont=dao.selectStayLlistTotCount();
		
		model.addAttribute("SLtotalRCont",totalRCont);
		model.addAttribute("listS",dto);
		model.addAttribute("listSDR",dtoSD);
		
	
		
	}

}
