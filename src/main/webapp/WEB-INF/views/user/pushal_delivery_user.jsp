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

	/* 배송 현황 부분 */
	.dil_title {
		margin-left: 13em;
		font-size: 30px;
	}
	/* 알림 부분 */
	.pushal {
		font-size: 25px;
	}
	/* 배송, 결제, 환불 링크 */
	.bar {
		font-size: 25px;
		margin-top: 0.8em;
		margin-bottom: 0.8em;
		text-align: center;
	}
	
	.line {
		text-decoration: none;
	}
	/* 배송, 결제, 환불 링크 아래의 밑줄 */
	.bar_line {
		width: 200px;
	}
	.dil_status {
		margin-left: 6em;
		margin-top: 0.5em;
	}
</style>

<!-- 개별 화면 content 크기를 조절하는 방법 -->
<style>
	#content{
		height: 1600px;
	}
</style>
	
<body>
	<div id="form">
		<table class="title">
			<tr>
				<td>
					<div class="pushal">알림</div>
				</td>
				<td><img src="https://via.placeholder.com/50x50" alt="임시이미지">
				</td>
				<td>
					<div class="dil_title">배송 현황</div>
				</td>
			</tr>
	
		</table>
		<hr>
		<table>
			<tr>
				<td>
					<div class="bar">
						<a href="#" class="line">배송</a>
					</div>
					<hr class="bar_line">
					<div class="bar">
						<a href="pushalpayment?m_no=${payment.m_no }" class="line">결제</a>
					</div>
					<hr class="bar_line">
					<div class="bar">
						<a href="pushalrefund?m_no=${refund.m_no }" class="line">환불</a>
					</div>
				</td>
			</tr>
			<!-- 배송 정보 -->
			<c:forEach items="${dto }" var="delivery">
			<tr>
				<td>
					<div class="dil_info">
					회원이름 : ${delivery.m_name } <br /> 
					배송정보 : ${delivery.delivery_addr }
					</div>
					<div class="dil_status">
					배송 진행 상황 : ${delivery.step_flag_str }
					</div>
				</td>
			</tr>
			</c:forEach>
		</table>
	</div>
	
</body>
</html>