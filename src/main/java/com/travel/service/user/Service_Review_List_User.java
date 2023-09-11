package com.travel.service.user;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.user.IDao_Review_user;
import com.travel.dao.user.IDao_Stay_user;
import com.travel.dto.user.DTO_Review_user;
import com.travel.dto.user.DTO_StayDetail_user;
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

//		String rS=request.getParameter("rS");
		String fS=request.getParameter("fS");
		String s_no=request.getParameter("s_no");
			model.addAttribute("s_no",s_no);		
		if (fS==null) {
			fS="";
		} else if (fS.equals("lately")) {
			fS="lately";
		} else if (fS.equals("likerate")) {
			fS="likes";
		} 
		String pS=request.getParameter("pS");
		if (pS==null) {
			pS="";
		}
		else  { 
			//통과했을때만 _ 이건 검색클릭 후에도 검색한 내용을 남기기위해서
			model.addAttribute("pS","true");		
		}
		
		
		System.out.println("s_no : "+s_no);
//		System.out.println("rS : "+rS);
		System.out.println("fS : "+fS);
		System.out.println("pS : "+pS);

//		fS의 최신순  + 포토여부 검색
		
		if(fS.equals("lately")&& pS.equals("")) {
			model.addAttribute("rlist",dao.rlist(s_no));
		}else if(fS.equals("lately")&& pS.equals("pS")) {
			model.addAttribute("rlist",dao.rlistP(s_no));
		}else if(fS.equals("")&& pS.equals("pS")) {
			model.addAttribute("rlist",dao.rlistP(s_no));
		}else if(fS.equals("")&& pS.equals("")) {
			model.addAttribute("rlist",dao.rlist(s_no));
		}
		
//		fS의 인기순  + 포토여부 검색
		
		if(fS.equals("likes")&& pS.equals("")) {
			model.addAttribute("rlist",dao.rlistL(s_no));
		}else if(fS.equals("likes")&& pS.equals("pS")) {
			model.addAttribute("rlist",dao.rlistLP(s_no));
		}
		
		int totalRCont=0;
		totalRCont=dao.selectReviewTotCount(s_no);
		model.addAttribute("totalRCont",totalRCont);
		
//		별평점 평균 구하기. 숙소별로 변경
		int rateAvg=dao.rateAvg(s_no);
		model.addAttribute("rateAvg",rateAvg);
		
//		숙소 사진 이름 불러오기
		IDao_Stay_user daost=sqlSession.getMapper(IDao_Stay_user.class);
		ArrayList<DTO_StayDetail_user> dto=daost.sDList(s_no);
		
		model.addAttribute("listS",dto);
			
		}

	}
