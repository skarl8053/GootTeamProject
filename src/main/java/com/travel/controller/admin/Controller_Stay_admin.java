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
import com.travel.service.admin.Service_Stay_Room_delete_admin;
import com.travel.service.admin.Service_Stay_delete_admin;
import com.travel.service.admin.Service_Stay_insert_admin;
import com.travel.service.admin.Service_Stay_list_admin;
import com.travel.service.admin.Service_Stay_list_confirm_admin;
import com.travel.service.admin.Service_Stay_list_room_confirm_admin;
import com.travel.service.admin.Service_Stay_modify_admin;
import com.travel.service.admin.Service_Stay_room_insert_admin;
import com.travel.service.admin.Service_Stay_view_admin;
import com.travel.usetools.Cosine_Similarity_CreateCSV;
import com.travel.usetools.SearchVO;

@Controller
@RequestMapping("admin")
public class Controller_Stay_admin {

	// 신재환
	// 관리자 - 숙소 등록 기능

	@Autowired
	private SqlSession sqlSession;
	private Interface_TravelService service;

	// 숙소 등록 페이지
	@RequestMapping(value = "stay")
	public String stay() {
		return "admin/stay_insert_admin";
	}

	// 숙소 등록 과정
	@RequestMapping(method = RequestMethod.POST, value = "/stay_insert_service")
	public String stay_insert_service(HttpServletRequest request, Model model, MultipartHttpServletRequest mtpRequest) {

		System.out.println("stay_insert_Controller 신호");
		model.addAttribute("request", request);
		model.addAttribute("mtpRequest", mtpRequest);

		service = new Service_Stay_insert_admin(sqlSession);
		service.execute(model);

		return "redirect:/admin/stay_list";
	}

	// 숙소 객실 등록 페이지
	@RequestMapping(value = "stay_room")
	public String stay_room() {
		return "admin/stay_room_insert_admin";
	}

	// 숙소 객실 등록 과정
	@RequestMapping(method = RequestMethod.POST, value = "/stay_room_insert_service")
	public String stay_insert_room_service(HttpServletRequest request, Model model,
			MultipartHttpServletRequest mtpRequest) {

		System.out.println("stay_room_insert_Controller 신호");
		model.addAttribute("request", request);
		model.addAttribute("mtpRequest", mtpRequest);

		service = new Service_Stay_room_insert_admin(sqlSession);
		service.execute(model);

		return "redirect:/admin/stay_list";
	}

	// 등록된 숙소 리스트 페이지
	@RequestMapping(value = "stay_list")
	public String stay_list(HttpServletRequest request, Model model, SearchVO searchVO) {

		System.out.println("stay_list_Controller 신호");
		model.addAttribute("request", request);
		model.addAttribute("searchVO", searchVO);

		service = new Service_Stay_list_admin(sqlSession);
		service.execute(model);

		return "admin/stay_list_admin";
	}

	// 숙소 수정 페이지
	@RequestMapping(value = "/stay_edit")
	public String stay_edit_service(HttpServletRequest request, Model model) {

		System.out.println("stay_edit_service_Controller 신호");
		model.addAttribute("request", request);

		service = new Service_Stay_view_admin(sqlSession);
		service.execute(model);

		return "admin/stay_edit_view_admin";
	}

	// 숙소 수정 과정
	@RequestMapping(method = RequestMethod.POST, value = "/stay_modify")
	public String stay_modify_service(HttpServletRequest request, Model model, MultipartHttpServletRequest mtpRequest) {

		System.out.println("stay_modify_service_Controller 신호");
		model.addAttribute("request", request);
		model.addAttribute("mtpRequest", mtpRequest);

		service = new Service_Stay_modify_admin(sqlSession);
		service.execute(model);

		return "redirect:/admin/stay_list";
	}

	// 숙소 삭제 과정
	@RequestMapping(value = "/stay_delete")
	public String stay_delete(HttpServletRequest request, Model model) {

		System.out.println("stay_delete_service_Controller 신호");
		model.addAttribute("request", request);

		service = new Service_Stay_delete_admin(sqlSession);
		service.execute(model);

		return "admin/stay_list_room_confirm_popup_admin";
	}

	// 객실 삭제 과정
	@RequestMapping(method = RequestMethod.POST, value = "/stay_room_delete")
	public String stay_room_delete(HttpServletRequest request, Model model) {

		System.out.println("stay_room_delete_service_Controller 신호");
		model.addAttribute("request", request);

		service = new Service_Stay_Room_delete_admin(sqlSession);
		service.execute(model);

		String s_no = request.getParameter("s_no");
		
		System.out.println("s_no : "+s_no);
//		http://localhost:8090/travel/admin/stay_list_room_confirm_popup?s_no=20
		
		model.addAttribute("msg2", "해당 객실이 삭제되었습니다.");
		return "redirect:/admin/stay_list_room_confirm_popup?s_no=" + s_no ;
	}

	// 숙소 상세보기 페이지 및 과정
	@RequestMapping(value = "/stay_view")
	public String stay_view(HttpServletRequest request, Model model) {

		System.out.println("Stay_view_service_Controller 신호");
		model.addAttribute("request", request);

		service = new Service_Stay_view_admin(sqlSession);
		service.execute(model);

		return "admin/stay_view_admin";
	}

	// 객실 등록 시 등록된 숙소 팝업창 띄워서 나오는 페이지
	@RequestMapping(value = "/stay_list_confirm")
	public String stay_list_confirm(HttpServletRequest request, Model model, SearchVO searchVO) {

		System.out.println("stay_list_confirm_Controller 신호");
		model.addAttribute("request", request);
		model.addAttribute("searchVO", searchVO);

		service = new Service_Stay_list_confirm_admin(sqlSession);
		service.execute(model);

		return "/admin/stay_list_confirm_admin";
	}

	// 숙소 리스트에서 삭제 버튼 클릭시 그 숙소에 있는 객실 삭제하기
	@RequestMapping(value = "/stay_list_room_confirm_popup")
	public String stay_list_room_confirm(HttpServletRequest request, Model model, SearchVO searchVO) {

		System.out.println("stay_list_confirm_Controller 신호");
		model.addAttribute("request", request);
		model.addAttribute("searchVO", searchVO);

		service = new Service_Stay_list_room_confirm_admin(sqlSession);
		service.execute(model);

		return "/admin/stay_list_room_confirm_popup_admin";
	}
	
	// 남기문
	// 숙소 장바구니 - 코사인 유사도 알고리즘 사용을 위한 CSV 파일 다운로드
	@RequestMapping(value = "stay_list_algorithm_update")
	public String stay_list_algorithm_update(HttpServletRequest request, Model model) {

		Cosine_Similarity_CreateCSV cosine_similarity = new Cosine_Similarity_CreateCSV(sqlSession);
		cosine_similarity.createCSV();
		
		if(cosine_similarity.createCSV()) {
			model.addAttribute("msg", "알고리즘 업데이트가 완료되었습니다.");
		}
		else {
			model.addAttribute("msg", "알고리즘 업데이트가 실패하였습니다.");
		}

		return "redirect:stay_list";
	}
}
