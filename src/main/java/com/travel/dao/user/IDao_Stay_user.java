package com.travel.dao.user;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.travel.dto.user.DTO_StayDetail_user;

public interface IDao_Stay_user {
	
	public ArrayList<DTO_StayDetail_user> sList();
	public ArrayList<DTO_StayDetail_user> sRList();
	
	public ArrayList<DTO_StayDetail_user> sListTscRP();
	public ArrayList<DTO_StayDetail_user> sListTscHP();
	public ArrayList<DTO_StayDetail_user> sListTscHR();
	
	
	public int selectStayLlistTotCount();
	public int selectStayLlistSCTotCount(@Param("type") String type,
			@Param("star") String star, @Param("accommofacil") String accommofacil, @Param("theme") String theme);
	public int selectStayLlistRPTotCount();
	public int selectStayLlistHPTotCount();
	public int selectStayLlistHRTotCount();
	
	
	public ArrayList<DTO_StayDetail_user> sListM
	(@Param("type") String type, @Param("star") String star, @Param("accommofacil") String accommofacil, @Param("theme") String theme);
	
	public ArrayList<DTO_StayDetail_user> sDList(String s_no);
	public ArrayList<DTO_StayDetail_user> sDRList(String s_no);

	public void cartInsert(String m_no,String s_no, String r_no);
}
