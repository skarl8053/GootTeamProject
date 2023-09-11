package com.travel.service.user;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.user.IDao_Stay_user;
import com.travel.dto.user.DTO_StayDetail_user;
import com.travel.service.admin.Interface_TravelService;

public class Service_stay_list_link_user implements Interface_TravelService {
	
	private SqlSession sqlSession;
	
	public Service_stay_list_link_user(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void execute( Model model) {
		System.out.println(">>>Service_stay_list_search_user sign");
		
		Map<String, Object> map=model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		IDao_Stay_user dao=sqlSession.getMapper(IDao_Stay_user.class);

//		링크
		String scTop="";
//		검색
		int totalRCont=0;
		
		
		scTop=request.getParameter("scTop");
		
		
//		**
//		scTop자리에는 지역 추가 하면 된다
		 if (scTop==null ){
			 scTop=" ";
		 }

		
		
		 ArrayList<DTO_StayDetail_user> dto=null;
		if (scTop.equals("rP")) {
			model.addAttribute("listS",dao.sListTscRP());
			totalRCont=dao.selectStayLlistRPTotCount();
		} else if (scTop.equals("hP")) {
			model.addAttribute("listS",dao.sListTscHP());
			totalRCont=dao.selectStayLlistHPTotCount();
		} else if (scTop.equals("hR")) {
			model.addAttribute("listS",dao.sListTscHR());
			totalRCont=dao.selectStayLlistHRTotCount();
		} else if (scTop.equals(" ")){ 
			model.addAttribute("listS",dao.sList());
			totalRCont=dao.selectStayLlistTotCount();
		}
		
		
		model.addAttribute("SLtotalRCont",totalRCont);
		
	}

}
