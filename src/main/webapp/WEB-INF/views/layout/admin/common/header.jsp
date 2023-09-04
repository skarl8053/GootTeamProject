<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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

    <script>
	
		function siteLocation(move_site){
            location.replace(move_site);
        }
	
	</script>
	
	 <header>
        <nav id="navigation">
            <div class="container">
                <ul class="buttonlist">
                    <li class="menu-etc" id="logo_img"><a href="#"><img src="" alt="이미지 없음"></a></li>
                    <li class="menu-bar"><a href="#">회원 / 매출 관리 <i class='fa fa-angle-down'></i></a>
                        <ul>
                            <li>    
                                <button class="inner_button" type="button" onclick="siteLocation('');">구매 내역</button>
                                <button class="inner_button" type="button" onclick="siteLocation('refund');">환불 내역</button>
                            </li>
                            <li>    
                                <button class="inner_button" type="button" onclick="siteLocation('report');">신고 내역</button>
                                <button class="inner_button" type="button" onclick="siteLocation('point');">포인트 내역</button>
                            </li>
                            <li>    
                                <button class="inner_button" type="button" onclick="siteLocation('delivery');">배송 내역</button>
                                <button class="inner_button" style="visibility: hidden;" type="button" >준비중</button>
                            </li>
                            <li>    
                                <button class="inner_button" type="button" onclick="siteLocation('saleschart_year');">연 매출</button>
                                <button class="inner_button" type="button" onclick="siteLocation('saleschart_month');">월 매출</button>
                            </li>
                        </ul>
                    </li>
                    <li class="menu-bar"><a href="#">숙소 관리 <i class='fa fa-angle-down'></i></a>
                        <ul>
                            <li>    
                                <button class="inner_button" type="button" onclick="siteLocation('stay_list');">숙소 조회</button>
                                <button class="inner_button" type="button" onclick="siteLocation('stay');">숙소 등록</button>
                            	<button class="inner_button" type="button" onclick="siteLocation('stay_room');">객실 등록</button>
                            	<button class="inner_button" style="visibility: hidden;" type="button" >준비중</button>
                            </li>
                        </ul>
                    </li>
                    <li class="menu-bar"><a href="#">이벤트 / 쿠폰 관리 <i class='fa fa-angle-down'></i></a>
                        <ul>
                            <li>    
                                <button class="inner_button" type="button" onclick="siteLocation('event');">이벤트 관리</button>
                                <button class="inner_button" type="button" onclick="siteLocation('item');">경품 관리</button>
                            </li>
                            <li>    
                                <button class="inner_button" type="button" onclick="siteLocation('coupon');">쿠폰 관리</button>
                            	<button class="inner_button" style="visibility: hidden;" type="button" >준비중</button>
                            </li>
                        </ul>
                    </li>
                    <li class="menu-etc" ><a style="padding-left: 20px" href="#">로그인</a></li>
                    <li class="menu-etc"><a style="padding-left: 20px" href="#">회원가입</a></li>
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