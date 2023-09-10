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
	<!-- <link rel="stylesheet" href="resources/layout/tile_css/subpagestyle.css" /> -->
	
</head>
<body>

		<style>
		
				#container{
							
				    width: 100%;
				    height: 100%;
				    margin: 0px auto;
				    text-align: center;
				    border: 0px solid #bcbcbc;
				    
				}
				 
				#header{
				    padding: 5px;
				    margin-bottom: 5px;
				    border: 0px solid #bcbcbc;
				}
				 
				#sidebar-left{
					
				    width: 15%;
				    height: 700px; /* 肄섑뀗痢� 湲몄씠 */
				    padding: 5px;
				    margin-right: 5px;
				    margin-bottom: 5px;
				    float: left;
				    background-color: white;
				    border: 0px solid #bcbcbc;
				    font-size: 10px;
				    
				}
				 
				#content{
					
					width: 1200px;
				    margin: 50px auto;
				    height: 5000px; /* 肄섑뀗痢� 湲몄씠 */
				    border: 0px solid #bcbcbc;
				    overflow: hidden;
				}
				 
				#footer{
				    clear: both;
				    padding: 5px;
				    border: 0px solid #bcbcbc;
				}
		
		</style>

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