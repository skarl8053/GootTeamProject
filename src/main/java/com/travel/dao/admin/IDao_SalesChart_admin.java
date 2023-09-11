package com.travel.dao.admin;

import java.util.List;

import com.travel.dto.admin.DTO_SalesChart_admin;

public interface IDao_SalesChart_admin {

	int stay_popup_pageCalculate(String keyword);

	List<DTO_SalesChart_admin> stay_selectPopupData(String keyword, Integer rowStart, Integer rowEnd);

	List<DTO_SalesChart_admin> salesChartYearSelect(String s_no, String year);

	List<DTO_SalesChart_admin> salesChartMonthSelect(String s_no, String year, String month);

}
