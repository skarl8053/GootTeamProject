package com.travel.dto.admin;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DTO_Event_admin {

	private int event_no;
	private String event_name;
	private int event_flag;
	private int event_flag_num;
	private String event_flag_name;
	private String event_startdate;
	private String event_enddate;
	private String filename;
	private String check_winner_date;
	
	// 이벤트 당첨자 조회
	private String first_item;
	private String second_item;
	private String third_item;
	
	private String first_member;
	private String second_member;
	private String third_member;
	
	private String event_member_flag;
	
	private int first_delivery_no;
	private int second_delivery_no;
	private int third_delivery_no;
	
	// 이벤트 당첨자 팝업 (TMSTMEMBER 팝업)
	private String m_no;
	private String m_email;
	private String m_name;
	
	
}
