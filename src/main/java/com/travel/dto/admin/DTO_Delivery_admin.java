package com.travel.dto.admin;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DTO_Delivery_admin {

	private int delivery_no;
	private int event_no;
	private String event_name;
	private int item_no;
	private String item_name;
	private int m_no;
	private String delivery_addr;
	private int step_flag;
	private String step_flag_str;
	private String step1_status;
	private String step2_status;
	private String step3_status;
	private String step4_status;
	private String step1_date;
	private String step2_date;
	private String step3_date;
	private String step4_date;
	
}
