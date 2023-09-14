package com.travel.dao.user;

import java.util.List;

import com.travel.dto.user.DTO_Event_List_user;
import com.travel.dto.user.DTO_Recommend_Stay_user;

public interface IDao_Event_On_user {

	public List<DTO_Event_List_user> ongoing_event_img();

	public List<DTO_Event_List_user> ongoing_event_no();

	public List<DTO_Recommend_Stay_user> recommend(int m_no);

	public List<DTO_Recommend_Stay_user> recommend_not_login();

}
