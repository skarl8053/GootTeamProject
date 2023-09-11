package com.travel.dao.user;

import java.util.ArrayList;

import com.travel.dto.user.DTO_Review_user;
import com.travel.dto.user.DTO_StayDetail_user;



public interface IDao_Review_user {
	
	public ArrayList<DTO_StayDetail_user> rwriteview(String s_no, String r_no);
	public void rwrite(String m_no, String s_no, String r_no, String photo_url,String review_rate, String review_content);
	
	public void updateAvgRate(String s_no);
	
	public ArrayList<DTO_Review_user> rlist(String s_no);
	public ArrayList<DTO_Review_user> rlistP(String s_no);
	
//	업데이트0907
	public ArrayList<DTO_Review_user> rlistL(String s_no);
	public ArrayList<DTO_Review_user> rlistLP(String s_no);
	
	
	public void rReport(String review_no);
	public int rateAvg(String s_no);
	public int selectReviewTotCount(String s_no);
	
//	업데이트 0905
	public String rlikeCheck(String review_no);
	public void rlikePlusL(String review_no, String m_no);
	public void rlikePlusR(String review_no);
	public void rlikeMinusL(String m_no);
	public void rlikeMinusR(String review_no);
	
	
	

}
