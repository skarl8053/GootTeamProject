<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>�α��� ȭ��</title>
	<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
	<link rel="stylesheet" href="../../../resources/css/user/login_user.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
</head>
<body>
	
	<div class="login-wrapper">
		<p class="login">�α���</p>
		<hr/> <br>
		<form method="post" action="������url" id="login-form">
			<input type="email" name="id" id="id" placeholder="Email">
			<input type="password" name="pw" id="pw" placeholder="Password">
			<i class="fa-solid fa-eye fa-2xl"></i>
			<input type="submit" value="Login" class="btn">
			<input type="submit" value="ȸ������" class="btn">
		</form>
		<div class="forget-wrapper">
			<a href="#">���̵� ã��</a> / <a href="#">��й�ȣ ã��</a>
		</div>
		<div class="coupon-event">
			<span class="coupon-event">���� �����ϸ� </span><span class="coupon-event" style="color: red; font-weight: bold;"> 5% ���� </span><span class="coupon-event">��� ����!</span>
		</div>
	</div>
</body>
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