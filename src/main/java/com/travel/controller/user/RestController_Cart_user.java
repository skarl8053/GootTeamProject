package com.travel.controller.user;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.travel.dao.user.IDao_Cart_user;
import com.travel.dto.user.DTO_Cart_user;


@RestController
@RequestMapping("user")
public class RestController_Cart_user {
	
	@Autowired
	private SqlSession sqlSession;

	
	@RequestMapping("cart_sim")
	public List<DTO_Cart_user> cart_cosine_similarity(HttpServletRequest request, Model model) {
		
		// 유사도 데이터 추출 (Python)
		// 남기문
		
		try {
			
			IDao_Cart_user dao =  sqlSession.getMapper(IDao_Cart_user.class);
			
			String bt = request.getParameter("s_no");
			String filePath = "C:\\GootTeamProject\\TravelProject\\Cart_Similarity.py";
			
	        ProcessBuilder builder = new ProcessBuilder("python", filePath, bt);
	        builder.redirectErrorStream(true);
	        
	        Process process = builder.start();

	        // 자식 프로세스가 종료될 때까7지 기다림
	        int exitval = process.waitFor();

	        //// 서브 프로세스가 출력하는 내용을 받기 위해
	        BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream(),"UTF-8"));

	        String readText = "";
	        List<Integer> s_no_list = new ArrayList<Integer>();
	        
	        int index = 0;
	        
	        while ((readText = br.readLine()) != null) {
	        	if(index == 5) {
	        		break;
	        	}
	        	
	        	s_no_list.add(Integer.parseInt(readText.substring(readText.lastIndexOf(" ") + 1)));
	        	
	        	index++; 
	        }
	        
	        List<DTO_Cart_user> list = dao.selectRecomendList(s_no_list);
	        
	        if(exitval !=0){//비정상종료      
	            System.out.println("비정상종료");
	        }
	        return list;
		}
		catch(Exception ex) {
			ex.printStackTrace();
			return null;
		}
	}
	
	
	
}
