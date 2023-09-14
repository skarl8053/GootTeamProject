<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	
		function logout(){
			
			var isConfirmed = confirm("로그아웃 하시겠습니까?");
			
			if(isConfirmed == false){
				return false;
			}
			else{
				location.replace("member/logout");
			}
		}
		
	</script>

    <header>
        <nav id="navigation">
            <div>
            	<c:if test="${ empty sessionScope.m_email }">
            		<ul class="" style="float: right">
	                    <li class="menu-etc" ><a class="login-menu" href="member/login">로그인</a></li>
	                    <li class="menu-etc"><a class="login-menu" href="member/join">회원가입</a></li>
	                </ul>
            	</c:if>
            	<c:if test="${ not empty sessionScope.m_email }">
            		 <ul class="" style="float: right">
            		 	<li class="menu-etc" ><a href="user/pushalpayment?m_no=${sessionScope.m_no}&page=1">알림</a></li>
            		 	<li class="menu-etc" ><a href="user/cart?m_no=${sessionScope.m_no}">장바구니</a></li>
            		 	<li class="menu-etc" ><a href="user/mypage_info?m_no=${sessionScope.m_no}">마이페이지</a></li>
	                    <li class="menu-etc" ><a href="javascript:logout();">로그아웃</a></li>
	                </ul>
            	</c:if>
            </div>
        </nav>
        <div class="container">
	        <div style="clear: both">
	        	<img id="header_img" src="resources/img/main_logo.png" alt="이미지 없음">
	        </div>
            <div>
	            <ul class="buttonlist">
	                <li class="menu-bar"><a href="#">지역</a>
	                    <ul>
	                        <li>    
	                            <button class="inner_button" type="button" onclick="siteLocation('user/stay_list_user?m_no=${sessionScope.m_no}&s_loca=1');">서울</button>
	                            <button class="inner_button" type="button" onclick="siteLocation('user/stay_list_user?m_no=${sessionScope.m_no}&s_loca=2');">경기</button>
	                        </li>
	                        <li>    
	                            <button class="inner_button" type="button" onclick="siteLocation('user/stay_list_user?m_no=${sessionScope.m_no}&s_loca=3');">인천</button>
	                            <button class="inner_button" type="button" onclick="siteLocation('user/stay_list_user?m_no=${sessionScope.m_no}&s_loca=4');">제주</button>
	                        </li>
	                        <li>    
	                            <button class="inner_button" type="button" onclick="siteLocation('user/stay_list_user?m_no=${sessionScope.m_no}&s_loca=5');">전라</button>
	                            <button class="inner_button" type="button" onclick="siteLocation('user/stay_list_user?m_no=${sessionScope.m_no}&s_loca=6');">경상</button>
	                        </li>
	                        <li>    
	                            <button class="inner_button" type="button" onclick="siteLocation('user/stay_list_user?m_no=${sessionScope.m_no}&s_loca=7');">충청</button>
	                            <button class="inner_button" type="button" onclick="siteLocation('user/stay_list_user?m_no=${sessionScope.m_no}&s_loca=8');">강원</button>
	                        </li>
	                    </ul>
	                </li>
	                <li class="menu-bar"><a href="#">테마</a>
	                    <ul>
	                        <li>    
	                            <button class="inner_button" type="button" onclick="siteLocation('user/stay_list_search_user?m_no=${sessionScope.m_no}&theme=등산');">등산</button>
	                            <button class="inner_button" type="button" onclick="siteLocation('user/stay_list_search_user?m_no=${sessionScope.m_no}&theme=바다');">바다</button>
	                        </li>
	                        <li>    
	                            <button class="inner_button" type="button" onclick="siteLocation('user/stay_list_search_user?m_no=${sessionScope.m_no}&theme=도시');">도시</button>
	                            <button class="inner_button" type="button" onclick="siteLocation('user/stay_list_search_user?m_no=${sessionScope.m_no}&theme=계곡');">계곡</button>
	                        </li>
	                        <li>    
	                            <button class="inner_button" type="button" onclick="siteLocation('user/stay_list_search_user?m_no=${sessionScope.m_no}&theme=레저');">레저</button>
	                            <button class="inner_button" type="button" onclick="siteLocation('user/stay_list_search_user?m_no=${sessionScope.m_no}&theme=문화');">문화</button>
	                        </li>
	                        <li>    
	                            <button class="inner_button" type="button" onclick="siteLocation('user/stay_list_search_user?m_no=${sessionScope.m_no}&theme=맛집');">맛집</button>
	                            <button class="inner_button" type="button" onclick="siteLocation('user/stay_list_search_user?m_no=${sessionScope.m_no}&theme=파티');">파티</button>
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