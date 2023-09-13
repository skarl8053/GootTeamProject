package com.travel.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.travel.service.admin.Interface_TravelService;
import com.travel.service.user.Service_StayDetail_Info_User;
import com.travel.service.user.Service_StayDetail_User;
import com.travel.service.user.Service_Stay_CartInsert_User;
import com.travel.service.user.Service_Stay_List_User;
import com.travel.service.user.Service_stay_list_link_user;
import com.travel.service.user.Service_stay_list_search_user;

@Controller
@RequestMapping("user")
public class Controller_Stay_user {
	
	@Autowired
	private SqlSession sqlSession;
	private Interface_TravelService service;
	
		
	@RequestMapping("/stay_list_user")
	public String stay_list_user(HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
		
		service = new Service_Stay_List_User(sqlSession);
		service.execute(model);

		return "user/stay_list_user";
	}


	/* @RequestMapping(value="/stay_list_search_user", method=RequestMethod.POST) */
	@RequestMapping("/stay_list_search_user")
	public String stay_list_search_user(HttpServletRequest request, Model model) {
		
		model.addAttribute("request",request);
		service = new Service_stay_list_search_user(sqlSession);
		service.execute(model);

		
		return "user/stay_list_user";
	}
	
	@RequestMapping("/stay_list_link_user")
	public String stay_list_link_user(HttpServletRequest request, Model model) {
		
		model.addAttribute("request",request);
		
		service = new Service_stay_list_link_user(sqlSession);
		service.execute(model);
		
		
		return "user/stay_list_user";
	}

	@RequestMapping("/stay_detail_user")
	public String reviewlist(HttpServletRequest request, Model model) {
		
		model.addAttribute("request",request);
		
		service= new Service_StayDetail_User(sqlSession);
		service.execute(model);
		
		

		return "user/stay_detail_user";
	}
	
	@RequestMapping("/stay_detail_info_user")
	public String stay_detail_info(HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
		
		service= new Service_StayDetail_Info_User(sqlSession);
		service.execute(model);
		
		return "user/stay_detail_info_user";
	}
	
	@RequestMapping("/cartInsert")
	public String cartInsert(HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
		
		service= new Service_Stay_CartInsert_User(sqlSession);
		service.execute(model);
		
		return "redirect:stay_detail_user";
	}
	
}
