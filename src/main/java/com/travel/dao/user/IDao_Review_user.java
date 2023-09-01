package com.travel.dao.user;

import java.util.ArrayList;

import com.travel.dto.user.DTO_Review_user;



public interface IDao_Review_user {

	public void rwrite(String m_no, String s_no, String r_no, String photo_url,String review_rate, String review_content);
	
	public void updateAvgRate(String s_no);

	public ArrayList<DTO_Review_user> rlist();
	public ArrayList<DTO_Review_user> rlistP();
	public void rReport(String review_no);
	public int rateAvg();
	public int selectReviewTotCount();

}
