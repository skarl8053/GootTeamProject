package com.travel.dto.admin;

public class DTO_coupon_admin {
	private int coupon_no;
	private String coupon_detail;
	private String coupon_flag;
	private int coupon_qty;
	private String coupon_no_str;
	private String keyword;
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getCoupon_no_str() {
		return coupon_no_str;
	}
	public void setCoupon_no_str(String coupon_no_str) {
		this.coupon_no_str = coupon_no_str;
	}
	public int getCoupon_no() {
		return coupon_no;
	}
	public void setCoupon_no(int coupon_no) {
		this.coupon_no = coupon_no;
	}
	public String getCoupon_detail() {
		return coupon_detail;
	}
	public void setCoupon_detail(String coupon_detail) {
		this.coupon_detail = coupon_detail;
	}
	public String getCoupon_flag() {
		return coupon_flag;
	}
	public void setCoupon_flag(String coupon_flag) {
		this.coupon_flag = coupon_flag;
	}
	public int getCoupon_qty() {
		return coupon_qty;
	}
	public void setCoupon_qty(int coupon_qty) {
		this.coupon_qty = coupon_qty;
	}
}
