package com.travel.dao.user;

public interface IDao_ReviewReport_user {

	public void reviewReport_insert(int review_no, int report_type, String report_content);

	public int reviewReport_createIndex();

	public void reviewReport_update(int review_no, int new_report_no);

}
