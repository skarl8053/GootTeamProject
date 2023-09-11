<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="resources/css/user/stay_detail_info_user.css">


</head>
<body>

	<div class="container">
		<div class="T1">
			<c:forEach items="${listS }" var="list1">
			<div class="links">
				<a href="stay_detail_user?s_no=${list1.s_no }">객실</a> <a href="#">숙소정보</a> <a href="review_list_user?s_no=${list1.s_no }">후기</a>
			</div>
			</c:forEach>
		</div>
		<div id="map"></div>


		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d948241e2d589435279f349c165e5c95"></script>




		<script>
			var jArray = new Array();
			jArray = '${arr }';
			/* 파싱 */
			jArray = JSON.parse(jArray);
			/* alert(jArray[0].mapY); */
			var mapX = parseFloat(jArray[0].mapX);
			var mapY = parseFloat(jArray[0].mapY);
			var pName = jArray[0].pName;
			/* alert(pName); */

			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(mapX, mapY), // 지도의 중심좌표 
				level : 4
			// 지도의 확대 레벨
			};

			var map = new kakao.maps.Map(mapContainer, mapOption);

			// 마커가 표시될 위치입니다 
			var markerPosition = new kakao.maps.LatLng(mapX, mapY);

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				position : markerPosition
			});

			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);

			/*  var iwContent = '<div style="padding:5px;"> ${pName} <br><a href="https://map.kakao.com/link/map/"pName",mapX, mapY" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/Hello World!,mapX, mapY" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			 iwPosition = new kakao.maps.LatLng(mapX, mapY); //인포윈도우 표시 위치입니다 */

			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
				position : iwPosition,
				content : iwContent
			});

			// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
			infowindow.open(map, marker);
		</script>


			<h1>${listS[0].s_name }</h1>
			
			<p>${listS[0].s_info }</p>
			
			<p id="cf">숙소 시설</p>
			<div class="icons">
			<c:if test="${listS[0].s_facility1  ne 0  }">
				<img src="resources/img/user/stayFacility/stayFacilityIcon${listS[0].s_facility1 }.png" alt="반려동물">
			</c:if> 
			<c:if test="${listS[0].s_facility2   ne 0 }">
				<img src="resources/img/user/stayFacility/stayFacilityIcon${listS[0].s_facility2 }.png" alt="레스토랑">
			</c:if> 
			<c:if test="${listS[0].s_facility3   ne 0 }">
				<img src="resources/img/user/stayFacility/stayFacilityIcon${listS[0].s_facility3 }.png" alt="주차시설">
			</c:if> 
			<c:if test="${listS[0].s_facility4   ne 0 }">
				<img src="resources/img/user/stayFacility/stayFacilityIcon${listS[0].s_facility4 }.png" alt="물품보관">
			</c:if> 
			<c:if test="${listS[0].s_facility5   ne 0 }">
				<img src="resources/img/user/stayFacility/stayFacilityIcon${listS[0].s_facility5 }.png" alt="수영장">
			</c:if> 
			<c:if test="${listS[0].s_facility6   ne 0 }">
				<img src="resources/img/user/stayFacility/stayFacilityIcon${listS[0].s_facility6 }.png" alt="흡연구역">
			</c:if> 
				
			</div>

	</div>
</body>
</html>