package com.travel.dto.admin;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DTO_Item_admin {

	// 제품
	public int item_no;
	public String item_name;
	public String item_desc;
	public String filename;
	
	// 이벤트 팝업
	public int event_no;
    public String event_name;
    public String event_flag;
    public String event_date;
	
}
