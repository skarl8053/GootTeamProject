package com.travel.dto.user;

import java.sql.Timestamp;

//@Setter
//@Getter
//@AllArgsConstructor
//@NoArgsConstructor
public class DTO_pushal_user {
	private String delivery_addr;
	private int al_no;
	private String m_no;
	private String al_content;
	private String m_name;
	private int order_no;
	private int payment_price;
	private int discount_price;
	private int total_price;
	private String item_name;
	private int step_flag;
	private String step_flag_str;
	private String refund_reason_str;
	private String refund_price;
	private String refund_percentage;
	private String step1_date;
	private String step2_date;
	private Timestamp step1_date_de;
	private Timestamp step2_date_de;
	private Timestamp step3_date_de;
	private String event_name;
	private String event_startdate;
	private String event_enddate;
	private	int event_flag;
	private String filename;
	private String event_member_flag;
	private int m_no1;
	private int	m_no2;
	private int m_no3;
	private int s_no;
	private String s_name;
	private int item_no;
	private Timestamp event_date;
	private int delivery_no;
	private Timestamp order_date;
	private String payment_method_str;
	private String refund_step_flag_str;
	private Timestamp check_in_date;
	private Timestamp check_out_date;
	
	public Timestamp getCheck_in_date() {
		return check_in_date;
	}
	public void setCheck_in_date(Timestamp check_in_date) {
		this.check_in_date = check_in_date;
	}
	public Timestamp getCheck_out_date() {
		return check_out_date;
	}
	public void setCheck_out_date(Timestamp check_out_date) {
		this.check_out_date = check_out_date;
	}
	public String getRefund_step_flag_str() {
		return refund_step_flag_str;
	}
	public void setRefund_step_flag_str(String refund_step_flag_str) {
		this.refund_step_flag_str = refund_step_flag_str;
	}
	public String getPayment_method_str() {
		return payment_method_str;
	}
	public void setPayment_method_str(String payment_method_str) {
		this.payment_method_str = payment_method_str;
	}
	public Timestamp getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Timestamp order_date) {
		this.order_date = order_date;
	}
	public int getDelivery_no() {
		return delivery_no;
	}
	public void setDelivery_no(int delivery_no) {
		this.delivery_no = delivery_no;
	}
	public String getDelivery_addr() {
		return delivery_addr;
	}
	public void setDelivery_addr(String delivery_addr) {
		this.delivery_addr = delivery_addr;
	}
	public String getRefund_reason_str() {
		return refund_reason_str;
	}
	public void setRefund_reason_str(String refund_reason_str) {
		this.refund_reason_str = refund_reason_str;
	}
	public Timestamp getStep3_date_de() {
		return step3_date_de;
	}
	public void setStep3_date_de(Timestamp step3_date_de) {
		this.step3_date_de = step3_date_de;
	}
	public Timestamp getStep1_date_de() {
		return step1_date_de;
	}
	public void setStep1_date_de(Timestamp step1_date_de) {
		this.step1_date_de = step1_date_de;
	}
	public Timestamp getStep2_date_de() {
		return step2_date_de;
	}
	public void setStep2_date_de(Timestamp step2_date_de) {
		this.step2_date_de = step2_date_de;
	}
	public Timestamp getEvent_date() {
		return event_date;
	}
	public void setEvent_date(Timestamp event_date) {
		this.event_date = event_date;
	}
	public int getItem_no() {
		return item_no;
	}
	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public String getEvent_name() {
		return event_name;
	}
	public void setEvent_name(String event_name) {
		this.event_name = event_name;
	}
	public String getEvent_startdate() {
		return event_startdate;
	}
	public void setEvent_startdate(String event_startdate) {
		this.event_startdate = event_startdate;
	}
	public String getEvent_enddate() {
		return event_enddate;
	}
	public void setEvent_enddate(String event_enddate) {
		this.event_enddate = event_enddate;
	}
	public int getEvent_flag() {
		return event_flag;
	}
	public void setEvent_flag(int event_flag) {
		this.event_flag = event_flag;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getEvent_member_flag() {
		return event_member_flag;
	}
	public void setEvent_member_flag(String event_member_flag) {
		this.event_member_flag = event_member_flag;
	}
	public int getM_no1() {
		return m_no1;
	}
	public void setM_no1(int m_no1) {
		this.m_no1 = m_no1;
	}
	public int getM_no2() {
		return m_no2;
	}
	public void setM_no2(int m_no2) {
		this.m_no2 = m_no2;
	}
	public int getM_no3() {
		return m_no3;
	}
	public void setM_no3(int m_no3) {
		this.m_no3 = m_no3;
	}
	public String getRefund_price() {
		return refund_price;
	}
	public void setRefund_price(String refund_price) {
		this.refund_price = refund_price;
	}
	public String getRefund_percentage() {
		return refund_percentage;
	}
	public void setRefund_percentage(String refund_percentage) {
		this.refund_percentage = refund_percentage;
	}
	public String getStep1_date() {
		return step1_date;
	}
	public void setStep1_date(String step1_date) {
		this.step1_date = step1_date;
	}
	public String getStep2_date() {
		return step2_date;
	}
	public void setStep2_date(String step2_date) {
		this.step2_date = step2_date;
	}
	public String getStep_flag_str() {
		return step_flag_str;
	}
	public void setStep_flag_str(String step_flag_str) {
		this.step_flag_str = step_flag_str;
	}
	public int getStep_flag() {
		return step_flag;
	}
	public void setStep_flag(int step_flag) {
		this.step_flag = step_flag;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public int getPayment_price() {
		return payment_price;
	}
	public void setPayment_price(int payment_price) {
		this.payment_price = payment_price;
	}
	public int getDiscount_price() {
		return discount_price;
	}
	public void setDiscount_price(int discount_price) {
		this.discount_price = discount_price;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	
	public int getAl_no() {
		return al_no;
	}
	public void setAl_no(int al_no) {
		this.al_no = al_no;
	}
	public String getM_no() {
		return m_no;
	}
	public void setM_no(String m_no) {
		this.m_no = m_no;
	}
	public String getAl_content() {
		return al_content;
	}
	public void setAl_content(String al_content) {
		this.al_content = al_content;
	}
	
	
}
