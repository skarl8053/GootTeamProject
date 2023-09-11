package com.travel.dao.admin;

import java.util.ArrayList;

import com.travel.dto.admin.DTO_Purchase_admin;

public interface IDao_purchase_list_admin {

	public ArrayList<DTO_Purchase_admin> purchase_list(int searchType, String keyword, int rowStart, int rowEnd);

	// 구매내역 페이징 처리
	public Integer purchase_pageCalculate(int searchType, String keyword);

}
