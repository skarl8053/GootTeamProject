<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>�α��� ȭ��</title>
	<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/login_user.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
</head>
<body>
	
	
	
	<div class="login-wrapper">
		<p class="login">�α���</p>
		<hr/> <br>
		<form action="logining" id="login-form">
<<<<<<< HEAD
			<input type="email" name="m_email" id="m_email" placeholder="Email">
			<input type="password" name="m_pw" id="m_pw" placeholder="Password">
=======
			<input type="email" name="m_email" id="m_email" placeholder="Email" autocomplete="off">
			<input type="password" name="m_pw" id="m_pw" placeholder="Password" autocomplete="off">
>>>>>>> b5b96998bbca96d31499d5b7b1283fc2589b187e
			<i class="fa-solid fa-eye fa-2xl"></i>
				<input type="submit" value="Login" class="login_btn">
		</form>
		<div class="btn">
				<a href="join" class="join">ȸ������</a>
		</div>
		<div class="forget-wrapper">
			<a href="find">���̵� ã��</a> / <a href="find">��й�ȣ ã��</a>
		</div>
		<div class="coupon-event">
			<span class="coupon-event">���� �����ϸ� </span><span class="coupon-event" id="coupon-event" style="color: red; font-weight: bold;"> 10000�� ���� </span><span class="coupon-event">��� ����!</span>
		</div>
	</div>
</body>
<!-- �޼��� -->
	<c:if test="${not empty msg}">
			
		<script>
			alert("${msg}");
		</script>
		
	</c:if>
<script>
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
</script>
</html>