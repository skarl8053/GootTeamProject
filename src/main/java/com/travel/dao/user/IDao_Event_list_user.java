package com.travel.dao.user;

import java.util.List;

import com.travel.dto.user.DTO_Event_List_user;

public interface IDao_Event_list_user {

	public List<DTO_Event_List_user> event_list(String searchType, String keyword, Integer rowStart, Integer rowEnd);
	
	public Integer event_notice_pageCalculate(String searchType, String keyword);

	public DTO_Event_List_user event_page();

	public void event_attend(int event_no, int m_no);

	public int check_event(int event_no, int m_no);

	public DTO_Event_List_user event_page2();
	
	public DTO_Event_List_user event_page3();
	
	public DTO_Event_List_user event_page4();

	public List<DTO_Event_List_user> ongoing_event_img();

	public List<DTO_Event_List_user> ongoing_event_no();

}
