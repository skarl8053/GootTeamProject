<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>아이디/비밀번호 찾기</title>
</head>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/find_user.css" />


<body>
	<div class="box">
		<!--div를 두개 감싼이유는 img들을 좌우배치하고 배치된 사진중 한장만 보이게 하기 위해서이다.-->
		<div class="button_box">
			<button class="bt_find_id">아이디 찾기</button>
			<button class="bt_find_pw">비밀번호 찾기</button>
			
		</div>
		<div class="slide"> <!--배치된 img들을 하나의 img만 보이게 가리기 위한 태그-->
			<div class="images"> <!--img들을 좌우배치할 태그-->
				<div class="id1">
					<div class="find_id">
						<label class="id_phone" for="id_phone">핸드폰 인증</label>
						<label class="id_email" for="id_email">이메일 인증</label>
						<input id="id_phone" type="checkbox">
						<input id="id_email" type="checkbox">
						<div id="id_phone_box">
							<div id="id_phone_box_text">
								이름 <br><input type="text"> <br><br>
								핸드폰 번호 <br><input type="text">
								<input type="submit" value="인증" id="check">
							</div>
						</div>
						<div id="id_email_box">
							<div id="id_email_box_text">
								이름 <br><input type="text"> <br><br>
								이메일 <br><input type="text">
								<input type="submit" value="인증" id="check">
							</div>
						</div>
					</div>
				</div>
				<div class="pw1">
					<div class="find_pw">
						<label class="pw_phone" for="pw_phone">핸드폰 인증</label>
						<label class="pw_email" for="pw_email">이메일 인증</label>
						<input id="pw_phone" type="checkbox">
						<input id="pw_email" type="checkbox">
						<div id="pw_phone_box">
							<div id="pw_phone_box_text">
								이메일 <br><input type="text"> <br><br>
								핸드폰 번호 <br><input type="text">
								<input type="submit" value="인증" id="check">
							</div>
						</div>
						<div id="pw_email_box">
							<div id="pw_email_box_text">
								이름 <br><input type="text"> <br><br>
								이메일 <br><input type="text">
								<input type="submit" value="인증" id="check">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="under">
		<br>
			<a href="login">로그인</a> / <a href="join">회원가입</a> / <a href="${pageContext.request.contextPath }/main">메인 페이지</a>
	</div>

</body>
	<script src="${pageContext.request.contextPath }/resources/js/user/find_user.js"></script>

</html>