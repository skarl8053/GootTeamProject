<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<link rel="stylesheet" href="resources/layout/tile_css/subheaderstyle.css" type="text/css"/>
	<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script src="resources/layout/tile_js/subheader_user.js"></script>
	
</head>
<body>
	
	 <header>
    <div id="login">
      <a href="#">로그인</a> | <a href="#">회원가입</a>
    </div>
    <nav>
      <a href=""><img id="mainlogo" src="resources/img/logo.png" alt="로고 이미지 없음"></a>
      <ul>
        <li id="region-list-title">    
            <a href="#" class="menubar">지역</a>
        </li>
        <li id="theme-list-title">
            <a href="#" class="menubar">테마</a>
        </li>
        <li id="addition-list-title">
          <a href="#" class="menubar">더보기</a>
        </li>
      </ul>
    </nav>
  </header>
  <div class="clear"></div>
  <div id="wrap"></div>
	
</body>
</html>