<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				<div class="id">
					<div class="find_id">
						<div id="id_phone_box">
						<form action="find_email" method="post">
							<div id="id_phone_box_text">
								이름 <br><input type="text" name="m_name" id="m_name" required> <br><br>
								핸드폰 번호 <br><input type="text" name="m_tel" id="m_tel" oninput="inputNumberOnly(this)" maxlength="11" required>
								<input type="submit" value="인증" id="check">
							</div>
						</form>
						</div>
					</div>
				</div>
				<div class="pw">
					<div class="find_pw">
						<div id="pw_phone_box">
						<form action="find_pw">
							<div id="pw_phone_box_text">
								이름 <br><input type="text" name="m_name" required> <br><br>
								핸드폰 번호 <br><input type="text" name="m_tel" oninput="inputNumberOnly(this)" maxlength="11" required><br /><br />
								이메일 <br><input type="text" name="m_email" required> 
								<input type="submit" value="인증" id="check">
							</div>
						</form>
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
<!-- 메세지 -->
	<c:if test="${not empty msg}">
			
		<script>
			alert("${msg}");
		</script>
		
	</c:if>
	<script src="${pageContext.request.contextPath }/resources/js/user/find_user.js"></script>

</html>