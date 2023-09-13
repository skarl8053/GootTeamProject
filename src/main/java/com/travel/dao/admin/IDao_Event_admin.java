package com.travel.dao.admin;

import java.util.List;
import java.util.Map;

import com.travel.dto.admin.DTO_Event_admin;

public interface IDao_Event_admin {

	public Integer pageCalculate(String param1, String keyword);

	public List<DTO_Event_admin> selectEvents(String searchType, String keyword, int rowStart, int rowEnd);

	public void deleteEvents(Map<String, Object> event_no);

	public void insertEvents(String event_name, String event_startdate, String event_enddate, String event_intro, String event_content, String event_target, String event_caution, String filename, String filename2, String event_flag);

	public List<String> selectFiles(Map<String, Object> mp);

	public DTO_Event_admin selectDetailEvent(int event_no);

	public String selectFile(int event_no);

	public void updateEvents(int event_no, String event_name, String event_startdate, String event_enddate, String event_target, String event_caution, String filename, String filename2, String event_flag);

	public List<DTO_Event_admin> member_selectPopupData(int event_no, String searchType, String keyword, Integer rowStart, Integer rowEnd);

	public int member_popup_pageCalculate(int event_no, String searchType, String keyword);

	public DTO_Event_admin selectEventWinner(String event_no);

	public void deleteItems(Map<String, Object> mp);

	public void updateEventWinner(String event_no, String first_mno, String second_mno, String third_mno);

	public void insertDelivery(String event_no, int item_no);

	public void insertPushAL(String first_mno, int delivery_no, String alarm_msg);

	public int selectDeliveryNo(String m_no_list, String event_no);
	
}
