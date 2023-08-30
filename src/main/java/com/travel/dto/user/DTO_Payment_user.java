package com.travel.dto.user;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter
@AllArgsConstructor
@NoArgsConstructor	
public class DTO_Payment_user {

	// 예약자 정보
	private int m_no;
	private String m_name;
	private String m_address;
	private String m_tel;
	private int m_point;
	
	// 숙소 이름
	private int s_no;
	private String s_name;
	private String s_addr;
	
	// 객실 이름
	private String r_img1;
	private String r_name;
	private int r_person_cnt;
	private int r_price;
	
	
	// 객실 총 가격
	
	private int sum_price;
	
	
	// 쿠폰 관련
	private int coupon_no;
	private String coupon_name;
	private String coupon_detail;
	private int coupon_qty;
	
}
