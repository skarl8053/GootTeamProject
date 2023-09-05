<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/layout/main_css/search.css">
	<link rel="stylesheet" href="datepicker.css">
	<script src="${pageContext.request.contextPath}/resources/layout/main_js/search.js"></script>
	<!-- datepicker -->
	<script src="datepicker.js"></script>
	<link rel="stylesheet"
		href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
	<script>
		$.datepicker.setDefaults({
			dateFormat : 'yy년 mm월 dd일',
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
	
		//	웹 페이지가 완전히 로드된 후에 다음 작업을 수행
		$(function() {
			$("#datepicker1").datepicker();
			// 조회기간
			$("#datepicker1,#datepicker2").datepicker();
		});
	</script>
</head>
<%
	if (session.getAttribute("m_email") == null) { // 로그인이 안된 상태
		System.out.println("널 값???");
	}else{
		System.out.println("로그인 된건가?");
	}
%>
<body>

	<!-- 메세지 -->
	<c:if test="${not empty loginmsg}">
			
		<script>
			alert("${loginmsg}");
			location.replace("login");
		</script>
		
	</c:if>
	
	<!-- 메세지 -->
	<c:if test="${not empty msg}">
			
		<script>
			alert("${msg}");
		</script>
		
	</c:if>
	
	<!-- 숙소 검색 -->
	<h2>숙소 검색</h2>
	<div class="search-box">
		<input type="text" id="search_field" style="width: 740px;"
			placeholder="여행지를 검색하세요.">
		<div class="date-guest-search">
			<input type="text" id="datepicker1" placeholder="체크인"> <input
				type="text" id="datepicker2" placeholder="체크아웃">
			<div class="dropdown">
				<button class="dropdown-btn">인원 수</button>
				<button class="search_button">검색</button>
				<div class="dropdown-content">
					<div class="person">
						<div class="button-container">
							<span>성인</span>
							<button class="decrement-btn">-</button>
							<span class="count">0</span>
							<button class="increment-btn">+</button>
						</div>
					</div>
					<div class="person">
						<div class="button-container">
							<span>어린이</span>
							<button class="decrement-btn">-</button>
							<span class="count">0</span>
						</div>
						<button class="increment-btn">+</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br />
	<!-- 이벤트 슬라이드 -->
	<h2 class="title-left">이벤트</h2>
	<div class="event-slide">
		<div class="regular slider"></div>
	</div>
	<br />
	<!-- 핫딜 슬라이드 -->
	<h2 class="title-left">할인중인 숙소</h2>
	<div class="hot-deal">
		<div class="hdeal slider"></div>
	</div>
	<br />
	
</body>
</html>