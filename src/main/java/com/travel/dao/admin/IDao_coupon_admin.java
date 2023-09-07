package com.travel.dao.admin;

import java.util.List;
import java.util.Map;

import com.travel.dto.admin.DTO_coupon_admin;

public interface IDao_coupon_admin {
	public List<DTO_coupon_admin> couponlist(String keyword, Integer integer, Integer integer2);
	public void couponinsert(int coupon_no, String coupon_detail, String coupon_flag, int coupon_qty);
	public void coupondelete(Map<String, Object> mp);
	public int getCouponCount(int coupon_no);
	public int getCouponLimit(int coupon_no);
	public String coupon_no_null_insert(String coupon_no_null, String coupon_detail, String coupon_flag, int coupon_qty);
	
//	쿠폰리스트 paging
	public Integer pageCalculate(String keyword);
}
