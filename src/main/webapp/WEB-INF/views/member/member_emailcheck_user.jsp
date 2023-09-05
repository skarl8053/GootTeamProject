<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>이메일 인증</title>
</head>

<body onload="closeWin('${msg}')">
	
	<script type="text/javascript">
			function closeWin(msg){
				alert(msg);
				self.close();
			}
	</script>
	
</body>
</html>