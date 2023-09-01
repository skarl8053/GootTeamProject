package com.travel.dao.user;

import com.travel.dto.user.DTO_Member_user;

public interface IDao_Member_user {

	public void member_join(String m_email, String m_pw, String m_name, String m_tel, String m_address,
			String m_marketing, int m_area1, int m_area2, int m_area3, int m_theme1, int m_theme2, int m_theme3);

	public String search_no(String m_email);
	public String search_lock(String m_email);
	public int search_sec(String m_email);
	
	public void member_join_coupon(int m_no);
	
	public void member_delete(String m_email, String m_pw);

	public void member_modify(String encryStr, int m_tel, String m_address, int m_marketing, int m_area1, int m_area2,
			int m_area3, int m_theme1, int m_theme2, int m_theme3);

	public DTO_Member_user member_check(String m_email);

	public void update_m_lock(String m_email);

	public DTO_Member_user member_login(String m_email, String m_pw);

	public int getLoginCheck(String m_email, String m_pw);
	
}
