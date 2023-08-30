package com.travel.dto.user;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
public class DTO_Review_user {

	private int review_no;
	private int report_no;
	private int m_no;
	private int s_no;
	private int r_no;
	private String photo_url;
	private int review_rate;
	private int likes;
	private String review_content;
	private Timestamp review_date;
	private int review_group;
	private int review_step;
	private char restrict_flag;
	
	
	private int totRow;                     // 전체 데이터 수
	
	private int rateAvg;					// 숙박 평점 평균
	/*
	 * private int review_num; private int m_no; private int stay_code; private int
	 * room_code; private Timestamp review_date; private String review_text; private
	 * String photo_url; private int rating; private int likes; private int reports;
	 * private String filesrc;
	 */
	
	
}
