package com.travel.service.user;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.ui.Model;

import com.travel.dao.user.IDao_Stay_user;
import com.travel.dto.user.DTO_StayDetail_user;
import com.travel.service.admin.Interface_TravelService;

public class Service_StayDetail_Info_User implements Interface_TravelService {
	private SqlSession sqlSession;

	public Service_StayDetail_Info_User(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void execute(Model model) {
		System.out.println(">>>StayDetail_User_Service sign");
		
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=
				(HttpServletRequest) map.get("request");

		String s_no=request.getParameter("s_no");
		
		JSONArray arr = new JSONArray();
		
		IDao_Stay_user dao= sqlSession.getMapper(IDao_Stay_user.class);
		ArrayList<DTO_StayDetail_user> dto=dao.sDList(s_no);
		/* ArrayList<StayDetail_User_Dto> dtoSD=dao.sDRList(s_no); */
		
		for (DTO_StayDetail_user stay : dto) {
			System.out.println(stay.getS_addr_x() + ":" + stay.getS_addr_y());
			JSONObject obj = new JSONObject();
			obj.put("mapX", stay.getS_addr_x());
			obj.put("mapY", stay.getS_addr_y());
			obj.put("pName", stay.getS_name());
			if (obj != null) {
				arr.add(obj);
			}
		}
		model.addAttribute("arr", arr);
		
		
		model.addAttribute("listS",dto);
		/* model.addAttribute("listSDR",dtoSD); */
		
	
		
	}

}
