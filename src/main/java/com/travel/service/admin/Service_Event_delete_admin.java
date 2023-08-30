package com.travel.service.admin;

import java.io.File;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.travel.dao.admin.IDao_Event_admin;

import lombok.Setter;

@Setter
class CheckIndex
{
	public int check0;
	public int check1;
	public int check2;
	public int check3;
	public int check4;
	public int check5;
	public int check6;
	public int check7;
	public int check8;
	public int check9;
}

@Service
@Transactional
public class Service_Event_delete_admin implements Interface_TravelService {

	IDao_Event_admin dao;
	
	public Service_Event_delete_admin(SqlSession sqlSession) { 
		dao = sqlSession.getMapper(IDao_Event_admin.class); 
	}

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String event_no = request.getParameter("event_no");
		
		CheckIndex vo = returnDTO(new CheckIndex(), event_no);
		
		Map<String, Object> mp = new HashMap<String, Object>();
		mp.put("vo", vo);
		
		// 'resources 폴더 밑에 upload 폴더 생성 후...'
		// '프로젝트경로 + 첨부파일경로'
		String path = "C:\\GootTeamProject\\TravelProject\\src\\main\\webapp\\resources\\upload_img\\admin\\event\\";
		
		// 이벤트 이미지 파일 삭제
		List<String>li = dao.selectFiles(mp);
		
		for (int i = 0; i < li.size(); i++) {
			
			String filePath = path + li.get(i);
			File file = new File(filePath);
			
			if(file.exists()) {
				file.delete();
			}
		}
		
		// 해당 이벤트의 경품 제거
		dao.deleteItems(mp);
		
		// 해당 이벤트 제거
		dao.deleteEvents(mp);
		
		
		model.addAttribute("msg", "이벤트가 삭제되었습니다.");
		
	}
	
	public <T> T returnDTO(T vo, String split_No)
	{
		try {
			
			String[] splitIndex = split_No.split(",");
			
			String className = vo.getClass().getName();
			Class<?> cls = Class.forName(className);
			Method methods[] = cls.getDeclaredMethods();
			
			for(int i = 0; i<10; i++) {
				
				int num = -1;
				if(i < splitIndex.length)
				{
					num = Integer.parseInt(splitIndex[i]);
				}
				else {
					num = 0;
					continue;
				}
				
				for(int j = 0; j < methods.length; j++)
				{
					if(methods[j].getName().contains(Integer.toString(i))) {
						methods[j].invoke(vo, num);
						break;
					}
				}
			}
			
			return vo;
		} 
		catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
}
