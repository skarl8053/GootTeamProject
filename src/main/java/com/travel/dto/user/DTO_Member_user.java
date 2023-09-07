package com.travel.dto.user;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DTO_Member_user {

	private int m_no;
	private String m_email;
	private String m_pw;
	private String m_name;
	private String m_tel;
	private String m_roadaddress;
	private String m_detailaddress;
	private int m_sec; 
	private int m_point;
 	private String m_marketing;
	private int m_area1;
	private int m_area2; 
	private int m_area3; 
	private int m_theme1;
	private int m_theme2;
	private int m_theme3;
	private String m_lock;
	private String m_emailcheck;
}
