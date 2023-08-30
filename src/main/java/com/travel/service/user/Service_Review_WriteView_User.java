package com.travel.service.user;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.travel.dao.user.IDao_Review_user;
import com.travel.service.admin.Interface_TravelService;

public class Service_Review_WriteView_User implements Interface_TravelService {
private SqlSession sqlSession;
	
	public Service_Review_WriteView_User(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}


	@Override
	public void execute(Model model) {
		System.out.println(">>>RWriteViewService sign");

		Map<String, Object> map= model.asMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
//		upload  //at guro
		String path = "C:\\GootTeamProject\\TravelProject\\src\\main\\webapp\\resources\\upload_img\\user\\review";
		
//		upload  //at home
//		String path = "D:\\javabigsetspring2023\\spring_work\\k002RTest0808\\src\\main\\webapp\\resources\\upload";
//		file upload(30MB)
		MultipartRequest req=null;
		try {
			req = new MultipartRequest(request, path, 1024 * 1024 * 30, "utf-8",
					new DefaultFileRenamePolicy());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String m_no = req.getParameter("m_no");
		String s_no = req.getParameter("s_no");
		String r_no = req.getParameter("r_no");
		String photo_url = req.getFilesystemName("file");
		String review_rate = req.getParameter("review_rate");
		String review_content = req.getParameter("review_content");
		
		
		
		System.out.println("stay_code"+s_no);
		System.out.println("room_code"+r_no);
		System.out.println("review_text:"+review_content);
		System.out.println("m_no:"+m_no);
		System.out.println("file:"+photo_url);
		System.out.println("rating:"+review_rate);

		// 글만쓰고 파일업로드 안했을 경우
		if (photo_url == null) {
			photo_url = "";
		}
		
		IDao_Review_user dao=sqlSession.getMapper(IDao_Review_user.class);
//		dao.rwrite(s_no,r_no,review_content,photo_url,review_rate);
		dao.rwrite(m_no,s_no,r_no,photo_url,review_rate,review_content);
		
//		입력하는 순간에 평점 평균값을 구해서 숙소 테이블로 보내고 그걸 가지고 오는걸로 해보는건?
		
	}
	
}
