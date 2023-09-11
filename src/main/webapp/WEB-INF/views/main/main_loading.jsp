<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>


	<!-- 남기문 / 절대로 변경, 삭제하면 안되는 소스 !!!! -->

	<!-- 메세지 -->
	
	<c:if test="${not empty msg}">
			
		<script>
			alert("${msg}");
			location.replace("/travel/main");
		</script>
		
	</c:if>
	
</body>
</html>