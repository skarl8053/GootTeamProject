package com.travel.dto.admin;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter
@AllArgsConstructor
@NoArgsConstructor
public class DTO_Report_admin {

	private int review_no;
	private int report_no;
	private String report_date;
	private String s_name;
	private String report_type;
	private String report_content;
	private String review_content;
	private int m_no;
	private String m_id;
	private String restrict_name;
	private String restrict_flag;
    
	
}
