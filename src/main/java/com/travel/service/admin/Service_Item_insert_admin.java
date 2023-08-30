package com.travel.service.admin;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
		MultipartHttpServletRequest request = (MultipartHttpServletRequest)map.get("request");
		
		String path = "C:\\GootTeamProject\\TravelProject\\src\\main\\webapp\\resources\\upload_img\\admin\\item\\";
		
		int event_no = Integer.parseInt(request.getParameter("event_no"));
		String event_name = request.getParameter("event_name");
		
		String firstitem_name = request.getParameter("firstitem_name") != null ? request.getParameter("firstitem_name") : "";
		String firstitem_desc = request.getParameter("firstitem_desc") != null ? request.getParameter("firstitem_desc") : "";
		
		String seconditem_name = request.getParameter("seconditem_name") != null ? request.getParameter("seconditem_name") : "";
		String seconditem_desc = request.getParameter("seconditem_desc") != null ? request.getParameter("seconditem_desc") : "";
		
		String thirditem_name = request.getParameter("thirditem_name") != null ? request.getParameter("thirditem_name") : "";
		String thirditem_desc = request.getParameter("thirditem_desc") != null ? request.getParameter("thirditem_desc") : "";
		
		List<String> fileNames = new ArrayList<String>();
		
		String[] fileHtmlTags = {"first_file", "second_file", "third_file"};
		
		List<MultipartFile> files = new ArrayList<MultipartFile>();
		
		for (int i = 0; i < fileHtmlTags.length; i++) {
			
			if(request.getFiles(fileHtmlTags[i]).size() < 1) {
				files.add(null);
			}
			else {
				files.add(request.getFiles(fileHtmlTags[i]).get(0));
			}

		}	
		
		
		for (int i = 0; i < files.size(); i++) {
			
			if(files.get(i) == null) {
				fileNames.add("");
				continue;
			}
			
			String origin_file = files.get(i).getOriginalFilename();
			long longtime = System.currentTimeMillis();
			String filename = longtime+"_"+files.get(i).getOriginalFilename();
			String pathFile = path + filename;
			
			try {
				if(!origin_file.equals("")) {
					files.get(i).transferTo(new File(pathFile));
				}
				
				fileNames.add(filename);
			}
			catch(Exception ex) {
				ex.printStackTrace();
			}
			
		}
		
		try {
			
			Items firstItem = new Items();
			firstItem.setFile_name(fileNames.get(0));
			firstItem.setItem_name(firstitem_name);
			firstItem.setItem_desc(firstitem_desc);
			
			Items secondItem = new Items();
			secondItem.setFile_name(fileNames.get(1));
			secondItem.setItem_name(seconditem_name);
			secondItem.setItem_desc(seconditem_desc);
			
			Items thirdItem = new Items();
			thirdItem.setFile_name(fileNames.get(2));
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
