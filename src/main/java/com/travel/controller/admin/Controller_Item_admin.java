package com.travel.controller.admin;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.travel.service.admin.Interface_TravelService;
import com.travel.service.admin.Service_Event_itempopup_admin;
import com.travel.service.admin.Service_Item_delete_admin;
import com.travel.service.admin.Service_Item_form_admin;
import com.travel.service.admin.Service_Item_insert_admin;
import com.travel.service.admin.Service_Item_select_admin;

@Controller
@RequestMapping("admin")
public class Controller_Item_admin {
	
	// 남기문
	// 관리자 - 경품 관리
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private ServletContext context;
	
	private Interface_TravelService service;
	
	@RequestMapping(value="item")
	public String select_event(HttpServletRequest request, Model model) {
		
		// 이벤트 조회
		model.addAttribute("request", request);
		
		service = new Service_Item_select_admin(sqlSession);
		service.execute(model);
		
		return "admin/item_admin";
	}
	@RequestMapping(value="eventpopup")
	public String eventpopup(HttpServletRequest request, Model model) {
		
		// 이벤트 조회
		model.addAttribute("request", request);
		
		service = new Service_Event_itempopup_admin(sqlSession);
		service.execute(model);
		
		return "/admin/item_event_popup_admin";
	}
	@RequestMapping("itemform")
	public String itemform(HttpServletRequest request, Model model) {
		
		// 이벤트 조회
		model.addAttribute("request", request);
		
		service = new Service_Item_form_admin(sqlSession);
		service.execute(model);
		
		return "admin/item_form_admin";
	}
	@RequestMapping("iteminsert")
	public String iteminsert(MultipartHttpServletRequest request, Model model) {
		
		// 이벤트 조회
		model.addAttribute("request", request);
		
		service = new Service_Item_insert_admin(sqlSession, context);
		service.execute(model);
		
		return "redirect:item"; 
	}
	@RequestMapping("itemdelete")
	public String itemdelete(HttpServletRequest request, Model model) {
		
		// 이벤트 조회
		model.addAttribute("request", request);
		
		service = new Service_Item_delete_admin(sqlSession);
		service.execute(model);
		
		return "redirect:item"; 
	}
}
