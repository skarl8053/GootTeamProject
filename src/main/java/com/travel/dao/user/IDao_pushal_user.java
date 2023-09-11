package com.travel.dao.user;

import java.util.List;

import com.travel.dto.user.DTO_pushal_user;

public interface IDao_pushal_user {
	public List<DTO_pushal_user> pushaldelivery(String m_no);
	public List<DTO_pushal_user> pushalSelect(String m_no, String searchType, Integer integer, Integer integer2);
	public List<DTO_pushal_user> pushalrefund(String m_no);
	public List<DTO_pushal_user> refundcheck(String m_no);
	public List<DTO_pushal_user> deliverycheck(String m_no);
	public List<DTO_pushal_user> paymentcheck(String m_no);
	public Integer pageCalculate_pushal(String m_no , String searchType);
}
