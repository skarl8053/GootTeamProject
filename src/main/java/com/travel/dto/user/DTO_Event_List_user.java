package com.travel.dto.user;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DTO_Event_List_user {

	private int event_no;
	private String event_name;
	private String event_startdate;
	private String event_enddate;
	private String event_target;
	private String event_caution;
	private int event_flag;
	private int event_flag_num;
	private String filename;
	private String filename2;
	private String event_member_flag;
	private int m_no1;
	private int m_no2;
	private int m_no3;
	
	private int item_no;
	private String item_name;
	private int item_no_1;
	private String item_name_1;
	private int item_no_2;
	private String item_name_2;
	
	private int m_no;
}
