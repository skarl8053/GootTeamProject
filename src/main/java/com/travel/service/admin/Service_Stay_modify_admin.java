package com.travel.service.admin;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.admin.IDao_stay_admin;
import com.travel.dto.admin.DTO_Stay_admin;
import com.travel.usetools.SearchVO;

public class Service_Stay_modify_admin implements Interface_TravelService {
	
//	신재환 
//	숙소정보 수정
//	관리자

	IDao_stay_admin dao;
	
	public Service_Stay_modify_admin(SqlSession sqlSession) { 
		dao = sqlSession.getMapper(IDao_stay_admin.class); 
	}
	
	@Override
	public void execute(Model model) {
		
		System.out.println("Service_Stay_modify_admin 신호");
		
		// 페이징 처리
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String s_no = request.getParameter("s_no");
		System.out.println("s_no"+s_no);
		
		String location = request.getParameter("location");
		String category = request.getParameter("category");
		String stay_title = request.getParameter("stay_title");
		String[] stay_facility = request.getParameterValues("stay_facility");
		String stay_info = request.getParameter("stay_info");
		String[] stay_hashtag = request.getParameterValues("stay_hashtag");
		
		// String 타입의 배열을 int 타입으로 형변환 (숙소 공통 정보)
		int location_int = Integer.parseInt(location);
		int category_int = Integer.parseInt(category);
		
		int[] stay_facility_int = new int[stay_facility.length];
		for (int i = 0; i < stay_facility.length; i++) {
			stay_facility_int[i] = Integer.parseInt(stay_facility[i]);
		}
		
		int[] stay_hashtag_int = new int[stay_hashtag.length];
		for (int i = 0; i < stay_hashtag.length; i++) {
			stay_hashtag_int[i] = Integer.parseInt(stay_hashtag[i]);
		}
		
		// 배열에 있는 값을 들어있는 만큼 하나씩 뽑아오기
		int[] arr_facility = new int[6];
		int[] arr_hashtag = new int[8];
		
		for (int i = 0; i < stay_facility_int.length; i++) {
		    if (i < stay_facility_int.length) {
		        arr_facility[i] = stay_facility_int[i];
		    } else {
		        arr_facility[i] = '0';
		    }
		}
		
		System.out.println("arr_facility : "+Arrays.toString(arr_facility));

		for (int i = 0; i < stay_hashtag_int.length; i++) {
		   if (i < stay_hashtag_int.length) {
			   arr_hashtag[i] = stay_hashtag_int[i];
		   } else {
			   arr_hashtag[i] = '0';
		   }
		}
		
		System.out.println("arr_hashtag : "+Arrays.toString(arr_hashtag));
		
		List<Object> StayData = new ArrayList<Object>();
		StayData.add(stay_title);
		StayData.add(category_int);
		StayData.add(stay_info);
		StayData.add(location_int);
		
		for (int i = 0; i < arr_facility.length; i++) {
			StayData.add(arr_facility[i]);
		}
		for (int i = 0; i < arr_hashtag.length; i++) {
			StayData.add(arr_hashtag[i]);
		}
		
		System.out.println("값 받은 후 ");
		System.out.println("location : "+location);
		System.out.println("category : "+category);
		System.out.println("stay_title : "+stay_title);
		System.out.println("stay_facility : "+Arrays.toString(stay_facility));
		System.out.println("stay_info : "+stay_info);
		System.out.println("arr_facility : "+Arrays.toString(arr_facility));
		System.out.println("arr_hashtag : "+Arrays.toString(arr_hashtag));
		
		for (Object object : StayData) {
			System.out.println(object.toString());
		}
		
		dao.modify(StayData,s_no);
		
	}

}
