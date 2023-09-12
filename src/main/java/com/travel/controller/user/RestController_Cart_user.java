package com.travel.controller.user;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.travel.service.admin.Interface_TravelService;

@RestController
@RequestMapping("user")
public class RestController_Cart_user {
	
	@Autowired
	private SqlSession sqlSession;
	private Interface_TravelService service;
	
//	@RequestMapping("cart")
//	public List<SimDto> cart_cosine_similarity(HttpServletRequest request, Model model) {
//		
//		// 유사도 데이터 추출 (Python)
//		// Cosine Similarity
//		
//		String bt = request.getParameter("bt");
//		
//		String arg1;
//        ProcessBuilder builder;
//        BufferedReader br;
//        List<SimDto> simlist=new ArrayList<SimDto>();
//		
//        arg1 = "C:\\dbcon.py";
//        
//        builder = new ProcessBuilder("python",arg1,"업무의 잔머리 "); //python3 error
//        builder = new ProcessBuilder("python",arg1,bt); //python3 error
//        
//
//        builder.redirectErrorStream(true);
//        Process process = builder.start();
//
//        // 자식 프로세스가 종료될 때까지 기다림
//        int exitval = process.waitFor();
//
//        //// 서브 프로세스가 출력하는 내용을 받기 위해
//        br = new BufferedReader(new InputStreamReader(process.getInputStream(),"euc-kr"));
//
//        String line = "";
//        
//        while ((line = br.readLine()) != null) {
//            System.out.println(">>>  " + line); // 표준출력에 쓴다
//            
//        	SimDto simDto=new SimDto();
//            simDto.setSimtitle(line);
//            simlist.add(simDto);
//        }
//        
//        if(exitval !=0){//비정상종료      
//            System.out.println("비정상종료");
//        }
//        
//        return simlist;
//	}
	
}
