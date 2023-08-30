package com.travel.dto.user;

//@Setter
//@Getter
//@AllArgsConstructor
//@NoArgsConstructor
public class DTO_pushal_user {
	private int al_no;
	private String m_no;
	private int al_content;
	private String delivery_addr;
	private String m_name;
	private int order_no;
	private int payment_price;
	private int discount_price;
	private int total_price;
	private String item_name;
	private int step_flag;
	private String step_flag_str;
	
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
	public String getDelivery_addr() {
		return delivery_addr;
	}
	public void setDelivery_addr(String delivery_addr) {
		this.delivery_addr = delivery_addr;
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
	public int getAl_content() {
		return al_content;
	}
	public void setAl_content(int al_content) {
		this.al_content = al_content;
	}
	
	
}
