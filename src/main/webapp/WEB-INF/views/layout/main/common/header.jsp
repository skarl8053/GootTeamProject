<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/layout/main_css/header.css" />
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/layout/main_js/header.js"></script>
</head>
<body>
	<header>
		<div id="login">
			<a href="#">로그인</a> | <a href="#">회원가입</a>
		</div>
		<nav>
			<ul>
				<li id="region-list-title"><a href="#" class="aaa">지역</a> <!-- 여기에 지역 리스트가 들어감 - 영역1-->
				</li>
				<li id="theme-list-title"><a href="#" class="aaa">테마</a> <!-- 여기에 테마 리스트가 들어감 - 영역2-->
				</li>
				<li id="addition-list-title"><a href="#" class="aaa">더보기</a> <!-- 여기에 더보기 메뉴 리스트가 들어감 - 영역3-->
				</li>
			</ul>
		</nav>
	</header>
	<div class="clear"></div>
</body>
</html>