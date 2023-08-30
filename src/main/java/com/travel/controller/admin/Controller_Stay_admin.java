package com.travel.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.travel.service.admin.Interface_TravelService;
import com.travel.service.admin.Service_Stay_delete_admin;
import com.travel.service.admin.Service_Stay_insert_admin;
import com.travel.service.admin.Service_Stay_list_admin;
import com.travel.service.admin.Service_Stay_modify_admin;
import com.travel.service.admin.Service_Stay_room_insert_admin;
import com.travel.service.admin.Service_Stay_view_admin;
import com.travel.usetools.SearchVO;

@Controller
@RequestMapping("admin")
public class Controller_Stay_admin {

	// 신재환
	// 관리자 - 숙소 등록 기능
	
	@Autowired
	private SqlSession sqlSession;
	private Interface_TravelService service;
	
	@RequestMapping(value="stay")
	public String stay() {
		return "admin/stay_insert_admin";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/stay_insert_service" )
	public String stay_insert_service(HttpServletRequest request, Model model, MultipartHttpServletRequest mtpRequest) {
		
		System.out.println("stay_insert_Controller 신호");
		model.addAttribute("request", request);
		model.addAttribute("mtpRequest",mtpRequest);
		
		service = new Service_Stay_insert_admin(sqlSession);
		service.execute(model);
		
		return "redirect:/admin/stay_list";
	}
	
	@RequestMapping(value="stay_room")
	public String stay_room() {
		return "admin/stay_room_insert_admin";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/stay_room_insert_service" )
	public String stay_insert_room_service(HttpServletRequest request, Model model, MultipartHttpServletRequest mtpRequest) {
		
		System.out.println("stay_room_insert_Controller 신호");
		model.addAttribute("request", request);
		model.addAttribute("mtpRequest",mtpRequest);
		
		service = new Service_Stay_room_insert_admin(sqlSession);
		service.execute(model);
		
		return "redirect:/admin/stay_list";
	}
	
	@RequestMapping(value = "stay_list")
	public String stay_list(HttpServletRequest request, Model model, SearchVO searchVO) {
		
		System.out.println("stay_list_Controller 신호");
		model.addAttribute("request", request);
		model.addAttribute("searchVO",searchVO);
		
		service = new Service_Stay_list_admin(sqlSession);
		service.execute(model);
		
		return "admin/stay_list_admin";
	}
	
	@RequestMapping(value = "/stay_edit" )
	public String stay_edit_service(HttpServletRequest request, Model model) {
		
		System.out.println("stay_edit_service_Controller 신호");
		model.addAttribute("request", request);
		
		service = new Service_Stay_view_admin(sqlSession);
		service.execute(model);
		
		return "admin/stay_edit_view_admin";
	}
	
	@RequestMapping(value = "/stay_modify" )
	public String stay_modify_service(HttpServletRequest request, Model model) {
		
		System.out.println("stay_modify_service_Controller 신호");
		model.addAttribute("request", request);
		
		service = new Service_Stay_modify_admin(sqlSession);
		service.execute(model);
		
		return "admin/stay_edit_view_admin";
	}
	
	@RequestMapping(value = "/stay_delete")
	public String stay_delete(HttpServletRequest request, Model model) {
		
		System.out.println("stay_delete_service_Controller 신호");
		model.addAttribute("request", request);
		
		service = new Service_Stay_delete_admin(sqlSession);
		service.execute(model);
		
		return "redirect:/admin/stay_list";
	}
	
	@RequestMapping(value = "/stay_view")
	public String stay_view(HttpServletRequest request, Model model) {
		
		System.out.println("Stay_view_service_Controller 신호");
		model.addAttribute("request", request);
		
		service = new Service_Stay_view_admin(sqlSession);
		service.execute(model);
		
		return "admin/stay_view_admin";
	}
}
