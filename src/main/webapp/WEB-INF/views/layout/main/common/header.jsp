<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/layout/main_css/header.css" /> --%>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/layout/main_js/header.js"></script>
</head>
<body>
	<!-- 
	
		관리자 헤더 타일 (2023. 09. 02) - 남기문 수정
	
	-->

    <style>
        
        /* @import url(https://fonts.googleapis.com/css?family=Roboto:400,700,500); */
        @font-face {
            font-family: 'GmarketSansMedium';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        /* 메인 스타일 */

        .container {
            padding: 15px 0;
            width: auto;
            height: 318px;
            font-family: 'GmarketSansMedium', sans-serif; 
            background: #011967; 
        }


        /* 상단바 네비게이션 스타일 */

        #header_img{
            width: 200px;
            height: 150px;
        }
        #navigation { 
            background: #011967; 
            height: 100px;
        }

        .buttonlist {
            font-size: 0;
            margin: 0;
            padding: 0;
            padding: 87px 0 0 0;        /* 지역, 테마, 더보기 버튼을 밑으로 내림 */
            
        }

        .menu-etc, .menu-bar {
            display: inline-block;
            position: relative;
        }

        .menu-etc a {
            display: block;
            font-size: 20px;
            padding: 15px 14px;
            color:rgb(235, 208, 28);
            text-decoration: none;
        }
        /* 오른쪽 로그인 스타일 */
        
        .menu-etc a:hover{
            color: lightblue;
        }
        
        .menu-bar a{
            display: block;
            font-size: 25px;
            padding: 20px 14px;
            margin: 0 0 0 60px;
            width: 280px;
            height: 60px;
            color: rgb(235, 208, 28);
            transition: 0.3s linear;
        }

        .menu-bar:hover { background: #011967; }

        .menu-bar ul {
            background-color: white;
            border-bottom: 5px solid #2ba0db;
            display: none;
            position: absolute;
            margin: 0 0 0 40px;
            width: 310px;
            
        }
        .menu-bar a{
            text-decoration: non;
        }

        .inner_button{
            margin: 10px 10px;
            width: 110px;
            height: 40px;
            font-size: 20px;
            font-weight: bold;
            background-color: white;
            color: #011967;
            border-style: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .inner_button:hover{
            background-color:#011967;
            color: rgb(235, 208, 28);
        }

    </style>

    <script>
	
		function siteLocation(move_site){
            location.replace(move_site);
        }
	
	</script>

    <header>
        <nav id="navigation">
            <div>
                <ul class="" style="float: right">
                    <li class="menu-etc" ><a class="login-menu" href="#">로그인</a></li>
                    <li class="menu-etc"><a class="login-menu" href="#">회원가입</a></li>
                </ul>
            </div>
        </nav>
        <div class="container" style="">
	        <div>
	        	<img id="header_img" src="resources/img/bottom_logo.png" alt="이미지 없음">
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
	                            <button class="inner_button" type="button" onclick="siteLocation('');">이벤트</button>
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