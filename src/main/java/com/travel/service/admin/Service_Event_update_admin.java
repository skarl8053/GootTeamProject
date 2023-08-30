package com.travel.service.admin;

import java.io.File;
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
public class Service_Event_update_admin implements Interface_TravelService {

	IDao_Event_admin dao;
	
	public Service_Event_update_admin(SqlSession sqlSession) { 
		dao = sqlSession.getMapper(IDao_Event_admin.class); 
	}

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		
		MultipartHttpServletRequest request = (MultipartHttpServletRequest)map.get("request");
		
		String path = "C:\\GootTeamProject\\TravelProject\\src\\main\\webapp\\resources\\upload_img\\admin\\event\\";

		int event_no = Integer.parseInt(request.getParameter("event_no"));
		String event_name = request.getParameter("event_name");
		String event_startdate = request.getParameter("event_startdate");
		String event_enddate = request.getParameter("event_enddate");
		String event_flag = request.getParameter("event_flag");
		
		String filename = "";
		
		MultipartFile getFile = request.getFiles("file").get(0);
		String originFile = getFile.getOriginalFilename();
		
		String previous_file = dao.selectFile(event_no);
		
		if(originFile.length() < 1) {
			filename = previous_file;
		}
		else {
			long longtime = System.currentTimeMillis();
			filename = longtime+"_"+getFile.getOriginalFilename();
			
			String pathfile = path + filename;
			
			try {
				if(!originFile.equals("")) {
					getFile.transferTo(new File(pathfile));
				}
			}
			catch(Exception ex) {
				ex.printStackTrace();
			}
			
			// 업데이트 이전에 등록했던 파일을 삭제한다.
			
			String previous_file_path = path + previous_file;
			
			
			File file = new File(previous_file_path);
			if(file.exists()) {
				file.delete();
			}
		}
		
		dao.updateEvents(event_no, event_name, event_startdate, event_enddate, filename ,event_flag);
		
		model.addAttribute("msg", "이벤트가 변경되었습니다.");
		
	}
	
}
