package com.travel.dto.user;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter
@AllArgsConstructor
@NoArgsConstructor
public class DTO_Mypage_user {

	// 환불 관련
	
	 private int order_no;
	 private int s_no;
	 private String payment_price;
	 private String s_name;
	 private String row_num;
	 private int r_no;
	 private String r_name;
	 private String r_price;
	 private String coupon_no;
	 private String coupon_name;
	 private String point;
	 
	 private int refund_reason_no;
	 private String refund_reason_name;
	 
	 private String s_img1;
	 private String check_in_date;
	 private String check_out_date;
	 private String order_date;
	 
	 private int review_no;
	 private String photo_url;
	 private int likes;
	 private String review_content;
	 
	 private int point_no;
	 private int point_type;
	 private int m_point;
	 private int point_in;
	 private int point_out;
	 private String point_usedate;
	 
	 private int coupon_qty;
	 private int row_number;
	 
	 private String coupon_usedate;
	 
	 private int m_no1;
	 private int m_no2;
	 private int m_no3;
	 private String event_flag;
	 private String event_no;
	 private String filename2;
	 
	 private int step_flag;
	 
}
