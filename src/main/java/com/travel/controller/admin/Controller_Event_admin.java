package com.travel.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.travel.service.admin.Interface_TravelService;
import com.travel.service.admin.Service_Event_delete_admin;
import com.travel.service.admin.Service_Event_insert_admin;
import com.travel.service.admin.Service_Event_select_admin;
import com.travel.service.admin.Service_Event_selectdetail_admin;
import com.travel.service.admin.Service_Event_update_admin;
import com.travel.service.admin.Service_Event_winner_form_admin;
import com.travel.service.admin.Service_Event_winner_insert_admin;
import com.travel.service.admin.Service_Event_winnerpopup_admin;

@Controller
@RequestMapping("admin")
public class Controller_Event_admin {
	
	// 남기문
	// 관리자 - 이벤트 관리 기능
	
	@Autowired
	private SqlSession sqlSession;
	
	private Interface_TravelService service;
	
	@RequestMapping(value="event")
	public String select_event(HttpServletRequest request, Model model) {
		
		// 이벤트 조회
		model.addAttribute("request", request);
		
		service = new Service_Event_select_admin(sqlSession);
		service.execute(model);
		
		return "admin/event_admin";
	}
	
	@RequestMapping(value="eventdetail")
	public String eventdetail(HttpServletRequest request, Model model) {
		
		// 이벤트 삭제		
		model.addAttribute("request", request);
		
		service = new Service_Event_selectdetail_admin(sqlSession);
		service.execute(model);
		
		// 상단 select_event 메서드로 이동
		return "admin/event_detail_admin";
	}
	
	@RequestMapping(value="eventinsertform")
	public String eventinsertform(HttpServletRequest request, Model model) {
		
		// 이벤트 등록 화면으로 이동
		return "admin/event_insertform_admin";
		
	}
	
	@RequestMapping(value="event_winner")
	public String eventwinner(HttpServletRequest request, Model model) {
		
		// 이벤트 당첨자 등록
		
		// 이벤트 당첨자 등록
		model.addAttribute("request", request);
		
		service = new Service_Event_winner_form_admin(sqlSession);
		service.execute(model);
				
		return "admin/event_winnerform_admin";
		
	}
	@RequestMapping(value="event_winner/insert")
	public String event_winner_insert(HttpServletRequest request, Model model) {
		
		// 이벤트 당첨자 등록
		model.addAttribute("request", request);
		
		service = new Service_Event_winner_insert_admin(sqlSession);
		service.execute(model);
				
		return "redirect:/admin/event";
		
	}
	
	@RequestMapping(value="event/insert", method=RequestMethod.POST)
	public String eventinsert(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
		
		service = new Service_Event_insert_admin(sqlSession);
		service.execute(model);
		
		// 상단 select_event 메서드로 이동
		return "redirect:/admin/event";
	}
	
	@RequestMapping(value="event/update", method=RequestMethod.POST)
	public String eventupdate(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
		
		service = new Service_Event_update_admin(sqlSession);
		service.execute(model);
		
		// 상단 select_event 메서드로 이동
		return "redirect:/admin/event";
	}
	
	@RequestMapping(value="event/delete")
	public String delete_event(HttpServletRequest request, Model model) {
		
		// 이벤트 삭제		
		model.addAttribute("request", request);
		
		service = new Service_Event_delete_admin(sqlSession);
		service.execute(model);
		
		// 상단 select_event 메서드로 이동
		return "redirect:/admin/event";
	}
	
	@RequestMapping(value="memberpopup")
	public String popup(HttpServletRequest request, Model model) {
		
		// 이벤트 삭제		
		model.addAttribute("request", request);
		
		service = new Service_Event_winnerpopup_admin(sqlSession);
		service.execute(model);
		
		// 상단 select_event 메서드로 이동
		return "/admin/event_winner_popup_admin";
	}
}
