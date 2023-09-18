<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<!-- 개별 화면 content 크기를 조절하는 방법 -->
	<style>
		#content{
			height: auto;
		}
		.title-left{
			margin: 150px 0 0 470px;
		}
	</style>
	<%-- <input type="hidden" name="event_no" value="<c:out value='${no}' />" /> --%>
	<script>
	    var imgData = '<c:out value="${img}" />';
	    var noData = '<c:out value="${no}" />';
	    
	    var not_login_img = '<c:out value="${not_login_img}" />';
	    var login_img = '<c:out value="${login_img}" />';
	    var login_s_no = '<c:out value="${login_s_no}" />';
	    var m_no = '<c:out value="${sessionScope.m_no}" />';
	 </script>
	    
	<%-- <link rel="stylesheet"
			href="${pageContext.request.contextPath}/resources/layout/main_css/search.css"> --%>
		<link rel="stylesheet" href="datepicker.css">
		<script src="${pageContext.request.contextPath}/resources/layout/main_js/search.js"></script>
		
		<!-- datepicker -->
		<script src="datepicker.js"></script>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<link rel="stylesheet" href="/resources/demos/style.css">
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath}/resources/layout/main_css/slide-css/slick.css" />
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath}/resources/layout/main_css/slide-css/slick-theme.css" />
		<link rel="stylesheet"
			href="${pageContext.request.contextPath}/resources/layout/main_css/slide-css/slick-main.css">
		<script src="${pageContext.request.contextPath}/resources/layout/main_js/slide-js/slick.js"></script>
		<script src="${pageContext.request.contextPath}/resources/layout/main_js/slide-js/slick-main.js"></script>
	
	<style>
		
		@font-face {
		    font-family: 'GmarketSansMedium';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
		
		*{
			font-family: 'GmarketSansMedium';
		}
		.title-left{
			text-align: left;
		}
		
		.date-guest-search {
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    text-align: center;
		}
		
		.search-box {
		    padding: 30px;
		    align-items: center;
		    margin-bottom: 20px;  
		    border-radius: 20px;
		    box-shadow: 0 10px 40px rgba(0, 0, 0, 0.1);
		    justify-content: space-around;
		    margin: 10px auto;
		    width: 800px; 
		}
		
		#datepicker1, #datepicker2{
			text-align: center;
			width: 200px;
		}
		
		/* button {
		    background-color: #007bff;
		    color: #fff;
		    border: none;
		    cursor: pointer;
		    padding: 10px 20px;
		} */
		/* 드롭다운 버튼 스타일 */
		.dropdown-btn {
		    /* background-color: #fff; */
		    color: black;
		    background-color: #fff;
		    border: 1px solid grey;
		    cursor: pointer;
		    border-radius: 10px;
		    font-size: 14px;
		    width: 120px;
		    height: 40px;
		    text-align: center;
		}
		
		/* 드롭다운 콘텐츠 스타일 - 기본적으로 숨김 */
		.dropdown-content {
		    display: none;
		    position: absolute;
		    background-color: #f9f9f9;
		    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
		    z-index: 1;
		}
		
		/* 드롭다운 콘텐츠 내의 링크 스타일 */
		.dropdown-content a {
		    display: block;
		    padding: 10px;
		    text-decoration: none;
		    color: #333;   
		}
		
		/* 드롭다운 콘텐츠에 마우스를 올렸을 때 스타일 */
		.dropdown-content a:hover {
		    background-color: #f9f9f9;  
		}
		
		/* 드롭다운 콘텐츠 표시 - 버튼에 마우스를 올렸을 때 */
		.dropdown:hover .dropdown-content {
		    display: block;
		    display: flex;
		    flex-direction: column;
		    align-items: flex-start;
		}
		
		.search_button {
		    border-radius: 10px;
		    padding: 0 30px;
		    font-size: 14px;
		    width: 120px;
		    height: 40px;
		    cursor: pointer;
		    background-color:  #011343;
		    color: #EBD01C;
		}
		
		.search-box #search_field {
			display: flex;
		    margin: 5px auto;
		}
		
		.search-box input[type="text"]{
		    /* width: 200px; */
		    border-style: none;
		    text-align: left;
		    font-size: 18px;
		}
		
		.search-box input[type="text"],
		.search-box input[type="date"],
		.search-box select {
		    margin: 5px;
		    padding: 10px;
		    /* display: flex; */
		}
		
		.person {
		    margin: 5px;
		}
		
		.search-box input[type="date"],
		.search-box .person {
		    /* flex-wrap: wrap; */
		}
		
		
		.dropdown-content button {
		    padding: 10px;
		    align-items: center;
		    align-items: flex-end;
		}
		
		.person {
		    margin: 5px;
		    display: flex;
		    align-items: center;
		    justify-content: space-between; /* 왼쪽과 오른쪽 끝으로 정렬 */
		}
		
		.person .count {
		    margin: 0 5px;
		}
	
		.select-wrapper{
		
			width: 740px;
			display: flex;
		    justify-content: center;
		    align-items: center;
		    text-align: center;
		}
		.btn1{
			width: 100px;
			height: 30px;
			margin-top: 10px;
			margin-bottom: 10px;
			margin-right: 10px;
			font-size: 20px;
			background-color: white;
			color: rgb(1, 19, 67);
			border: none;
			padding-top: 3px;
			cursor: pointer;
			text-align: center;
		}
		
		.btn1:hover{
			height: 30px;
			color: rgb(235, 208, 28);
			background-color: rgb(1, 19, 67);
			border-radius: 5px;
		}
		
		.btn1:active{
			height: 30px;
			color: rgb(235, 208, 28);
			background-color: rgb(1, 19, 67);
			border-radius: 5px;
			box-shadow: 0px 0px 10px #000;
		}
		.clicked_btn1, .clicked_btn2 {
			height: 30px;
			color: rgb(235, 208, 28);
			background-color: rgb(1, 19, 67);
			border-radius: 5px;
		}
	</style>
	
	
</head>

<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">

	<!-- 남기문 - 숙소 디자인 전체적으로 수정 -->
	<!-- 신재환 - 이벤트 및 숙소 슬라이드 디자인 / 링크 적용 -->

	<!-- 메세지 -->
	<c:if test="${not empty msg}">
			
		<script>
			alert("${msg}");
			location.replace("main");
		</script>
		
	</c:if>
	
	<script>
	
		// 남기문 / 뒤로가기 막기
		window.history.forward();
		
		function noBack(){
			window.history.forward();
		}
	
		// 남기문 ( 숙소 선택시 지역 선택할 수 있도록 변경)
		
		///////////////////////////////////////////////////////////////////////////////////////
		// 처음화면 - 숙소검색 - 선택한 지역 value 값을 가져옴..
		var locationNumber = new Array();

		$(document).ready(
			function() {
				
				// 테마
				$('.btn1').each(function(index) {
					$(this).attr('btn1-index', index);
				}).click(
						function() {
							var index = $(this).attr('btn1-index');
							
							// 해당 테마 버튼의 value값 (숫자 가져옴)
							var selectedButtonValue = $('.btn1[btn1-index=' + index + ']').attr('value');
							
							if(selectedButtonValue != locationNumber[0]){
								locationNumber = new Array();
								locationNumber.push(selectedButtonValue);
							}
							else{
								locationNumber = new Array();
								locationNumber.push(-1);
							}
							
							// 버튼 상태 변경 (버튼 토글)
							$('.btn1[btn1-index=' + index + ']').toggleClass('clicked_btn1');
							$('.btn1[btn1-index!=' + index + ']').removeClass('clicked_btn1');
							
							console.log("locationNumber : " + locationNumber);
						});
			});
		
		//	웹 페이지가 완전히 로드된 후에 다음 작업을 수행
		$(function() {
			
		
			$('#datepicker1').datepicker({
	            dateFormat: "yy-mm-dd",                     					// 날짜의 형식
	            changeMonth: true,                          					// 월을 이동하기 위한 선택상자 표시여부
	            minDate: 1,                           						// 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
	            onClose: function( selectedDate ) { 
	            	
	                // 시작일(fromDate) datepicker가 닫힐때
	                // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
	                $("#datepicker2").datepicker( "option", "minDate", selectedDate );
	                
	            }
			});
			
	        $('#datepicker2').datepicker({
	            dateFormat: "yy-mm-dd",
	            changeMonth: true,
	            minDate: 1, 
	            onClose: function( selectedDate ) {
	            	
	                // 종료일(toDate) datepicker가 닫힐때
	                // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
	                $("#datepicker1").datepicker( "option", "maxDate", selectedDate );
	                
	            }                
	        });
			
	        $.datepicker.setDefaults({
				dateFormat : 'yy-mm-dd',
				prevText : '이전 달',
				nextText : '다음 달',
				monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월',
						'10월', '11월', '12월' ],
				monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
						'9월', '10월', '11월', '12월' ],
				dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
				dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
				dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
				showMonthAfterYear : true,
				yearSuffix : '년'
			});
			
			
			// 조회기간
			$("#datepicker1,#datepicker2").datepicker();
		});
		
		function searchStay(m_no){
			
			// 메인에서 지역, 체크인, 체크아웃, 인원수 입력 후 검색 버튼 누르면 실행
			
			var checkInDate = document.getElementById("datepicker1").value;
			var checkOutDate = document.getElementById("datepicker2").value;
			
			// 인원수
	        var personCount = document.getElementById("personCount").innerHTML;
			
			if(locationNumber.length < 1 || locationNumber[0] == -1){
				alert("검색할 지역을 선택해주세요");
				return false;
			}
			
			if(checkInDate.length < 1){
				alert("체크인 일자를 선택해주세요");
				return false;
			}
			
			if(checkOutDate.length < 1){
				alert("체크아웃 일자를 선택해주세요");
				return false;
			}
			
			if(checkInDate == checkOutDate){
				alert("체크인 / 체크아웃 날짜가 동일할 수 없습니다.");
				return false;
			}
			
			// 숙소 페이지로 이동(입력할 것!!)
			// http://localhost:9005/travel/user/stay_list_user?m_no=1&s_loca=3&checkInDate=2023-09-11&checkOutDate=2023-10-11&personCount=2
					
			var searchURL = "user/stay_list_user" +
									        "?m_no=" + m_no +
									        "&s_loca=" +locationNumber[0] +
									        "&checkInDate=" + checkInDate +
									        "&checkOutDate=" + checkOutDate +
									        "&personCount=" + personCount;
			
			/* alert(searchURL); */
			location.replace(searchURL);
		}
	
		///////////////////////////////////////////////////////////////////////////////////////
		
		function loginservice() {
			alert("로그인이 필요한 서비스입니다.")
		}
	</script>
	
	<!-- 숙소 검색 -->
	<h2>숙소 검색</h2>
	<div class="search-box">
		<!-- <input type="text" id="search_field" style="width: 740px;"
			placeholder="여행지를 검색하세요."> -->
		<div class="select-wrapper">
			<table class="select">
				<tr>
					<td>
						<button type="button" class="btn1" name="tema" value="1">서울</button>
						<button type="button" class="btn1" name="tema" value="2" >경기</button>
						<button type="button" class="btn1" name="tema" value="3">인천</button>
						<button type="button" class="btn1" name="tema" value="4">제주</button>
					</td>
				</tr>
				<tr>
					<td>
						<button type="button" class="btn1" name="tema" value="5">전라</button>
						<button type="button" class="btn1" name="tema" value="6">경상</button>
						<button type="button" class="btn1" name="tema" value="7">충청</button>
						<button type="button" class="btn1" name="tema" value="8">강원</button>
					</td>
				</tr>
			</table>
		</div>
		<br /><br />
		<div class="date-guest-search">
			<div>
				<input type="text" id="datepicker1" placeholder="체크인" autocomplete="off">
				<span> ~ </span> 
				<input type="text" id="datepicker2" placeholder="체크아웃" autocomplete="off">
			</div>
			<div class="dropdown">
				<div>
					<span><button class="dropdown-btn">인원 수</button></span>
					<span><button class="search_button" onclick="return searchStay('${sessionScope.m_no}');">검색</button></span>
				</div>
				<div class="dropdown-content">
					<div class="person">
						<div class="button-container">
							<span>성인</span>
							<button class="decrement-btn">-</button>
							<span class="count" id="personCount">1</span>
							<button class="increment-btn">+</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 이벤트 슬라이드 -->
	<h2 class="title-left">이벤트</h2>
	<div class="event-slide">
		<div class="regular slider"></div>
	</div>
	
	<c:if test="${empty sessionScope.m_no}">
	
		<!-- 로그인이 안 됐을 때 최근 등록한 숙소 보여준다. -->
		<!-- 추천 숙소 슬라이드 -->
		<h2 class="title-left">최근 등록된 숙소</h2>
		<div class="hot-deal">
			<div class="stayinfo slider" onclick="loginservice();">
			</div>
		</div>
		<br />
		
	</c:if>
	
	<c:if test="${not empty sessionScope.m_no}">
		
		<!-- 회원가입 로그인이 완료된 경우 해당 사람의 테마, 선호지역 정보를 가져와 보여준다. -->
		<!-- 추천 숙소 슬라이드 -->
		<h2 class="title-left">${ sessionScope.m_name } 님에게 추천하는 숙소</h2>
		<div class="hot-deal">
			<div class="stayinfo slider2">
				<style>
					.slider2 {
						width:800px;
						height:500px;
					}
				</style>
			</div>
		</div>
		<br />
		
	</c:if>
	
	
	
</body>
</html>