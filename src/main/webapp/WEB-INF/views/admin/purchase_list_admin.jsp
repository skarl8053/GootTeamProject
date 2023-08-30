<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 구매 내역</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/purchase_list_admin.css"/>
	<style>
        #content{
            height: 1500px;
            margin : auto;
        }
    </style>
</head>
<body>
	<!-- 신재환 회원 구매 내역 -->
	
	<h2>회원 구매내역</h2>
    <hr>
    <h3>다녀온 숙소</h3>
    <table style="border: 1px solid black;">
        <tr>
            <td>NO</td>
            <td>숙소 썸네일</td>
            <td>숙소명</td>
            <td>결제방식</td>
            <td>결제금액</td>
            <td>결제날짜</td>
            <td>다녀온 날짜</td>
        </tr>
        <c:forEach items="${p_list }" var="p_list">
	        <tr>
	            <td>1</td>
	            <td><input type="box" style="width: 200px; height: 200px;"></td>
	            <td>서울 신라호텔</td>
	            <td>${p_list.payment_method }</td>
	            <td>${p_list.payment_price}</td>
	            <td>${p_list.order_date}</td>
	            <td>2023.08.18~<br>
	                2023.09.18
	            </td>
	        </tr>
        </c:forEach>
    </table>
    <input type="button" value="<">
    <a href="p_list?page=1">1</a>
    <a href="p_list?page=2">2</a>
    <a href="p_list?page=3">3</a>
    <input type="button" value=">">
</body>
</html>