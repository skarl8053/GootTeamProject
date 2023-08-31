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
	 private String s_name;
	 private String row_num;
	 private String r_name;
	 private String r_price;
	 private String coupon_no;
	 private String coupon_name;
	 private int point;
	 
	 private int refund_reason_no;
	 private String refund_reason_name;
}
