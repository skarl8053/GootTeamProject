package com.travel.dao.admin;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.travel.dto.admin.DTO_Stay_admin;
import com.travel.dto.admin.DTO_Stay_room_admin;

public interface IDao_stay_admin {

		public void stayRoomRegistration(String stay_room_no, String stay_room_detailinfo, String stay_room_person,
				String stay_room_price, String stay_room_single_bed, String stay_room_double_bed, 
				String stay_room_queen_bed, String[] stay_room_facility);

		// public ArrayList<DTO_Stay_admin> stay_list();

		public void stay_delete(String s_no);

		public ArrayList<DTO_Stay_admin> stay_view(String s_no);

		public ArrayList<DTO_Stay_room_admin> stay_room_view(String s_no);

		public int selectBoardTotCount();

		public ArrayList<DTO_Stay_admin> list(int rowStart, int rowEnd);
		
		public void modify(List<Object> stayData, String s_no);

		// 숙소 등록
		public void stayInsert(List<Object> stayData);
		
		// 숙소 객실 등록
		public void stayRoomInsert(@Param("stay_title") String stay_title, @Param("stayRoomData") List<Object> stayRoomData);

}
