package com.travel.service.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.travel.dao.admin.IDao_Report_admin;


@Service
@Transactional
public class Service_Report_blockall_admin implements Interface_TravelService {

	//  남기문
	//  블랙리스트 스위치 변경
	
	IDao_Report_admin dao;
	
	public Service_Report_blockall_admin(SqlSession sqlSession) { 
		dao = sqlSession.getMapper(IDao_Report_admin.class); 
	}
	
	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String m_id = request.getParameter("m_id"); 
		String is_block = request.getParameter("is_block");
		
		String[] m_id_split = m_id.split(",");
		
		String str_Id = "";
		
		for (int i = 0; i < m_id_split.length; i++) {
			
			String str = m_id_split[i];
			if(i != m_id_split.length -1) {
				str_Id +=  "'" + str +  "',";
			}
			else {
				str_Id +=  "'" + str +  "'";
			}
			
		}
		
		dao.updateBlockAll(str_Id, is_block);
		dao.updateBlockAll_user(str_Id, is_block);
		
		if(is_block.equals("Y")) {
			model.addAttribute("msg", "일괄 접속 / 댓글 차단되었습니다.");
		}
		else {
			model.addAttribute("msg","일괄 접속 / 댓글 차단 해제되었습니다.");
		}
		
	}

}
