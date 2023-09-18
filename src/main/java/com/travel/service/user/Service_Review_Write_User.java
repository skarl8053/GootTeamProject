package com.travel.service.user;

import java.io.File;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.travel.dao.user.IDao_Review_user;
import com.travel.service.admin.Interface_TravelService;

public class Service_Review_Write_User implements Interface_TravelService {
private SqlSession sqlSession;
	
	public Service_Review_Write_User(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}


	@Override
	public void execute(Model model) {
		System.out.println(">>>RWriteViewService sign");

		Map<String, Object> map= model.asMap();
		
		MultipartHttpServletRequest mtfRequest = (MultipartHttpServletRequest) map.get("mtfRequest");
		
		String m_no = mtfRequest.getParameter("m_no");
		String s_no = mtfRequest.getParameter("s_no");
//		String r_no = mtfRequest.getParameter("r_no");
		String order_no = mtfRequest.getParameter("order_no");
		
		System.out.println("order_no"+order_no);
		
//		String photo_url = mtfRequest.getFilesystemName("file");
		String review_rate = mtfRequest.getParameter("review_rate");
		String review_content = mtfRequest.getParameter("review_content");

		
		System.out.println("stay_code"+s_no);
//		System.out.println("room_code"+r_no);
		System.out.println("review_text:"+review_content);
		System.out.println("m_no:"+m_no);
		/* System.out.println("file:"+photo_url); */
		System.out.println("rating:"+review_rate);

		
		
//		upload  //at guro
		String path = "C:\\GootTeamProject\\TravelProject\\src\\main\\webapp\\resources\\upload_img\\user\\review\\";
		MultipartFile file = mtfRequest.getFiles("file").get(0);
//		upload  //at home
//		String path = "D:\\javabigsetspring2023\\spring_work\\k002RTest0808\\src\\main\\webapp\\resources\\upload";
//		file upload(30MB)
		
		
		String originFile = file.getOriginalFilename();
		long longtime = System.currentTimeMillis();
		/* String photo_url = longtime+"_"+file.getOriginalFilename(); 사진 유무 표시 문제로 주석처리 */
		String photo_url = file.getOriginalFilename();
		String pathFile = path + photo_url;
				
		try {
			if(!originFile.equals("")) {
				file.transferTo(new File(pathFile));
			}
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		IDao_Review_user dao=sqlSession.getMapper(IDao_Review_user.class);
//		dao.rwrite(m_no,s_no,r_no,photo_url,review_rate,review_content);
		dao.rwrite(m_no,s_no,photo_url,review_rate,review_content);
		
		/* 평점 stay table로 입력 */
		dao.updateAvgRate(s_no);
		
		/* THISORDER table REVIEW_FLAG Y로 */
		dao.updateOrderFlag(order_no);
		
		model.addAttribute("s_no",s_no);
		model.addAttribute("m_no",m_no);
		
	}
	
}
