package com.travel.dto.admin;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DTO_Refund_admin {
	
	private int refund_no;
	private int m_no;
	private int order_no;
	private String m_name;
    private String refund_reason;
    private String s_name;
    private String refund_price;
    private String refund_coupon;
    private String refund_point;
    private String step_flag_str;
    private String step1_status;
	private String step2_status;
	private String step1_date;
	private String step2_date;
	
}
