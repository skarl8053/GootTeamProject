package com.travel.service.admin;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.travel.dao.admin.IDao_Event_admin;

@Service
@Transactional
public class Service_Event_insert_admin implements Interface_TravelService {

	IDao_Event_admin dao;
	MultipartHttpServletRequest request = null;
	
	public Service_Event_insert_admin(SqlSession sqlSession) { 
		dao = sqlSession.getMapper(IDao_Event_admin.class); 
	}

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		
		request = (MultipartHttpServletRequest)map.get("request");
		
		String event_name = request.getParameter("event_name");
		String event_startdate = request.getParameter("event_startdate");
		String event_enddate = request.getParameter("event_enddate");
		String event_flag = request.getParameter("event_flag");
		
		String event_intro = request.getParameter("event_intro");
		String event_content = request.getParameter("event_content");
		String event_target = request.getParameter("event_target");
		String event_caution = request.getParameter("event_caution");
		
		String path = "C:\\GootTeamProject\\TravelProject\\src\\main\\webapp\\resources\\upload_img\\admin\\event\\";
		String detailpath = "C:\\GootTeamProject\\TravelProject\\src\\main\\webapp\\resources\\upload_img\\admin\\event\\detail\\";
		
		String filename = returnFileName("file", path);
		String filename2 = returnFileName("file2", detailpath);
		
		dao.insertEvents(event_name, event_startdate, event_enddate, event_intro, event_content, event_target, event_caution, filename, filename2, event_flag);
		
		model.addAttribute("msg", "이벤트가 등록되었습니다.");
	}
	
	private String returnFileName(String tagname, String path) {
		
		String filename = "";
		
		MultipartFile mf = request.getFiles(tagname).get(0);
		
		String originFile = mf.getOriginalFilename();
		long longtime = System.currentTimeMillis();
		filename = longtime+"_"+mf.getOriginalFilename();
		String pathFile = path + filename;
		
		try {
			if(!originFile.equals("")) {
				mf.transferTo(new File(pathFile));
			}
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return filename;
		
	}
	
}
