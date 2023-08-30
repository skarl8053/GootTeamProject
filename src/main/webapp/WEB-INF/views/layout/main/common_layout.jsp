<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="wrap">
		<tiles:insertAttribute name="header" />
		<hr />
		<tiles:insertAttribute name="body" />
		<hr />
		<tiles:insertAttribute name="footer" />
	</div>
</body>
</html>