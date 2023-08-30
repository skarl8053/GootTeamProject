<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
	<%-- <title>
		<tiles:insertAttribute name="title"/>
	</title> --%>
	
	<!-- webapp 폴더 -> resource 폴더 -> layout 폴더 -> tile_css 폴더 -> subpagestyle.css 파일 참조 -->
	<link rel="stylesheet" href="resources/layout/tile_css/subpagestyle.css" />
	
</head>
<body>

		<div id="container">
				<tiles:insertAttribute name="header"/>
		</div>
		<%-- <div id="sidebar-left">
				<tiles:insertAttribute name="side"/>
		</div> --%>
		<div id="content">
					<tiles:insertAttribute name="content"/>
		</div>
		<div id="footer">
				<tiles:insertAttribute name="footer"/>
		</div>
	
</body>
</html>