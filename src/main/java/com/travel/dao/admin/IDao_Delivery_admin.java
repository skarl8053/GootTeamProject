package com.travel.dao.admin;

import com.travel.dto.admin.DTO_Delivery_admin;

public interface IDao_Delivery_admin {

	DTO_Delivery_admin deliveryStatusSelect(String keyword);

	void deliveryStatusUpdate(String delivery_no, String update);

	void insertPushAL(String delivery_no, String alarm_msg);

}
