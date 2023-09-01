package com.travel.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.travel.service.admin.Interface_TravelService;
import com.travel.service.user.Interface_MemberService;
import com.travel.service.user.Member_Check_Service;
import com.travel.service.user.Member_EmailCheck_Service;
import com.travel.service.user.Member_FreeCoupon_Service;
import com.travel.service.user.Member_Join_Service;
import com.travel.service.user.Member_Login_Service;
import com.travel.service.user.Member_Modify_Service;
import com.travel.service.user.Member_Send_Service;


@Controller
@RequestMapping("member")
public class Controller_Member_user {

	@Autowired
	private SqlSession sqlSession;
	private Interface_TravelService service;
	private Interface_MemberService check;

	@RequestMapping(value = "login")
	public String login(HttpServletRequest request, Model model) {
		return "member/member_login_user";
	}
	
	@RequestMapping(value = "logining")
	public String logining(HttpServletRequest request, Model model) throws Exception {
		System.out.println("로그인 중");
		
		model.addAttribute("request",request);
		check = new Member_Login_Service(sqlSession);
		String page = check.execute(model);
		
		return page;
	}

	@RequestMapping(value = "join")
	public String join_Page() {
		System.out.println("회원가입 페이지로 이동");
		return "member/member_join_user";
	}

	@RequestMapping(value = "joining")
	public String join(HttpServletRequest request, Model model) throws Exception {

		System.out.println("회원가입 중");
		model.addAttribute("request", request);

		service = new Member_Join_Service(sqlSession);
		service.execute(model);
		
		System.out.println("이메일 보내는 중");
		service = new Member_Send_Service(sqlSession);
		service.execute(model);

		System.out.println("메인페이지로 이동");
		return "redirect:/main";
	}

	@RequestMapping(value = "find")
	public String find(HttpServletRequest request, Model model) {
		return "member/member_find_user";
	}

	@RequestMapping(value = "delete")
	public String withdrawl(HttpServletRequest request, Model model) {
		return "member/member_delete_user";
	}

	@RequestMapping(value = "deleting")
	public String withdrawling(HttpServletRequest request, Model model) throws Exception {
		System.out.println("회원탈퇴 후 메인페이지로 이동");
		model.addAttribute("request", request);

		service = new Member_Join_Service(sqlSession);
		service.execute(model);

		return "";
	}

	@RequestMapping(value = "modify")
	public String modify(HttpServletRequest request, Model model) {
		return "member/member_modify_user";
	}

	@RequestMapping(value = "modifing")
	public String modifing(HttpServletRequest request, Model model) throws Exception {
		System.out.println("회원정보 수정 후 메인페이지로 이동");
		model.addAttribute("request", request);

		service = new Member_Modify_Service(sqlSession);
		service.execute(model);

		return "member/member_modify_user";
	}
	
	@ResponseBody
	@RequestMapping(value = "checking", method = RequestMethod.GET)
	public String checking(HttpServletRequest request, Model model) throws Exception {
		System.out.println("이메일 중복 확인");
	
		model.addAttribute("request", request);
		check = new Member_Check_Service(sqlSession);
		String data = check.execute(model);
		
		return data;
	}
	@RequestMapping(value="/emailCheck", method=RequestMethod.GET)
	public String emailCheck(HttpServletRequest request, Model model) throws Exception {
		
		model.addAttribute("request", request);
		check = new Member_EmailCheck_Service(sqlSession);
		String link = check.execute(model);
		System.out.println("이메일 인증");
		service = new Member_FreeCoupon_Service(sqlSession);
		service.execute(model);
		System.out.println("회원가입 쿠폰 증정");
		
		return link;
				
	}

	
	

}
