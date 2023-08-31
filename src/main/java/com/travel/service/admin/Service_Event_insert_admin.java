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
	
	public Service_Event_insert_admin(SqlSession sqlSession) { 
		dao = sqlSession.getMapper(IDao_Event_admin.class); 
	}

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		
		MultipartHttpServletRequest request = (MultipartHttpServletRequest)map.get("request");
		
		// 'resources 폴더 밑에 upload 폴더 생성 후...'
//		String attachPath = "resources\\upload\\";
//		String prjPath = request.getSession().getServletContext().getRealPath("/");
//		
//		// '프로젝트경로 + 첨부파일경로'
//		String path = prjPath + attachPath;

		
		
		String event_name = request.getParameter("event_name");
		String event_startdate = request.getParameter("event_startdate");
		String event_enddate = request.getParameter("event_enddate");
		String event_flag = request.getParameter("event_flag");
		
		String path = "C:\\GootTeamProject\\TravelProject\\src\\main\\webapp\\resources\\upload_img\\admin\\event\\";
		
		MultipartFile mf = request.getFiles("file").get(0);
		
		String originFile = mf.getOriginalFilename();
		long longtime = System.currentTimeMillis();
		String filename = longtime+"_"+mf.getOriginalFilename();
		String pathFile = path + filename;
		
		try {
			if(!originFile.equals("")) {
				mf.transferTo(new File(pathFile));
			}
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		
		
		dao.insertEvents(event_name, event_startdate, event_enddate, filename ,event_flag);
		
		model.addAttribute("msg", "이벤트가 등록되었습니다.");
	}
	
}
