package com.travel.dao.admin;

import java.util.List;
import java.util.Map;

import com.travel.dto.admin.DTO_Item_admin;

public interface IDao_Item_admin {

	public int event_popup_pageCalculate(String keyword);

	public List<DTO_Item_admin> event_selectPopupData(String keyword, Integer rowStart, Integer rowEnd);

	public void insertItems(Map<String, Object> mp);

	public List<DTO_Item_admin> selectLists(String event_no);

	public void deleteitems(String event_no);

	public String[] selectitems_img(String event_no);
	
	
}
