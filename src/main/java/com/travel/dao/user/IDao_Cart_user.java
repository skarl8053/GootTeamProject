package com.travel.dao.user;

import java.util.List;

import com.travel.dto.user.DTO_Cart_user;

public interface IDao_Cart_user {

	List<DTO_Cart_user> selectCartStayList(String m_no);

	List<DTO_Cart_user> selectCartRoomList(String m_no, String s_no);

	String[] selectCartInfo(String m_no, String s_no);
	
}
