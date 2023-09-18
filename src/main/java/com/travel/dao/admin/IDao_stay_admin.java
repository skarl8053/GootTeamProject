package com.travel.dao.admin;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.travel.dto.admin.DTO_Stay_admin;
import com.travel.dto.admin.DTO_Stay_room_admin;

public interface IDao_stay_admin {

	// 숙소 삭제
	public void stay_delete(int s_no);

	// 객실 삭제
	public void stay_room_delete(int r_no);

	public ArrayList<DTO_Stay_admin> stay_view(String s_no);

	public ArrayList<DTO_Stay_room_admin> stay_room_view(String s_no);

	public int selectBoardTotCount();

	public ArrayList<DTO_Stay_admin> list(int rowStart, int rowEnd, int location, int type);

	// 숙소 등록
	public void stayInsert(List<Object> stayData);

	// 숙소 객실 등록
	public void stayRoomInsert(@Param("stay_title") String stay_title,
			@Param("stayRoomData") List<Object> stayRoomData);

	public List<DTO_Stay_admin> stay_list_confirm_admin(int rowStart, int rowEnd, int location, int type);

	// 숙소 수정
	public void Modify(@Param("StayData") List<Object> StayData, @Param("s_no") String s_no);

	// 숙소 객실 수정
	public void ModifiyRoom(@Param("StayRoomData") List<Object> stayRoomData, @Param("r_no") String r_no);

	// 숙소 리스트 검색결과 유지
	public Integer pageCalculate(int location, int type);

	// 숙소 리스트 삭제 버튼 클릭 시 등록된 객실 리스트
	public List<DTO_Stay_admin> room_list(int rowStart, int rowEnd, int s_no);

	// 숙소 리스트 삭제 버튼 클릭 시 등록된 숙소 정보
	public DTO_Stay_room_admin stay_list(int s_no);

	// 숙소 삭제 버튼 후 객실 리스트 페이징
	public Integer room_list_pageCalculate(int s_no);

	public void stay_room_All_delete(int s_no);

}
