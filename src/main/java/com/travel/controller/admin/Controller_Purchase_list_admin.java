package com.travel.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.travel.service.admin.Interface_TravelService;
import com.travel.service.admin.Service_Purchase_list_admin;
import com.travel.usetools.SearchVO;

@Controller
@RequestMapping("admin")
public class Controller_Purchase_list_admin {

	// 신재환	
	// 관리자 - 회원 구매 내역
	
	@Autowired
	private SqlSession sqlSession;
	private Interface_TravelService service;
	
	@RequestMapping(value="purchase")
	public String report(HttpServletRequest request, Model model, SearchVO searchVO) {
		
		System.out.println("purchase_list_admin_Controller 신호");
		model.addAttribute("request", request);
		model.addAttribute("searchVO",searchVO);
		
		service = new Service_Purchase_list_admin(sqlSession);
		service.execute(model);
		
		return "admin/purchase_list_admin";
	}
	
}
