package com.travel.dto.admin;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DTO_Stay_room_admin {

	private int r_no;
	private int s_no;
	private String r_name;
	private String r_detail;
	private int r_person_cnt;
	private int r_price;
	private String r_img1;
	private String r_img2;
	private String r_img3;
	private String r_single_bed_flag;
	private String r_double_bed_flag;
	private String r_queen_bed_flag;
	private int r_facility1;
	private int r_facility2;
	private int r_facility3;
	private int r_facility4;
	private int r_facility5;
	private int r_facility6;

	private String s_img1;
	private String s_name;
}
