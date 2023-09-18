package com.travel.service.admin;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.travel.dao.admin.IDao_stay_admin;

public class Service_Stay_room_insert_admin implements Interface_TravelService {

	// 신재환
	// 숙소등록

	IDao_stay_admin dao;

	public Service_Stay_room_insert_admin(SqlSession sqlSession) {
		dao = sqlSession.getMapper(IDao_stay_admin.class);
	}

	@Override
	public void execute(Model model) {

		System.out.println("stay_room_insert_service 신호");

		Map<String, Object> map = model.asMap();

		HttpServletRequest request = (HttpServletRequest) map.get("request");
		MultipartHttpServletRequest mtpRequest = (MultipartHttpServletRequest) map.get("mtpRequest");

		// 숙소 객실정보
		String stay_title = request.getParameter("stay_title");
		String stay_room_name = request.getParameter("stay_room_name");
		String stay_room_person = request.getParameter("stay_room_person");
		String stay_room_price = request.getParameter("stay_room_price");
		String stay_room_detailinfo = request.getParameter("stay_room_detailinfo");
		String stay_room_single_bed = request.getParameter("stay_room_single_bed");
		String stay_room_double_bed = request.getParameter("stay_room_double_bed");
		String stay_room_queen_bed = request.getParameter("stay_room_queen_bed");
		String[] stay_room_facility = request.getParameterValues("stay_room_facility");

		String root = "C:\\GootTeamProject\\TravelProject\\src\\main\\webapp\\resources\\upload_img\\admin\\room\\";
		List<String> changeFilesList = new ArrayList<String>();
		List<MultipartFile> fileList = mtpRequest.getFiles("file");

		for (MultipartFile mf : fileList) {
			String originFile = mf.getOriginalFilename();
			System.out.println("빈 오리진 파일 확인 : " + originFile);
			// long longtime = System.currentTimeMillis();
			String changeFile = mf.getOriginalFilename();
			System.out.println("changeFile : " + changeFile);
			String pathfile = root + "/" + changeFile;
			System.out.println("pathfile : " + pathfile);

			changeFilesList.add(changeFile);

			try {
				if (!originFile.equals("")) {
					mf.transferTo(new File(pathfile));
					System.out.println("다중 업로드 성공!");
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

		for (int i = 0; i < changeFilesArray.length; i++) {
			StayRoomData.add(changeFilesArray[i]);
		}

		StayRoomData.add(stay_room_single_bed);
		StayRoomData.add(stay_room_double_bed);
		StayRoomData.add(stay_room_queen_bed);

		for (int i = 0; i < arr_room_facility.length; i++) {
			StayRoomData.add(arr_room_facility[i]);
		}

		dao.stayRoomInsert(stay_title, StayRoomData);
	}

}
