<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
<body>
	<table class="title">
		<tr>
			<td>
				<div class="pushal">알림</div>
			</td>
			<td><img src="https://via.placeholder.com/50x50" alt="임시이미지">
			</td>
			<td>
				<div class="dil_title">환불</div>
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
					<a href="pushalpayment?m_no=${payment.m_no }" class="line">결제</a>
				</div>
				<hr class="bar_line">
				<div class="bar">
					<a href="#" class="line">환불</a>
				</div>
			</td>
		<tr/>
		<c:forEach items="${dto }" var="refund">
		<tr>
			<td class="dil_info">
				<div class="dil_info">
					환불 정보 <br/>
					회원 이름 : ${refund.m_name } <br/>
					숙소 명    : ${refund.s_name } <br/>
					환불 사유 : ${refund.refund_reason } <br/>
					환불 금액 : ${refund.refund_price } <br/>
					차감률     : ${refund.refund_percentage } <br/>
					환불 진행상태 : ${refund.step_flag } <br/>
					환불 신청시간 : ${refund.step1_date } <br/>
					환불 완료시간 : ${refund.step2_date }
				</div>
			</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>