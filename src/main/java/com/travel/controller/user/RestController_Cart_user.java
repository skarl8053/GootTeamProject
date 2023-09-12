package com.travel.controller.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.travel.dto.user.DTO_Cart_user;
import com.travel.service.admin.Interface_TravelService;

// @RestController
@Controller
@RequestMapping("user")
public class RestController_Cart_user {
	
	@Autowired
	private SqlSession sqlSession;
	private Interface_TravelService service;
	
	@RequestMapping("cart_sim")
	public List<DTO_Cart_user> cart_cosine_similarity(HttpServletRequest request, Model model) {
		
		// 유사도 데이터 추출 (Python)
		// Cosine Similarity
		
//		List<DTO_Cart_user> list=new ArrayList<DTO_Cart_user>();
//		
//		String bt = request.getParameter("bt");
//		String filePath = "C:\\GootTeamProject\\TravelProject\\TMSTROOM_DATA_TABLE.py";
//		
//        ProcessBuilder builder = new ProcessBuilder("python",filePath, bt);
//        builder.redirectErrorStream(true);
//        
//        Process process = builder.start();
//
//        // 자식 프로세스가 종료될 때까지 기다림
//        int exitval = process.waitFor();
//
//        //// 서브 프로세스가 출력하는 내용을 받기 위해
//        BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream(),"euc-kr"));
//
//        String line = "";
//        
//        while ((line = br.readLine()) != null) {
//            System.out.println(">>>  " + line); // 표준출력에 쓴다
//            
//            DTO_Cart_user dto_obj=new DTO_Cart_user();
//            dto_obj.setSimtitle(line);
//            simlist.add(dto_obj);
//        }
//        
//        if(exitval !=0){//비정상종료      
//            System.out.println("비정상종료");
//        }
//        
//       
//        
//        return simlist;
        return null;
	}
	
}
