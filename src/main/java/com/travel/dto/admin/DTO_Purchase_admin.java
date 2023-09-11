package com.travel.dto.admin;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class DTO_Purchase_admin {

	private int order_no;
	private int m_no;
	private String s_no;
	private int coupon_no;
	private String order_date;
	private int total_price;
	private int discount_price;
	private int payment_price;
	private String payment_method;
	private String payment_cardno;
	private String payment_account;
	private String payment_flag;
	private String hot_deal_flag;
	private String check_in_date;
	private String check_out_date;

	private String s_img1;
	private String s_name;
	private String codename;

}
