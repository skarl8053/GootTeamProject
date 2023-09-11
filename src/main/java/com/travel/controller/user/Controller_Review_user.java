package com.travel.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.travel.service.admin.Interface_TravelService;
import com.travel.service.user.Service_Review_Like_User;
import com.travel.service.user.Service_Review_List_User;
import com.travel.service.user.Service_Review_Write_User;
import com.travel.service.user.Service_Review_Writeview_User;

@Controller
@RequestMapping("user")
public class Controller_Review_user {
	
	@Autowired
	private SqlSession sqlSession;
	private Interface_TravelService service;
	
		
	@RequestMapping("/review_list_user")
	public String reviewlist(HttpServletRequest request, Model model) {
		System.out.println("reviewlist controll come here");
		
		model.addAttribute("request",request);
		
		service = new Service_Review_List_User(sqlSession);
		service.execute(model);

		return "user/review_list_user";
	}

	@RequestMapping("review_writeview_user")
	public String review_write_view(HttpServletRequest request, Model model) {
		System.out.println("review_write_view controller got sign");

		model.addAttribute("request",request);
		
		service = new Service_Review_Writeview_User(sqlSession);
		service.execute(model);
		
		return "user/review_writeview_user";
	}

	@RequestMapping("review_write_user")
	public String review_write(MultipartHttpServletRequest mtfRequest, Model model) throws Exception {
		System.out.println("====review_write()====");
		
		model.addAttribute("mtfRequest",mtfRequest);
		
		service= new Service_Review_Write_User(sqlSession);
		service.execute(model);
		
		

		return "redirect:review_list_user";
	}
	
	@RequestMapping("review_user_like")
	public String review_user_like(HttpServletRequest request, Model model) {
		System.out.println("====review_user_like()====");
		
		model.addAttribute("request",request);
		
		service= new Service_Review_Like_User(sqlSession);
		service.execute(model);
		
		
		return "redirect:review_list_user";
	}
}
