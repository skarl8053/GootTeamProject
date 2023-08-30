<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>숙소 등록</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/stay_registration_admin.css"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- 개별 화면 content 크기를 조절하는 방법 -->
    <style>
        #content{
            height: 2500px;
            width : 1200px;
            margin : auto;
        }
    </style>
    
</head>
<body>
<c:forEach items="${stay_view }" var="stay_view">
<!-- <form action="stay_registration_service" method="post"> -->
		<p class="stay_registration_text">숙소 등록</p>
	    <hr>
	    <p>숙소 공통 정보</p>
	    <select class="location" name="location">
	        <option value=" " selected>지역 선택</option>
	        <option value="1">서울</option>
	        <option value="2">경기</option>
	        <option value="3">인천</option>
	        <option value="4">제주</option>
	        <option value="5">전라</option>
	        <option value="6">경상</option>
	        <option value="7">충청</option>
	        <option value="8">강원</option>
	    </select> <br />
	    
	    <div>
	   	지역 <input type="text" value="${stay_view.s_loca }" />
	   </div>
	    
	    <select class="category" name="category">
	        <option value=" " selected>카테고리</option>
	        <option value="1">${stay_view.s_type }</option>
	        <option value="2">${stay_view.s_type }</option>
	        <option value="3">${stay_view.s_type }</option>
	    </select> <br>
	    
	   <div>
	   	카테고리<input type="text" value="${stay_view.s_type }" />
	   </div>
	    
	    <div id="textfield">
		    <span id="title">제목</span>
		    <input type="text" onfocus="this.value='';" name="stay_title" class="title" value="${stay_view.s_name }">
		    
	    </div>
	    <p>숙소 공통 사진</p>
	        <input type="box" style="width: 200px; height: 200px; background-color: navy;">
	        <input type="box" style="width: 200px; height: 200px; background-color: navy;">
	        <input type="box" style="width: 200px; height: 200px; background-color: navy;"><br>
	        <div class="file-upload-container">
	        	<input type="file" class="real-upload" accept="image/*" multiple>
	    		<button class="upload-button">업로드</button>
	    	</div>	
	    	
	        <div class="xy">
		        <span>위도</span>
		        <input type="text" onfocus="this.value='';" name="Latitude" value="위도를 입력해주세요.">
		        <span>경도</span>
		        <input type="text" onfocus="this.value='';" name="longitude" value="경도를 입력해주세요.">
	        </div>
	        <p>숙소 편의시설</p>
	            <div id="stay_facility">
	                <input type="checkbox" name="stay_facility" value="1"> 1. 반려동물
	                <input type="checkbox" name="stay_facility" value="2"> 2. 레스토랑
	                <input type="checkbox" name="stay_facility" value="3"> 3. 주차시설 <br>
	                <input type="checkbox" name="stay_facility" value="4"> 4. 물품보관
	                <input type="checkbox" name="stay_facility" value="5"> 5. 수영장
	                <input type="checkbox" name="stay_facility" value="6"> 6. 흡연구역 <br />
	                ${stay_view.s_facility1 },${stay_view.s_facility2 },${stay_view.s_facility3 } <br />
	            	${stay_view.s_facility4 },${stay_view.s_facility5 },${stay_view.s_facility6 }
	            </div>
	            
	        <p>숙소 정보 및 정책</p>
	        <textarea name="stay_info" onfocus="this.value='';" id="" cols="30" rows="10">${stay_view.s_info }</textarea>
	        	
	        <p>해시태그</p>
	        <div id="hashtag">
	            <input type="checkbox" value="1" name="stay_hashtag"> 1. 등산
	            <input type="checkbox" value="2" name="stay_hashtag"> 2. 바다
	            <input type="checkbox" value="3" name="stay_hashtag"> 3. 도시
	            <input type="checkbox" value="4" name="stay_hashtag"> 4. 계곡 <br>
	            <input type="checkbox" value="5" name="stay_hashtag"> 5. 레저
	            <input type="checkbox" value="6" name="stay_hashtag"> 6. 문화
	            <input type="checkbox" value="7" name="stay_hashtag"> 7. 맛집
	            <input type="checkbox" value="8" name="stay_hashtag"> 8. 파티 <br />
	            ${stay_view.s_theme1 },${stay_view.s_theme2 },${stay_view.s_theme3 },${stay_view.s_theme4 } <br />
	            ${stay_view.s_theme5 },${stay_view.s_theme6 },${stay_view.s_theme7 },${stay_view.s_theme8 }
	        </div>
	        </c:forEach> 
	        
			    <p>숙소 객실 정보</p>
		        <div id="detailinfo">
		            <div id="image_container"></div>
		            <div id="image_container"></div>
		            <div id="image_container"></div>
		            <input type="box" id="image_container" style="width: 200px; height: 200px; background-color: navy;">
		            <input type="box" id="image_container" style="width: 200px; height: 200px; background-color: navy;">
		            <input type="box" id="image_container" style="width: 200px; height: 200px; background-color: navy;"> <br>
		            <!-- <div class="file-upload-container">
		    			<input type="file" class="real-upload" accept="image/*" value="업로드" required multiple>
		    			<button class="upload-button">업로드</button>
		    		</div>	 -->
		            <!-- 파일 업로드 후 미리보기 무조건 실행해야 넘어가는거 수정해야함-->
		        	
		        
		            <p>메인 이미지</p>
		            <span>숙소 객실번호</span>
		            <input type="text" onfocus="this.value='';" id="stay_room_no" name="stay_room_no" value="객실번호를 입력해주세요.">
		            <span>인원 수</span>
		            <select name="stay_room_person">
		                <option value=" " selected>인원 수</option>
		                <option value="2">2</option>
		                <option value="3">3</option>
		                <option value="4">4</option>
		                <option value="5">5</option>
		                <option value="6">6</option>
		            </select><br>
		            <span>가격</span>
		            <input type="text" id="stay_room_price" name="stay_room_price" onfocus="this.value='';" value="가격을 입력해주세요.">
		            <p>객실 상세정보</p>
		            <textarea name="stay_room_detailinfo" id="stay_room_detailinfo" cols="30" rows="10"></textarea><br>
		            <span>침대</span> <br>
		            <div class="bed">
		                <span>싱글 베드 침대</span>
		                   	<select name="stay_room_single_bed">
		                   		<option value="Y">Y</option>
		                   		<option value="N">N</option>
		                   	</select>
		                    <span>더블 베드 침대</span>
		                    <select name="stay_room_double_bed">
		                   		<option value="Y">Y</option>
		                   		<option value="N">N</option>
		                   	</select>
		                    <span>퀸 베드 침대</span>
		                    <select name="stay_room_queen_bed">
		                   		<option value="Y">Y</option>
		                   		<option value="N">N</option>
		                   	</select>
		            </div> <br>
		            <span>객실 편의시설</span>
		            <div id="stay_room_facility">
		                <input type="checkbox" value="1" name="stay_room_facility"> 노트북 작업공간
		                <input type="checkbox" value="2" name="stay_room_facility"> 웰컴 드링크
		                <input type="checkbox" value="3" name="stay_room_facility"> 어매니티 <br>
		                <input type="checkbox" value="4" name="stay_room_facility"> 넷플릭스
		                <input type="checkbox" value="5" name="stay_room_facility"> 조식 포함
		                <input type="checkbox" value="6" name="stay_room_facility"> 무료 와이파이
		            </div>
		        </div>
	      
	        <input type="submit" class="btn" value="등록하기">
	        <input type="button" class="btn" value="취소">

	
</body>
</html>