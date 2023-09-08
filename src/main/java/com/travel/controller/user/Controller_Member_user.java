package com.travel.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.travel.service.user.Member_Delete_Service;
import com.travel.service.user.Member_EmailCheck_Service;
import com.travel.service.user.Member_FindEmail_Service;
import com.travel.service.user.Member_FindPw_Service;
import com.travel.service.user.Member_FreeCoupon_Service;
import com.travel.service.user.Member_Join_Service;
import com.travel.service.user.Member_Login_Service;
import com.travel.service.user.Member_Modifing_Service;
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
		
		if(request.getSession().getAttribute("m_no") != null) {
			
			model.addAttribute("msg", "이미 로그인이 되어있습니다.");
			return "main/main_loading";
					
		}
		
		if(request.getParameter("msg") == null || request.getParameter("msg").equals("")) {
			model.addAttribute("msg","");
		}
		else {
			model.addAttribute("msg",request.getParameter("msg"));
		}
		
		return "member/member_login_user";
	}

	@RequestMapping(value = "logining")
	public String logining(HttpServletRequest request, Model model) throws Exception {
		System.out.println("로그인 중");

		model.addAttribute("request", request);
		check = new Member_Login_Service(sqlSession);
		String page = check.execute(model);

		return page;
	}

	@RequestMapping(value = "logout")
	public String logout(HttpSession session, Model model) {
		
		session.invalidate();
		model.addAttribute("msg", "로그아웃 되었습니다.");
		
		return "main/main_loading";
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
		model.addAttribute("msg","회원가입 완료되었으며, 메일 인증이 완료되어야 정상적으로 이용할 수 있습니다.");
		return "redirect:/main";
	}

	@RequestMapping(value = "find")
	public String find(HttpServletRequest request, Model model) {
		System.out.println("이메일 및 비밀번호 찾기 화면");
		return "member/member_find_user";
	}

	@RequestMapping(value = "find_email")
	public String find_email(HttpServletRequest request, Model model) {
		System.out.println("이메일 찾는 중");
		model.addAttribute("request", request);
		
		service = new Member_FindEmail_Service(sqlSession);
		service.execute(model);
		
		Boolean FindID = (Boolean) model.containsAttribute("FindID");
		System.out.println(FindID);

		if (FindID != null && FindID) {
			model.addAttribute("msg", "휴대폰으로 이메일을 전송하였습니다.");
			return "member/member_login_user";
		} else {
			model.addAttribute("msg", "정보가 정확하지 않습니다.");
			return "member/member_find_user";
		}
			
	}
	@RequestMapping(value = "find_pw")
	public String find_pw(HttpServletRequest request, Model model) {
		System.out.println("비밀번호 찾는 중");
		model.addAttribute("request", request);
		
		service = new Member_FindPw_Service(sqlSession);
		service.execute(model);
		
		Boolean PwSendSuccess = (Boolean) model.containsAttribute("PwSendSuccess");
		System.out.println(PwSendSuccess);

		if (PwSendSuccess != null && PwSendSuccess) {
			model.addAttribute("msg", "임시 비밀번호가 이메일로 전송되었습니다.");
			return "member/member_login_user";
		} else {
			model.addAttribute("msg", "정보가 정확하지 않습니다.");
			return "member/member_find_user";
		}
		
	}

	@RequestMapping(value = "delete")
	public String withdrawl(HttpServletRequest request, Model model) {
		System.out.println("회원탈퇴 페이지");
		return "member/member_delete_user";
	}

	@RequestMapping(value = "deleting")
	public String withdrawling(HttpServletRequest request, Model model) throws Exception {
		System.out.println("회원탈퇴 후 메인페이지로 이동");
		model.addAttribute("request", request);

		service = new Member_Delete_Service(sqlSession);
		service.execute(model);

		Boolean deleteSuccess = (Boolean) model.containsAttribute("deleteSuccess");
		System.out.println(deleteSuccess);

		if (deleteSuccess != null && deleteSuccess) {
			model.addAttribute("msg", "비밀번호가 다릅니다.");
			return "member/member_delete_user";
		} else {
			model.addAttribute("msg", "회원탈퇴 되었습니다.");
			return "redirect:/main";
		}
	}

	@RequestMapping(value = "modify")
	public String modify(HttpServletRequest request, Model model) {
		System.out.println("회원정보 페이지로 이동");
		model.addAttribute("request", request);

		service = new Member_Modify_Service(sqlSession);
		service.execute(model);
		return "member/member_modify_user";
	}

	@RequestMapping(value = "modifing")
	public String modifing(HttpServletRequest request, Model model) throws Exception {
		System.out.println("회원정보 수정 후 메인페이지로 이동");
		model.addAttribute("request", request);

		service = new Member_Modifing_Service(sqlSession);
		service.execute(model);

		return "../user/mypage_info_user";
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

	@RequestMapping(value = "/emailCheck", method = RequestMethod.GET)
	public String emailCheck(HttpServletRequest request, Model model) throws Exception {

		model.addAttribute("request", request);
		
		check = new Member_EmailCheck_Service(sqlSession);
		String link = check.execute(model);
		
		if(link.equals("complete")) {
			
			System.out.println("이메일 인증");
			service = new Member_FreeCoupon_Service(sqlSession);
			service.execute(model);
			
			System.out.println("회원가입 쿠폰 증정");
			
			model.addAttribute("msg", "이메일 인증 완료 : 회원가입 쿠폰이 증정되었습니다.");		
		}
		else {
			model.addAttribute("msg", "이메일 인증이 이미 완료되었습니다.");
		}
		
		return "member/member_emailcheck_user";
	}

}
