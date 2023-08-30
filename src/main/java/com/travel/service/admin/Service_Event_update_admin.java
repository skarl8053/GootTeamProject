package com.travel.service.admin;

import java.io.File;
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
public class Service_Event_update_admin implements Interface_TravelService {

	IDao_Event_admin dao;
	
	public Service_Event_update_admin(SqlSession sqlSession) { 
		dao = sqlSession.getMapper(IDao_Event_admin.class); 
	}

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		int fileMaxSize = 1024 * 1024 * 20; // 최대 20MB
		
		String path = "C:\\GootTeamProject\\TravelProject\\src\\main\\webapp\\resources\\upload_img\\admin\\event\\";

		try {
			
			MultipartRequest req = new MultipartRequest(request, path, fileMaxSize, "utf-8", new DefaultFileRenamePolicy());
			int event_no = Integer.parseInt(req.getParameter("event_no"));
			String event_name = req.getParameter("event_name");
			String event_startdate = req.getParameter("event_startdate");
			String event_enddate = req.getParameter("event_enddate");
			String event_flag = req.getParameter("event_flag");
			String filename = req.getFilesystemName("file");
			
			
			// 업데이트 이전에 등록했던 파일을 삭제한다.
			String previous_file = dao.selectFile(event_no);
			String previous_file_path = path + previous_file;
			
			
			if(filename == null)
			{
				// 파일내용을 변경하지 않았을 경우 -> 이전 파일은 그대로 둠...
				
				filename = previous_file;
			}
			else {
				// 파일 내용을 변경하는 경우 -> 이전 파일을 삭제
				
				File file = new File(previous_file_path);
				if(file.exists()) {
					file.delete();
				}
				
			}
			
			
			dao.updateEvents(event_no, event_name, event_startdate, event_enddate, filename ,event_flag);
			
			model.addAttribute("msg", "이벤트가 변경되었습니다.");
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		
	}
	
}
