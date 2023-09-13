package com.travel.dao.user;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.travel.dto.user.DTO_StayDetail_user;

public interface IDao_Stay_user {
	
	public ArrayList<DTO_StayDetail_user> sList(String s_loca);
	public ArrayList<DTO_StayDetail_user> sRList();
	
	public ArrayList<DTO_StayDetail_user> sListTscRP(@Param("s_loca") String s_loca);
	public ArrayList<DTO_StayDetail_user> sListTscHP(@Param("s_loca") String s_loca);
	public ArrayList<DTO_StayDetail_user> sListTscHR(@Param("s_loca") String s_loca);
	
	
	public int selectStayLlistTotCount(@Param("s_loca") String s_loca);
	public int selectStayLlistSCTotCount(@Param("type") String type,
			@Param("star") String star, @Param("accommofacil") String accommofacil, @Param("theme") String theme);
	public int selectStayLlistRPTotCount(@Param("s_loca") String s_loca);
	public int selectStayLlistHPTotCount(@Param("s_loca") String s_loca);
	public int selectStayLlistHRTotCount(@Param("s_loca") String s_loca);
	
	
	public ArrayList<DTO_StayDetail_user> sListM
	(@Param("type") String type, @Param("star") String star, @Param("accommofacil") String accommofacil, @Param("theme") String theme);
	
	public ArrayList<DTO_StayDetail_user> sDList(String s_no);
	public ArrayList<DTO_StayDetail_user> sDRList(String s_no);

	
	public String cartCheck(String m_no, String r_no);
	public void cartInsert(String m_no,String s_no, String r_no);
}
