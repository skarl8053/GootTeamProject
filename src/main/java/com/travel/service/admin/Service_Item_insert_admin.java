package com.travel.service.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.travel.dao.admin.IDao_Item_admin;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
class Items{
	public String file_name;
	//public int item_no;
	public String item_name;
	public String item_desc;
}
@Service
public class Service_Item_insert_admin implements Interface_TravelService{

	IDao_Item_admin dao;
	ServletContext context;
	
	public Service_Item_insert_admin(SqlSession sqlSession, ServletContext context) { 
		dao = sqlSession.getMapper(IDao_Item_admin.class); 
		this.context = context;
	}
	
	
	
	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String path = "C:\\GootTeamProject\\TravelProject\\src\\main\\webapp\\resources\\upload_img\\admin\\item\\";
		
		int fileMaxSize = 1024 * 1024 * 20; // 20MB까지 첨부
		
		try {
			MultipartRequest req = new MultipartRequest(request, path,  fileMaxSize, "utf-8", new DefaultFileRenamePolicy());
			
			int event_no = Integer.parseInt(req.getParameter("event_no"));
			String event_name = req.getParameter("event_name");
			
			String first_file = req.getFilesystemName("first_file") != null ? req.getFilesystemName("first_file") : "";
			String firstitem_name = req.getParameter("firstitem_name") != null ? req.getParameter("firstitem_name") : "";
			String firstitem_desc = req.getParameter("firstitem_desc") != null ? req.getParameter("firstitem_desc") : "";
			
			String second_file = req.getFilesystemName("second_file") != null ? req.getFilesystemName("second_file") : "";
			String seconditem_name = req.getParameter("seconditem_name") != null ? req.getParameter("seconditem_name") : "";
			String seconditem_desc = req.getParameter("seconditem_desc") != null ? req.getParameter("seconditem_desc") : "";
			
			String third_file = req.getFilesystemName("third_file") != null ? req.getFilesystemName("third_file") : "";
			String thirditem_name = req.getParameter("thirditem_name") != null ? req.getParameter("thirditem_name") : "";
			String thirditem_desc = req.getParameter("thirditem_desc") != null ? req.getParameter("thirditem_desc") : "";
			
			Items firstItem = new Items();
			firstItem.setFile_name(first_file);
			firstItem.setItem_name(firstitem_name);
			firstItem.setItem_desc(firstitem_desc);
			
			Items secondItem = new Items();
			secondItem.setFile_name(second_file);
			secondItem.setItem_name(seconditem_name);
			secondItem.setItem_desc(seconditem_desc);
			
			Items thirdItem = new Items();
			thirdItem.setFile_name(third_file);
			thirdItem.setItem_name(thirditem_name);
			thirdItem.setItem_desc(thirditem_desc);
			
			List<Items> li = new ArrayList<Items>();
			li.add(firstItem);
			li.add(secondItem);
			li.add(thirdItem);
			
			for (int i = 0; i < 3; i++) {
				Map<String, Object> mp = new HashMap<String, Object>();
				mp.put("event_no", event_no);
				mp.put("item_no", (i + 1));
				mp.put("list", li.get(i));
				dao.insertItems(mp);
			}	
			
			model.addAttribute("msg", "경품 정보가 저장되었습니다.");
			model.addAttribute("event_no", event_no);
			model.addAttribute("event_name", event_name);
			
			model.addAttribute("경품이 등록되었습니다.");
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		
	}
}
