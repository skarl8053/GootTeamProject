<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<!-- <link rel="stylesheet" href="resources/layout/tile_css/subheaderstyle.css" type="text/css"/> -->
	<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.6.2/css/font-awesome.min.css">
	<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
		
</head>
<body>
	
	 <!-- 
	
		관리자 헤더 타일 (2023. 09. 02) - 남기문 수정
	
	-->

	<style>
	
		
		/* 
			제작 : 남기문 
		    일자 : 2023. 09. 02
		*/
		
		@font-face {
		    font-family: 'GmarketSansMedium';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
		
		/* 메인 스타일 */
		
		/* html { box-sizing: border-box; } */
		
		/* *, *:before, *:after { box-sizing: inherit; } */
		
		body {
		    background: white;
		    margin: 0;
		}
		
		.container {
		    padding: 15px 70px;
		    width: auto;
		    font-family: 'GmarketSansMedium', sans-serif; 
		}
		
		#sub_logo{
			width: 65px;
			height: 65px;
			/* 오른쪽으로 간격 */
			padding-right: 100px; 
		}
		
		/* 상단바 네비게이션 스타일 */
		
		#navigation { 
		    background: #14172C;
		    height: 85px;
		}
		
		#navigation ul {
		    font-size: 0;
		    margin: 0;
		    padding: 0;
		}
		
		#navigation ul li {
		    display: inline-block;
		    position: relative;
		}
		
		.menu-etc a {
		    display: block;
		    font-size: 20px;
		    padding: 15px 5px;
		    color:rgb(235, 208, 28);
		    width: auto;
		    text-decoration: none;
		}
		/* 오른쪽 로그인 스타일 */
		
		.menu-etc a:hover{
		    color: lightblue;
		}
		
		.menu-bar a{
		    display: block;
		    font-size: 25px;
		    padding: 15px 0px;
		    margin-right: 50px;
		    width: 300px;
		    height: 40px;
		    color: rgb(235, 208, 28);
		    transition: 0.3s linear;
		    text-decoration: none;
		}
		
		/* max-width: 1700px  */
		
		@media (min-width: 1400px) and (max-width: 1700px){
		
			.menu-bar a{
			    display: block;
			    font-size: 25px;
			    padding: 15px 0px;
			    margin-right: 50px;
			    width: 200px;
			    height: 40px;
			    color: rgb(235, 208, 28);
			    transition: 0.3s linear;
			    text-decoration: none;
			}
		} 
		
		@media (min-width: 1000px) and (max-width: 1400px){
		
			.menu-bar a{
			    display: block;
			    font-size: 25px;
			    padding: 15px 0px;
			    margin-right: 50px;
			    width: 100px;
			    height: 40px;
			    color: rgb(235, 208, 28);
			    transition: 0.3s linear;
			    text-decoration: none;
			}
		} 
		
		@media (min-width: 800px) and (max-width: 1000px){
		
			.menu-bar a{
			    display: block;
			    font-size: 25px;
			    padding: 15px 0px;
			    margin-right: 50px;
			    width: 80px;
			    height: 40px;
			    color: rgb(235, 208, 28);
			    transition: 0.3s linear;
			    text-decoration: none;
			}
		} 
		
		
		.menu-bar:hover { background-color: #14172C;}
		
		.menu-bar ul {
		    background-color: white;
		    border-bottom: 5px solid #011343;
		    display: none;
		    position: absolute;
		    width: 300px;
		}
		
		.inner_button{
		    margin: 10px 15px;
		    width: 120px;
		    height: 40px;
		    font-size: 20px;
		    font-weight: bold;
		    background-color: white;
		    color: #011343;
		    border-style: none;
		    border-radius: 5px;
		    cursor: pointer;
		}
		
		.inner_button:hover{
		    background-color:#011343;
		    color: rgb(235, 208, 28);
		}
		
		.jbFixed {
		   position: fixed;
		   top: 0px;
		}
	
	</style>

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


	<!-- 로그인 관련 내용 -->
	<c:if test="${empty sessionScope.m_no}">
			
		<script>
			alert("로그인 후 이용할 수 있습니다.");
			location.replace("/travel/member/login");
		</script>
		
	</c:if>
	<c:if test="${not empty sessionScope.m_no}">
			
			<!-- 사용자 화면을 관리자 권한으로 로그인한 경우 -->
			<c:if test="${sessionScope.m_sec eq 1}">
				<script>
					alert("해당 기능은 사용자로 로그인 후 이용할 수 있습니다.");
					location.replace("/travel/member/logout");
				</script>
			</c:if>
			
	</c:if>
	

    <header>
        <nav id="navigation">
            <div class="container">
                <ul class="buttonlist">
                	<li id="logo_img" style="float: left"><a href="/travel/main"><img id="sub_logo" src="resources/img/sub_logo.png" alt="이미지 없음"></a></li>
                    <li class="menu-bar"><a href="#">지역</a>
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
                    <li class="menu-bar"><a href="#">테마</a>
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
                    <li class="menu-bar"><a href="#">더보기</a>
                        <ul>
                            <li>    
                                <button class="inner_button" type="button" onclick="siteLocation('');">이벤트</button>
                                <button class="inner_button" style="visibility: hidden;" type="button" >준비중</button>
                            </li>
                        </ul>
                    </li>
                    <c:if test="${not empty sessionScope.m_no}">
                    	<li class="menu-etc"><a style="padding-left: 20px" href="cart?m_no=${sessionScope.m_no}">장바구니</a></li>
                    	<li class="menu-etc"><a style="padding-left: 20px" href="mypage_info?m_no=${sessionScope.m_no}">마이페이지</a></li>
                    	<li class="menu-etc"><a style="padding-left: 20px" href="javascript:logout();">로그아웃</a></li>
                    </c:if>
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