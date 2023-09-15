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
		System.out.println("행 개수 : "+vo.getTotRow());
		
		List<DTO_Mypage_user> dto = dao.pay_list(m_no, vo.getRowStart(), vo.getRowEnd());

//		String r_name1 = "";
//		String r_name2 = "";
//		String r_name3 = "";
//	    String[] room_name= new String [3];
//	    String[] r_name = new String[3];
//		
//		System.out.println("여기까지");
//		
//		for (int i = 0; i < dto.size(); i++) {
//			System.out.println("------"+i+"---------");
//			
//			System.out.println("dto : "+dto.size());
//			System.out.println("저장된 내용 : "+dto.get(i).getR_name());
//			
//	    	room_name = dto.get(i).getR_name().split(",");
//	    	
//	    	for (int j = 0; j < 3; j++) {
//	    		if (j > room_name.length - 1) {
//	    			r_name[j] = "";
//	    		} else {
//	    			r_name[j] = room_name[j];
//	    		}
//	    	r_name1 = r_name[0];
//	    	System.out.println(r_name1);
//	    	r_name2 = r_name[1];
//	    	System.out.println(r_name2);
//	    	r_name3 = r_name[2];			
//	    	System.out.println(r_name3);
//		
//	    }
	    	
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
//	    model.addAttribute("r_name1", r_name1);
//	    model.addAttribute("r_name2", r_name2);
//	    model.addAttribute("r_name3", r_name3);
	    model.addAttribute("r_name", r_name);
	    
	    if(request.getParameter("msg") == null || request.getParameter("msg").equals("")) {
	         model.addAttribute("msg","");
	      }
	      else {
	         model.addAttribute("msg",request.getParameter("msg"));
	      }
	}
	}
