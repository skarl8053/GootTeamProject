package com.travel.service.user;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.user.IDao_Stay_user;
import com.travel.dto.user.DTO_StayDetail_user;
import com.travel.service.admin.Interface_TravelService;

public class Service_stay_list_search_user implements Interface_TravelService {
	private DTO_StayDetail_user sud;
	
	private SqlSession sqlSession;
	
	public Service_stay_list_search_user(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void execute( Model model) {
		System.out.println(">>>Service_stay_list_search_user sign");
		
		Map<String, Object> map=model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

//		아코디언 검색
		String type="";
		String star="";
		String accommofacil="";
		String theme="";
		
	
		
		String aco1=request.getParameter("s_typeT1");
		
		String aco2=request.getParameter("starnum");
		String aco3=request.getParameter("budget");
		String aco4=request.getParameter("roomfacil");
		
		String aco5=request.getParameter("accommofacil");
		String aco6=request.getParameter("theme");
		 if (aco1==null ){
			 aco1=" ";
		 }
		 if (aco2==null){
			 aco2=" ";
		 }
		 if (aco3==null){
			 aco3=" ";
		 }
		 if (aco4==null){
			 aco4=" ";
		 }
		 if (aco5==null){
			 aco5=" ";
		 }
		 if (aco6==null){
			 aco6=" ";
		 }
		
		 
			/* 숙소종류 */
		if (aco1.equals("호텔")) {
			type="1";
		}
		if (aco1.equals("모텔")) {
			type="2";
		} else if (aco1.equals("펜션")) {
			type="3";
		} else if (aco1.equals(" ")){ 
			theme=""; 
		}
		
		/* 투숙객평점 */
		if (aco2.equals("1star")) {
			star="1";
		} else if (aco2.equals("2star")) {
			star="2";
		} else if (aco2.equals("3star")) {
			star="3";
		} else if (aco2.equals("4star")) {
			star="4";
		} else if (aco2.equals("5star")) { 
			star="5"; 
		} else if (aco2.equals(" ")){ 
			star=""; 
		}
		
		
		
		/* 숙소시설 */
		if (aco5.equals("반려동물")) {
			accommofacil="1";
		} else if (aco5.equals("레스토랑")) {
			accommofacil="2";
		} else if (aco5.equals("주차시설")) {
			accommofacil="3";
		} else if (aco5.equals("물품보관")) {
			accommofacil="4";
		} else if (aco5.equals("수영장")) { 
			accommofacil="5"; 
		} else if (aco5.equals("흡연구역")) {
		    accommofacil="6"; 
		} else if (aco5.equals(" ")){ 
			accommofacil=""; 
		}
		
		
		
		/*
		 * if (aco6.equals("등산")) { theme="1"; } else if (aco6.equals("바다")) {
		 * theme="2"; } else if (aco6.equals("도시")) { theme="3"; } else if
		 * (aco6.equals("계곡")) { theme="4"; } else if (aco6.equals("레저")) { theme="5"; }
		 * else if (aco6.equals("문화")) { theme="6"; } else if (aco6.equals("맛집")) {
		 * theme="7"; } else if (aco6.equals("파티")){ theme="8"; } else if
		 * (aco6.equals(" ")){ theme=" "; }
		 */
		
		if (aco6.equals("등산")) {
			theme="1";
			
		} else if (aco6.equals("바다")) {
			theme="2";
		} else if (aco6.equals("도시")) {
			theme="3";
		} else if (aco6.equals("계곡")) {
			theme="4";
		} else if (aco6.equals("레저")) {
			theme="5";
		} else if (aco6.equals("문화")) {
			theme="6";
		} else if (aco6.equals("맛집")) {
			theme="7";
		} else if (aco6.equals("파티")) { 
			theme="8"; 
		} else if (aco6.equals(" ")){ 
			theme=""; }
		
		
			
		System.out.println("aco1 : "+aco1);
		System.out.println("s_type : "+type);
		System.out.println("aco2 : "+aco2);
		System.out.println("aco3 : "+aco3);
		System.out.println("aco4 : "+aco4);
		System.out.println("aco5 : "+aco5);
		System.out.println("aco6 : "+aco6);
	
		/*
		 * ArrayList<String> sixkindlist=new ArrayList<String>(); sixkindlist.add(aco1);
		 * sixkindlist.add(aco2); sixkindlist.add(aco3); sixkindlist.add(aco4);
		 * sixkindlist.add(aco5); sixkindlist.add(aco6);
		 */
		 
		
		System.out.println("type:"+type+"accommofacil:"+accommofacil+"theme"+ theme);
		
		IDao_Stay_user dao=sqlSession.getMapper(IDao_Stay_user.class);
		/* 지역만 되는거 */
		/* ArrayList<StayDetail_User_Dto> dto=dao.sListM(s_type); */
		
		
		/* 검색 갯수 */
		int totalRCont=0;
		totalRCont=dao.selectStayLlistSCTotCount(type, star, accommofacil, theme);
		
		
		
		ArrayList<DTO_StayDetail_user> dto=dao.sListM(type, star, accommofacil, theme);
		
		
		model.addAttribute("listS",dto);
		model.addAttribute("SLtotalRCont",totalRCont);
	}

}
