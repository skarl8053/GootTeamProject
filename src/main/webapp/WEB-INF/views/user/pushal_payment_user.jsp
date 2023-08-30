<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>

	<style>
	
		#form{
			width: 1200px;
		}
		
		.dil_title {
			margin-left: 13em;
			font-size: 30px;
		}
		
		.pushal {
			font-size: 25px;
		}
		
		.bar {
			font-size: 25px;
			margin-top: 0.8em;
			margin-bottom: 0.8em;
			text-align: center;
		}
		
		.line {
			text-decoration: none;
		}
		
		.bar_line {
			width: 200px;
		}
		
		.dil_info {
			background-color: aqua;
			margin-left: 15em;
			font-size: 25px;
			width: 500px;
		}
		
	</style>
	
	<!-- 개별 화면 content 크기를 조절하는 방법 -->
	<style>
		#content{
			height: 1600px;
		}
	</style>
	
</head>
<body>
	
	<div id="form">
		<table class="title">
			<tr>
				<td>
					<div class="pushal">알림</div>
				</td>
				<td>
					<img src="https://via.placeholder.com/50x50" alt="임시이미지">
				</td>
				<td>
					<div class="dil_title">결제</div>
				</td>
			</tr>
				
		</table>
		<hr>
		<table>
			<tr>
			
				<td>
					<div class="bar">
						<a href="pushaldelivery?m_no=${delivery.m_no }" class="line">배송</a>
					</div>
					<hr class="bar_line">
					<div class="bar">
						<a href="#" class="line">결제</a>
					</div>
					<hr class="bar_line">
					<div class="bar">
						<a href="pushalrefund?m_no=${payment.m_no }" class="line">환불</a>
					</div>
				</td>
			</tr>
		
			<c:forEach items="${dto }" var="payment">
				<tr>
					<td class="dil_info">
						<div class="dil_info">
						결제 정보 <br/>  
						회원이름 : ${payment.m_name } <br/>
						숙 소 명  : ${payment.item_name } <br/>
						총   금액 : ${payment.total_price } <br/> 
						할인금액 : ${payment.discount_price } <br/>
						결제금액 : ${payment.payment_price }</div>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>	
	
</body>
</html>