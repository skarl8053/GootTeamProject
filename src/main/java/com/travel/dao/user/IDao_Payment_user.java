package com.travel.dao.user;

import java.util.List;
import java.util.Map;

import com.travel.dto.admin.DTO_Item_admin;
import com.travel.dto.user.DTO_Payment_user;

public interface IDao_Payment_user {

	DTO_Payment_user getResvInfo(String m_no);
	
	DTO_Payment_user getStayList(String stay_no);

	List<DTO_Payment_user> getRoomList(Map<String, Object> mp);

	int getSumPrice(Map<String, Object> mp);

	Integer coupon_popup_pageCalculate(String m_no, String keyword);

	List<DTO_Item_admin> coupon_selectPopupData(String m_no, String keyword, Integer rowStart, Integer rowEnd);

	int selectOrderNo();
	
	void insertTotalOrder(Map<String, Object> mp);

	void insertDetailOrder(Map<String, Object> mp);

	void updateMemberCoupon(String m_no, String totalUsePoint);
	
	void updateMemberUsePoint(String m_no, int create_order_no);

	void insertMemberCouponList(String m_no, String coupon_no);

	void updateMemberPoint(String m_no, int updatePoint);
	
	void insertMemberPointList(String m_no, int create_order_no, int totalEarnPoint, int totalUsePoint);
	
	void insertPushAL(String m_no, int create_order_no, String string);

	List<DTO_Payment_user> getRoomList_NotExistsDate(Map<String, Object> mp);

	int getSumPrice_NotExistsDate(Map<String, Object> mp);

	void deleteCartList(String m_no, String stay_no);

	

}
