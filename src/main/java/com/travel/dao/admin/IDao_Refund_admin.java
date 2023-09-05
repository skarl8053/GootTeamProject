package com.travel.dao.admin;

import com.travel.dto.admin.DTO_Refund_admin;

public interface IDao_Refund_admin {

	DTO_Refund_admin refundStatusSelect(String order_no);

	void refundUpdate(String m_no);
	
	int usePoint(String m_no, String order_no);

	int useCoupon(String m_no, String order_no);

	void refundPoint(String m_no, String order_no);

	void refundPointList(String m_no, String order_no);

	void refundCoupon(String m_no, int useCoupon);

	void refundCouponList(String m_no, String order_no, int useCoupon);

	void insertPushAL(String m_no, String order_no, String string);

	

}
