package com.travel.service.user;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.user.IDao_Review_user;
import com.travel.dto.user.DTO_Review_user;
import com.travel.service.admin.Interface_TravelService;

public class Service_Review_List_User implements Interface_TravelService {
private SqlSession sqlSession;
	
	public Service_Review_List_User(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map=model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		IDao_Review_user dao=sqlSession.getMapper(IDao_Review_user.class);
//		ArrayList<ReviewSearchDto> dtos=dao.rlist();
		ArrayList<DTO_Review_user> rlist=null;
		
		
//		들어올 수 있는 데이터값들
//		rS룸이름이라 숙소 테이블이 완성 됬을 때 테스트 해보자
	//  fS에서 최신순은 지금 테스트 가능 O , 인기순은... 음... 어떻게 되려나... 

		String rS=request.getParameter("rS");
		String fS=request.getParameter("fS");
		if (fS==null) {
			fS="";
		} 
		String pS=request.getParameter("pS");
		if (pS==null) {
			pS="";
		}
		else  { 
			//통과했을때만 _ 이건 검색클릭 후에도 검색한 내용을 남기기위해서
			model.addAttribute("pS","true");		
		}
		
		System.out.println("rS : "+rS);
		System.out.println("fS : "+fS);
		System.out.println("pS : "+pS);

//		우선 fS의 최신순  + 포토여부로만 검색기능 구현
		
		if(fS.equals("lately")&& pS.equals("")) {
			model.addAttribute("rlist",dao.rlist());
		}else if(fS.equals("lately")&& pS.equals("pS")) {
			model.addAttribute("rlist",dao.rlistP());
		}else if(fS.equals("")&& pS.equals("pS")) {
			model.addAttribute("rlist",dao.rlistP());
		}else if(fS.equals("")&& pS.equals("")) {
			model.addAttribute("rlist",dao.rlist());
		}
		
		int totalRCont=0;
		totalRCont=dao.selectReviewTotCount();
		model.addAttribute("totalRCont",totalRCont);
		
//		별평점 평균 구하기. 데이터에는 영향없음
		int rateAvg=dao.rateAvg();
		model.addAttribute("rateAvg",rateAvg);
		
	}
	
}
