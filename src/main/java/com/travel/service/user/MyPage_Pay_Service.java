package com.travel.service.user;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.user.IDao_Mypage_user;
import com.travel.dto.user.DTO_Mypage_user;
import com.travel.service.admin.Interface_TravelService;
import com.travel.usetools.SearchVO;

public class MyPage_Pay_Service implements Interface_TravelService {

	SqlSession sqlSession;
	IDao_Mypage_user dao;

	public MyPage_Pay_Service(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		this.dao = sqlSession.getMapper(IDao_Mypage_user.class);
	}

	@Override
	public void execute(Model model) {
		System.out.println("결제 내역 서비스단");

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session = request.getSession();
		int m_no = (Integer) session.getAttribute("m_no");

		int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
		SearchVO vo = new SearchVO();
		vo.setDisplayRowCount(30);
		vo.setPage(currentPage);
		vo.pageCalculate(dao.paging_pay(m_no));

		/*-------- 검색 추가 -----------*/

		String[] type = request.getParameterValues("searchSelect");
		String content = request.getParameter("searchInput");
		
		String stay_n = "";
		String room_n = "";
		
		if (type != null) {
			for (String var : type) {
				if (var.equals("stay_n")) {
					stay_n = "stay_n";
					model.addAttribute("stay_n", "true");
				} else if (var.equals("room_n")) {
					room_n = "room_n";
					model.addAttribute("room_n", "true");
				}
			}
		}
		if(content == null) {
			content = "";
		}
		model.addAttribute("searchInput",content);
	
		List<DTO_Mypage_user> dto = null;
		
		if(stay_n.equals("stay_n") && room_n.equals("")) {
			dto=dao.pay_list(m_no, vo.getRowStart(), vo.getRowEnd(),content,"1");
		}else if (stay_n.equals("") && room_n.equals("room_n")) {
			dto=dao.pay_list(m_no, vo.getRowStart(), vo.getRowEnd(),content,"2");
		}else {
			dto=dao.pay_list(m_no, vo.getRowStart(), vo.getRowEnd(),content,"3");			
		}
	
		
		/*---------- 요까지 검색 -------------*/

	
		List<List<String>> r_name = new ArrayList();

		for (int i = 0; i < dto.size(); i++) {
			
			List<String> room = new ArrayList();
		    String[] room_name = dto.get(i).getR_name().split(",");
		    
		    for (int j = 0; j < 3; j++) {
		        if (j < room_name.length) {
		        	room.add(room_name[j]);
		        }
		    }
		    r_name.add(room); 
		}
	    

	    model.addAttribute("dto", dto);
	    model.addAttribute("vo", vo);
	    model.addAttribute("r_name", r_name);
	    
	    if(request.getParameter("msg") == null || request.getParameter("msg").equals("")) {
	         model.addAttribute("msg","");
	      }
	      else {
	         model.addAttribute("msg",request.getParameter("msg"));
	      }
	}
	}
