package com.travel.dao.user;

public interface IDao_Mypage_user {

	void refundInsert(String m_no, String order_no, String refund_reason);

	void refundPoint(String m_no, int usePoint);

	void refundPointList(String string, String order_no, int usePoint);

	int usePoint(String m_no, String order_no);

	int useCoupon(String m_no, String order_no);

	void refundCoupon(String m_no, int useCoupon);

	void refundCouponList(String m_no, String order_no, int usePoint);
	
}
