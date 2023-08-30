package com.travel.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.travel.service.admin.Interface_TravelService;
import com.travel.service.user.ReviewReport_Insert_Service;
import com.travel.service.user.Service_Review_List_User;
import com.travel.service.user.Service_Review_WriteView_User;

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
	public String review_write_view() {
		System.out.println("review_write_view controller got sign");

		// need data from booking information.

		//test
		return "user/review_writeview_user";
	}

	@RequestMapping("review_write_user")
	public String review_write(HttpServletRequest request, Model model) throws Exception {
		System.out.println("====review_write()====");
		
		model.addAttribute("request",request);
		
		service= new Service_Review_WriteView_User(sqlSession);
		service.execute(model);
		
		

		return "redirect:user/review_list_user";
	}
}
