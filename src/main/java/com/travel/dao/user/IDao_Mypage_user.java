package com.travel.dao.user;

import java.util.List;

import com.travel.dto.user.DTO_Mypage_user;

public interface IDao_Mypage_user {

	void refundInsert(String m_no, String order_no, String refund_reason);

	void refundPoint(String m_no, int usePoint);

	void refundPointList(String string, String order_no, int usePoint);

	int usePoint(String m_no, String order_no);

	int useCoupon(String m_no, String order_no);

	void refundCoupon(String m_no, int useCoupon);

	void refundCouponList(String m_no, String order_no, int usePoint);

	DTO_Mypage_user orderInfoSelect(String m_no, String order_no);

	List<DTO_Mypage_user> orderRoomInfoSelect(String m_no, String order_no);

	DTO_Mypage_user orderDiscountInfoSelect(String m_no, String order_no);

	List<DTO_Mypage_user> refundListSelect();

	void insertPushAL(String m_no, String order_no, String msg);
	
	public List<DTO_Mypage_user> pay_list(int m_no, Integer rowStart, Integer rowEnd, String content, String Num);

	public Integer paging_pay(int m_no);
	public Integer paging_review(int m_no);
	public Integer paging_ing_event(int m_no);
	public Integer paging_end_event(int m_no);
	public Integer paging_point(int m_no);
	public Integer paging_coupon(int m_no);

	List<DTO_Mypage_user> review_list(int m_no, Integer rowStart, Integer rowEnd);

	List<DTO_Mypage_user> point_list(int m_no, Integer pageStart_point, Integer pageEnd_point);

	List<DTO_Mypage_user> coupon_list(int m_no);

	List<DTO_Mypage_user> usecoupon_list(int m_no, Integer pageStart_coupon, Integer pageEnd_coupon);

	List<DTO_Mypage_user> event_list(int m_no, Integer rowStart, Integer rowEnd);
	
	List<DTO_Mypage_user> endevent_list(int m_no, Integer rowStart, Integer rowEnd);

	void orderInfoUpdate(String m_no, String order_no);
	
}
