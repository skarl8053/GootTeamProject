<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/layout/main_css/header.css" />
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/layout/main_js/header.js"></script>
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
            <div>
                <ul class="" style="float: right">
                    <li class="menu-etc" ><a class="login-menu" href="member/login">로그인</a></li>
                    <li class="menu-etc"><a class="login-menu" href="member/join">회원가입</a></li>
                </ul>
            </div>
        </nav>
        <div class="container" style="">
	        <div>
	        	<img id="header_img" src="resources/img/main_logo.png" alt="이미지 없음">
	        </div>
            <div>
	            <ul class="buttonlist">
	                <li class="menu-bar"><a href="#">지역<i class='fa fa-angle-down'></i></a>
	                    <ul>
	                        <li>    
	                            <button class="inner_button" type="button" onclick="siteLocation('');">서울</button>
	                            <button class="inner_button" type="button" onclick="siteLocation('');">경기</button>
	                        </li>
	                        <li>    
	                            <button class="inner_button" type="button" onclick="siteLocation('');">인천</button>
	                            <button class="inner_button" type="button" onclick="siteLocation('');">제주</button>
	                        </li>
	                        <li>    
	                            <button class="inner_button" type="button" onclick="siteLocation('');">전라</button>
	                            <button class="inner_button" type="button" onclick="siteLocation('');">경상</button>
	                        </li>
	                        <li>    
	                            <button class="inner_button" type="button" onclick="siteLocation('');">충청</button>
	                            <button class="inner_button" type="button" onclick="siteLocation('');">강원</button>
	                        </li>
	                    </ul>
	                </li>
	                <li class="menu-bar"><a href="#">테마<i class='fa fa-angle-down'></i></a>
	                    <ul>
	                        <li>    
	                            <button class="inner_button" type="button" onclick="siteLocation('');">등산</button>
	                            <button class="inner_button" type="button" onclick="siteLocation('');">바다</button>
	                        </li>
	                        <li>    
	                            <button class="inner_button" type="button" onclick="siteLocation('');">도시</button>
	                            <button class="inner_button" type="button" onclick="siteLocation('');">계곡</button>
	                        </li>
	                        <li>    
	                            <button class="inner_button" type="button" onclick="siteLocation('');">레저</button>
	                            <button class="inner_button" type="button" onclick="siteLocation('');">문화</button>
	                        </li>
	                        <li>    
	                            <button class="inner_button" type="button" onclick="siteLocation('');">맛집</button>
	                            <button class="inner_button" type="button" onclick="siteLocation('');">파티</button>
	                        </li>
	                    </ul>
	                </li>
	                <li class="menu-bar"><a href="#">더보기<i class='fa fa-angle-down'></i></a>
	                    <ul>
	                        <li>    
	                            <button class="inner_button" type="button" onclick="siteLocation('');">이벤트</button>
	                            <button class="inner_button" style="visibility: hidden;" type="button" >준비중</button>
	                        </li>
	                    </ul>
	                </li>
	             </ul>
             </div>
        </div>
    </header>

    <!-- script 위치 고정할 것 (위치 변동시 에러 발생) -->
    <script>
        $('.buttonlist li').hover(
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