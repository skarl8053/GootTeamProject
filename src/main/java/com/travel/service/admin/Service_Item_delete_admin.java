package com.travel.service.admin;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.admin.IDao_Item_admin;

public class Service_Item_delete_admin implements Interface_TravelService{
	IDao_Item_admin dao;
	
	public Service_Item_delete_admin(SqlSession sqlSession) { 
		dao = sqlSession.getMapper(IDao_Item_admin.class); 
	}

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String event_no = request.getParameter("event_no") != null ? request.getParameter("event_no") : "";	
		String event_name = request.getParameter("event_name") != null ? request.getParameter("event_name") : "";	
		
		String path = "C:\\GootTeamProject\\TravelProject\\src\\main\\webapp\\resources\\upload_img\\admin\\item\\";
		
		String[] img_items = dao.selectitems_img(event_no);
		
		for (int i = 0; i < img_items.length; i++) {
			
			path = path + img_items[i];
			File file = new File(path);
			
			if(file.exists()) {
				file.delete();
			}
		}
		
		
		dao.deleteitems(event_no);
		
		model.addAttribute("event_no", event_no);
		model.addAttribute("event_name", event_name);
		
		model.addAttribute("msg", "제품 목록이 삭제되었습니다.");
	}
}
