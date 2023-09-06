<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인 화면</title>
	<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/login_user.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
</head>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
	
	<!-- 메세지 -->
	<c:if test="${msg != ''}">
			
		<script>
			alert("${msg}");
			location.replace("login");
		</script>
		
	</c:if>
	
	<script>
	
			window.history.forward();
			
			function noBack(){
				window.history.forward();
			}
	
			$(document).ready(function(){
			    $('.login-wrapper i').on('click',function(){
			        $('input').toggleClass('active');
			        if($('input').hasClass('active')){
			            $(this).attr('class',"fa-solid fa-eye-slash fa-2xl")
			            .prev('input').attr('type',"text");
			        }else{
			            $(this).attr('class',"fa-solid fa-eye fa-2xl")
			            .prev('input').attr('type','password');
			        }
			    });
			});
			
			function loginCheck(){
				
				var m_email = document.getElementById("m_email").value;
				var m_pw = document.getElementById("m_pw").value;
				
				if(m_email.length < 1){
					alert("이메일을 입력해주세요");
					return false;
				}
				
				if(m_pw.length < 1){
					alert("비밀번호를 입력해주세요");
					return false;
				}
				
			}
			
	</script>
	
	
	
	<div class="login-wrapper">
		<p class="login">로그인</p>
		<hr/> <br>
		<form action="logining" onsubmit="return loginCheck()" id="login-form">
			<input type="email" name="m_email" id="m_email" placeholder="Email" autocomplete="off">
			<input type="password" name="m_pw" id="m_pw" placeholder="Password" autocomplete="off">
			<i class="fa-solid fa-eye fa-2xl"></i>
				<input type="submit" value="Login" class="login_btn">
		</form>
		<div class="btn">
				<a href="join" class="join">회원가입</a>
		</div>
		<div class="forget-wrapper">
			<a href="/travel/main" style="color: red;">메인으로 이동</a> / <a href="find">이메일 찾기</a> / <a href="find">비밀번호 찾기</a>
		</div>
		<div class="coupon-event">
			<span class="coupon-event">지금 가입하면 </span><span class="coupon-event" id="coupon-event" style="color: red; font-weight: bold;"> 10000원 쿠폰 </span><span class="coupon-event">즉시 지급!</span>
		</div>
	</div>
	
	
</body>
</html>