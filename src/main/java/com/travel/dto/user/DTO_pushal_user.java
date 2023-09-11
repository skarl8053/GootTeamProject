package com.travel.dto.user;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class DTO_pushal_user {
	private String delivery_addr;
	private int al_no;
	private String m_no;
	private String al_content;
	private String m_name;
	private int order_no;
	private int payment_price;
	private int discount_price;
	private int total_price;
	private String item_name;
	private int step_flag;
	private String step_flag_str;
	private String refund_reason_str;
	private String refund_price;
	private String refund_percentage;
	private String step1_date;
	private String step2_date;
	private Timestamp step1_date_de;
	private Timestamp step2_date_de;
	private Timestamp step3_date_de;
	private String event_name;
	private String event_startdate;
	private String event_enddate;
	private	int event_flag;
	private String filename;
	private String event_member_flag;
	private int m_no1;
	private int	m_no2;
	private int m_no3;
	private int s_no;
	private String s_name;
	private int item_no;
	private Timestamp event_date;
	private int delivery_no;
	private Timestamp order_date;
	private String payment_method_str;
	private String refund_step_flag_str;
	private Timestamp check_in_date;
	private Timestamp check_out_date;
	private String al_time;
}
