package com.travel.dto.user;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
public class DTO_StayDetail_user {

//	숙소
	private int s_no;
	private String s_name;
	private int s_type;
	private String s_info;
	private int s_loca;
	private String s_addr_x;
	private String s_addr_y;
	private String s_img1;
	private String s_img2;
	private String s_img3;
	private String s_addr;
	private int s_facility1;
	private int s_facility2;
	private int s_facility3;
	private int s_facility4;
	private int s_facility5;
	private int s_facility6;
	private int s_theme1;
	private int s_theme2;
	private int s_theme3;
	private int s_theme4;
	private int s_theme5;
	private int s_theme6;
	private int s_theme7;
	private int s_theme8;
	private int s_rate;
	    
// 객실
	
	private int r_no;
	private String r_name;
	private String r_detail;
	private int r_person_cnt;
	private int r_price;
	private String r_img1;
	private String r_img2;
	private String r_img3;
	private char r_single_bed_flag;
	private char r_double_bed_flag;
	private char r_queen_bed_flag;
	private int r_facility1;
	private int r_facility2;
	private int r_facility3;
	private int r_facility4;
	private int r_facility5;
	private int r_facility6;
	
	
}
