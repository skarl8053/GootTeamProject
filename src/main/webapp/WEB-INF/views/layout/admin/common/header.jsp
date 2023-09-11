<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<link rel="stylesheet" href="resources/layout/tile_css/subheaderstyle_admin.css" />
	<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.6.2/css/font-awesome.min.css">
	<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    
</head>
<body>
	
	<!-- 
	
		관리자 헤더 타일 (2023. 09. 02) - 남기문 수정
	
	-->

	<!-- 로그인 관련 내용 -->
	<c:if test="${empty sessionScope.m_no}">
			
		<script>
			alert("관리자로 로그인 후 이용할 수 있습니다.");
			location.replace("/travel/member/login");
		</script>
		
	</c:if>
	
	<c:if test="${not empty sessionScope.m_no}">
			
			<!-- 관리자 화면을 사용자 권한으로 로그인한 경우 -->
			<c:if test="${sessionScope.m_sec eq 2}">
				<script>
					alert("해당 기능은 관리자로 로그인 후 이용할 수 있습니다.");
					location.replace("/travel/member/logout");
				</script>
			</c:if>
			
	</c:if>
	
	
	
    <script>
	
		function siteLocation(move_site){
            location.replace(move_site);
        }
		
		function logout(){
			
			var isConfirmed = confirm("로그아웃 하시겠습니까?");
			
			if(isConfirmed == false){
				return false;
			}
			else{
				location.replace("/travel/member/logout");
			}
			
		}
	</script>
	
	 <header>
        <nav id="navigation">
            <div class="container">
                <ul class="buttonlist">
                    <li id="logo_img" style="float: left"><a href="javascript:siteLocation('purchase');"><img id="sub_logo" src="resources/img/sub_logo.png" alt="이미지 없음"></a></li>
                    <li class="menu-bar"><a href="#">회원 / 매출 관리</a>
                        <ul>
                            <li>    
                                <button class="inner_button" type="button" onclick="siteLocation('purchase');">구매 내역</button>
                                <button class="inner_button" type="button" onclick="siteLocation('refund');">환불 내역</button>
                            </li>
                            <li>    
                                <button class="inner_button" type="button" onclick="siteLocation('report');">신고 내역</button>
                                <button class="inner_button" type="button" onclick="siteLocation('delivery');">배송 내역</button>
                            </li>
                            <li>    
                                <button class="inner_button" type="button" onclick="siteLocation('saleschart_year');">연 매출</button>
                                <button class="inner_button" type="button" onclick="siteLocation('saleschart_month');">월 매출</button>
                            </li>
                        </ul>
                    </li>
                    <li class="menu-bar"><a href="#">숙소 관리</a>
                        <ul>
                            <li>    
                            	<button class="inner_button" type="button" onclick="siteLocation('stay');">숙소 등록</button>
                            	<button class="inner_button" type="button" onclick="siteLocation('stay_room');">객실 등록</button>
                                <button class="inner_button" type="button" onclick="siteLocation('stay_list?page=1');">숙소 조회</button>
                            	<button class="inner_button" style="visibility: hidden;" type="button" >준비중</button>
                            </li>
                        </ul>
                    </li>
                    <li class="menu-bar"><a href="#">이벤트 / 쿠폰 관리</a>
                        <ul>
                            <li>    
                                <button class="inner_button" type="button" onclick="siteLocation('event?page=1');">이벤트 관리</button>
                                <button class="inner_button" type="button" onclick="siteLocation('item?page=1');">경품 관리</button>
                            </li>
                            <li>    
                                <button class="inner_button" type="button" onclick="siteLocation('coupon?page=1');">쿠폰 관리</button>
                            	<button class="inner_button" style="visibility: hidden;" type="button" >준비중</button>
                            </li>
                        </ul>
                    </li>
                    <c:if test="${not empty sessionScope.m_no}">
                    	<li class="menu-etc"><a style="padding-left: 20px" href="javascript:logout();">로그아웃</a></li>
                    </c:if>
                    <%-- <c:if test="${empty sessionScope.m_no}">
                    	<li class="menu-etc" ><a style="padding-left: 20px" href="#">로그인</a></li>
                    	<li class="menu-etc"><a style="padding-left: 20px" href="#">회원가입</a></li>
                    </c:if> --%>
                </ul>
            </div>
        </nav>
    </header>

    <!-- script 위치 고정할 것 (위치 변동시 에러 발생) -->
    <script>
        $('nav li').hover(
            function() {
                $('ul', this).stop().slideDown(200);
            },
            function() {
                $('ul', this).stop().slideUp(200);
            }
        );
    </script>
	
</body>
</html>