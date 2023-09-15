package com.travel.controller.user;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.travel.dao.admin.IDao_Cosine_Similarity_admin;
import com.travel.dao.user.IDao_Cart_user;
import com.travel.dto.admin.DTO_Cosine_Similarity_admin;
import com.travel.dto.user.DTO_Cart_user;


@RestController
@RequestMapping("user")
public class RestController_Cart_user {
	
	@Autowired
	private SqlSession sqlSession;

	
	@RequestMapping("cart_sim")
	public List<DTO_Cart_user> cart_cosine_similarity(HttpServletRequest request, Model model) {
		
		// 유사도 데이터 추출 (Python)
		// Cosine Similarity
		
		try {
			createCSV();
			
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
	
	private boolean createCSV() {
		
		// 유사도 CSV 파일 생성
		
		String filepath = "C:\\GootTeamProject\\TravelProject\\TMSTSTAY_DATA_TABLE.csv";
		
		File file = new File(filepath);
		
		if(file.exists()) {
			file.delete();
		}
		
		BufferedWriter bw = null;
		
		String NEW_LINE = System.lineSeparator();
		
		try {
			
			bw = new BufferedWriter(new FileWriter(new File(filepath)));
			
			IDao_Cosine_Similarity_admin cos_dao = sqlSession.getMapper(IDao_Cosine_Similarity_admin.class);
			
			List<DTO_Cosine_Similarity_admin> list = cos_dao.selectCsvData();
			
			bw.write("S_NO,S_INFO" + NEW_LINE);
			
			for (int i = 0; i < list.size(); i++) {
				
				String str = list.get(i).getS_no() + "," + list.get(i).getS_info();
				
				if(i != list.size() -1) {
					bw.write(str + NEW_LINE);
				}
				else {
					bw.write(str);
				}
				
			}	
			
			bw.flush();
			bw.close();
			
			return true;
		}
		catch(Exception ex) {
			ex.printStackTrace();
			return false;
		}
		
	}
	
	
}
