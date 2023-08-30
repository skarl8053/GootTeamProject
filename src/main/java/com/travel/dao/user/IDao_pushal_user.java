package com.travel.dao.user;

import java.util.List;

import com.travel.dto.user.DTO_pushal_user;

public interface IDao_pushal_user {
	public List<DTO_pushal_user> pushaldelivery(String m_no);
	public List<DTO_pushal_user> pushalpayment(String m_no);
	public List<DTO_pushal_user> pushalrefund(String m_no);
}
