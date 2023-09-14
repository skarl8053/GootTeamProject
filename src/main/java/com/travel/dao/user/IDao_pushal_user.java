package com.travel.dao.user;

import java.util.List;

import com.travel.dto.user.DTO_pushal_user;

public interface IDao_pushal_user {
	public List<DTO_pushal_user> pushaldelivery(String m_no, Integer pageStart, Integer pageEnd);
	public List<DTO_pushal_user> pushalpayment(String m_no, Integer pageStart, Integer pageEnd);
	public List<DTO_pushal_user> pushalrefund(String m_no, Integer pageStart, Integer pageEnd);
	public List<DTO_pushal_user> refundcheck(String m_no);
	public List<DTO_pushal_user> deliverycheck(String m_no);
	public List<DTO_pushal_user> paymentcheck(String m_no);
	public Integer countpayment(String m_no);
	public Integer countrefund(String m_no);
	public Integer countdelivery(String m_no);
}
