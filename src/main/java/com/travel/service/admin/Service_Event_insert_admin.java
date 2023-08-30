package com.travel.service.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.travel.dao.admin.IDao_Event_admin;

@Service
@Transactional
public class Service_Event_insert_admin implements Interface_TravelService {

	IDao_Event_admin dao;
	
	public Service_Event_insert_admin(SqlSession sqlSession) { 
		dao = sqlSession.getMapper(IDao_Event_admin.class); 
	}

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		int fileMaxSize = 1024 * 1024 * 20; // 최대 20MB
		
		// 'resources 폴더 밑에 upload 폴더 생성 후...'
//		String attachPath = "resources\\upload\\";
//		String prjPath = request.getSession().getServletContext().getRealPath("/");
//		
//		// '프로젝트경로 + 첨부파일경로'
//		String path = prjPath + attachPath;

		String path = "C:\\GootTeamProject\\TravelProject\\src\\main\\webapp\\resources\\upload_img\\admin\\event\\";
		
		try {
			
			MultipartRequest req = new MultipartRequest(request, path, fileMaxSize, "utf-8", new DefaultFileRenamePolicy());
			String event_name = req.getParameter("event_name");
			String event_startdate = req.getParameter("event_startdate");
			String event_enddate = req.getParameter("event_enddate");
			String event_flag = req.getParameter("event_flag");
			String filename = req.getFilesystemName("file");
			
			dao.insertEvents(event_name, event_startdate, event_enddate, filename ,event_flag);
			
			model.addAttribute("msg", "이벤트가 등록되었습니다.");
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		
	}
	
}
