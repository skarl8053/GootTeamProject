package com.travel.service.admin;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.travel.dao.admin.IDao_stay_admin;

public class Service_Stay_modify_admin implements Interface_TravelService {

//	신재환 
//	숙소정보 수정
//	관리자

	IDao_stay_admin dao;

	public Service_Stay_modify_admin(SqlSession sqlSession) {
		dao = sqlSession.getMapper(IDao_stay_admin.class);
	}

	@Override
	public void execute(Model model) {

		System.out.println("Service_Stay_modify_admin 신호");

		Map<String, Object> map = model.asMap();

		HttpServletRequest request = (HttpServletRequest) map.get("request");
		MultipartHttpServletRequest mtpRequest = (MultipartHttpServletRequest) map.get("mtpRequest");

		// �닕�냼 怨듯넻�젙蹂�
		String s_no = request.getParameter("s_no");
		String location = request.getParameter("location");
		String category = request.getParameter("category");
		String stay_title = request.getParameter("stay_title");
		String addr_x = request.getParameter("addr_x");
		String addr_y = request.getParameter("addr_y");
		String address = request.getParameter("address");
		String[] stay_facility = request.getParameterValues("stay_facility");
		String stay_info = request.getParameter("stay_info");
		String[] stay_hashtag = request.getParameterValues("stay_hashtag");

		System.out.println("s_no" + s_no);

		// 留λ턿 �씠誘몄� �뾽濡쒕뱶 寃쎈줈
		//String root = "/Users/sjh/Downloads/TeamProject/GootTeamProject0831/GootTeamProject/src/main/webapp/resources/upload_img/admin/stay/";

		String root = "C:\\GootTeamProject\\TravelProject\\src\\main\\webapp\\resources\\upload_img\\admin\\stay\\";

		List<String> changeFilesList = new ArrayList<String>();
		List<MultipartFile> fileList = mtpRequest.getFiles("file");

		if (fileList == null) {
			fileList.isEmpty();
		}

		for (MultipartFile mf : fileList) {
			String originFile = mf.getOriginalFilename();
			System.out.println("鍮� �삤由ъ쭊 �뙆�씪 �솗�씤 : " + originFile);
			// long longtime = System.currentTimeMillis();
			String changeFile = mf.getOriginalFilename();
			System.out.println("changeFile : " + changeFile);
			String pathfile = root + "/" + changeFile;
			System.out.println("pathfile : " + pathfile);

			changeFilesList.add(changeFile);

			try {
				if (!originFile.equals("")) {
					mf.transferTo(new File(pathfile));
					System.out.println("�떎以� �뾽濡쒕뱶 �꽦怨�!");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		String[] changeFilesArray = new String[3];
		for (int i = 0; i < changeFilesArray.length; i++) {
			if (i < fileList.size()) {
				changeFilesArray[i] = changeFilesList.get(i);
			} else {
				changeFilesArray[i] = "";
			}
		}

		for (int i = 0; i < changeFilesArray.length; i++) {
			if (changeFilesArray[i] != null) {
				System.out.println("File " + i + ": " + changeFilesArray[i]);
			} else if (changeFilesArray[i] == null || changeFilesArray[i] == "") {
				System.out.println("File " + i + ": null");
			}
		}

		// String ���엯�쓽 諛곗뿴�쓣 int ���엯�쑝濡� �삎蹂��솚 (�닕�냼 怨듯넻 �젙蹂�)

		int location_int = Integer.parseInt(location);
		int category_int = Integer.parseInt(category);

		int[] stay_facility_int = new int[stay_facility.length];
		for (int i = 0; i < stay_facility.length; i++) {
			stay_facility_int[i] = Integer.parseInt(stay_facility[i]);
		}

		int[] stay_hashtag_int = new int[stay_hashtag.length];
		for (int i = 0; i < stay_hashtag.length; i++) {
			stay_hashtag_int[i] = Integer.parseInt(stay_hashtag[i]);
		}

		// 諛곗뿴�뿉 �엳�뒗 媛믪쓣 �뱾�뼱�엳�뒗 留뚰겮 �븯�굹�뵫 戮묒븘�삤湲�
		int[] arr_facility = new int[6];
		int[] arr_hashtag = new int[8];

		for (int i = 0; i < stay_facility_int.length; i++) {
			if (i < stay_facility_int.length) {
				arr_facility[i] = stay_facility_int[i];
			} else {
				arr_facility[i] = '0';
			}
		}

		System.out.println("arr_facility : " + Arrays.toString(arr_facility));

		for (int i = 0; i < stay_hashtag_int.length; i++) {
			if (i < stay_hashtag_int.length) {
				arr_hashtag[i] = stay_hashtag_int[i];
			} else {
				arr_hashtag[i] = '0';
			}
		}

		System.out.println("arr_hashtag : " + Arrays.toString(arr_hashtag));

		List<Object> StayData = new ArrayList<Object>();
		StayData.add(stay_title);
		StayData.add(category_int);
		StayData.add(stay_info);
		StayData.add(location_int);
		StayData.add(addr_x);
		StayData.add(addr_y);

		for (int i = 0; i < changeFilesArray.length; i++) {
			StayData.add(changeFilesArray[i]);
		}

		StayData.add(address);

		for (int i = 0; i < arr_facility.length; i++) {
			StayData.add(arr_facility[i]);
		}
		for (int i = 0; i < arr_hashtag.length; i++) {
			StayData.add(arr_hashtag[i]);
		}

		System.out.println("媛� 諛쏆� �썑 ");
		System.out.println("location : " + location);
		System.out.println("category : " + category);
		System.out.println("stay_title : " + stay_title);
		System.out.println("stay_facility : " + Arrays.toString(stay_facility));
		System.out.println("stay_info : " + stay_info);
		System.out.println("arr_facility : " + Arrays.toString(arr_facility));
		System.out.println("arr_hashtag : " + Arrays.toString(arr_hashtag));

		for (Object object : StayData) {
			System.out.println(object.toString());
		}

		dao.Modify(StayData, s_no);

//		여기까지 숙소 수정 아래 부터 숙소 객실 수정

		String stay_room_name = request.getParameter("stay_room_name");
		String stay_room_person = request.getParameter("stay_room_person");
		String stay_room_price = request.getParameter("stay_room_price");
		String stay_room_detailinfo = request.getParameter("stay_room_detailinfo");
		String stay_room_single_bed = request.getParameter("stay_room_single_bed");
		String stay_room_double_bed = request.getParameter("stay_room_double_bed");
		String stay_room_queen_bed = request.getParameter("stay_room_queen_bed");
		String[] stay_room_facility = request.getParameterValues("stay_room_facility");

		List<String> changeRoomFilesList = new ArrayList<String>();
		List<MultipartFile> RoomfileList = mtpRequest.getFiles("room_file");
		
		String root_room = "C:\\GootTeamProject\\TravelProject\\src\\main\\webapp\\resources\\upload_img\\admin\\room\\";
		
		for (MultipartFile mf : RoomfileList) {
			String originFile = mf.getOriginalFilename();
			System.out.println("빈 오리진 파일 확인 : " + originFile);
			// long longtime = System.currentTimeMillis();
			String changeRoomFile = mf.getOriginalFilename();
			System.out.println("changeFile : " + changeRoomFile);
			String pathfile = root_room + "/" + changeRoomFile;
			System.out.println("pathfile : " + pathfile);

			changeRoomFilesList.add(changeRoomFile);

			try {
				if (!originFile.equals("")) {
					mf.transferTo(new File(pathfile));
					System.out.println("다중 업로드 성공!");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		String[] changeRoomFilesArray = new String[3];
		for (int i = 0; i < changeRoomFilesArray.length; i++) {
			if (i < RoomfileList.size()) {
				changeRoomFilesArray[i] = changeRoomFilesList.get(i);
			} else {
				changeRoomFilesArray[i] = "";
			}
		}

		for (int i = 0; i < changeRoomFilesArray.length; i++) {
			if (changeRoomFilesArray[i] != null) {
				System.out.println("File " + i + ": " + changeRoomFilesArray[i]);
			} else if (changeRoomFilesArray[i] == null || changeRoomFilesArray[i] == "") {
				System.out.println("File " + i + ": null");
			}
		}

		// number 타입 int로 형변환
		int stay_room_person_int = Integer.parseInt(stay_room_person);
		int stay_room_price_int = Integer.parseInt(stay_room_price);

		int[] stay_room_facility_int = new int[stay_room_facility.length];
		for (int i = 0; i < stay_room_facility.length; i++) {
			stay_room_facility_int[i] = Integer.parseInt(stay_room_facility[i]);
		}

		int[] arr_room_facility = new int[6];

		for (int i = 0; i < stay_room_facility_int.length; i++) {
			if (i < stay_room_facility_int.length) {
				arr_room_facility[i] = stay_room_facility_int[i];
			} else {
				arr_room_facility[i] = '0';
			}
		}

		List<Object> StayRoomData = new ArrayList<Object>();
		StayRoomData.add(stay_room_name);
		StayRoomData.add(stay_room_detailinfo);
		StayRoomData.add(stay_room_person_int);
		StayRoomData.add(stay_room_price_int);

		for (int i = 0; i < changeRoomFilesArray.length; i++) {
			StayRoomData.add(changeRoomFilesArray[i]);
		}

		StayRoomData.add(stay_room_single_bed);
		StayRoomData.add(stay_room_double_bed);
		StayRoomData.add(stay_room_queen_bed);

		for (int i = 0; i < arr_room_facility.length; i++) {
			StayRoomData.add(arr_room_facility[i]);
		}

		dao.ModifiyRoom(StayRoomData, s_no);
	}

}
