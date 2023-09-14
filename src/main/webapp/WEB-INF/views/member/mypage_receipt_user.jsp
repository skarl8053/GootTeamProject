<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 내역</title>
</head>
<body>

	<style>
@font-face {
	font-family: 'GmarketSansMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

* {
	font-family: 'GmarketSansMedium';
	color: rgb(1, 19, 67);
}

div {
	text-align: center;
}

#form {
	width: 600px;
	height: auto;
	border: 3px solid rgb(1, 19, 67);
	margin: 20px auto 0 auto;
	position: relative;
	border-radius: 10px;
}

hr {
	width: 550px;
}

.table_title {
	text-align: left;
	padding: 15px 0 10px 30px;
	font-size: 20px;
	text-decoration: none;
}

table {
	width: 550px;
	margin: 0 auto 5px auto;
	border-collapse: collapse;
}

.first_col {
	width: 15%;
	height: 50px;
}

.second_col {
	width: 35%;
	height: 50px;
}

.third_col {
	width: 15%;
	height: 50px;
}

.forth_col {
	width: 35%;
	height: 50px;
}

.button {
	background-color: rgb(1, 19, 67);
	color: rgb(235, 208, 28);
	border-radius: 5px;
	width: 150px;
	height: 50px;
	cursor: pointer;
	font-size: 20px;
	border: 0px;
	line-height: 50px;
}

#under_btn {
	margin-top: 20px;
	margin-bottom: 20px;
}
</style>



	<div id="form">
		<div>
			<h1>구매 내역</h1>
		</div>
		<hr>

		<form action="refund_insert" onsubmit="return refundCheck();">

			<input type="hidden" name="m_no" value="${param.m_no}"> <input
				type="hidden" name="order_no" value="${param.order_no}">

			<div>
				<div class="table_title">
					<span class="refund_text">주문 정보</span>
				</div>
				<table border="1">
					<tr>
						<td class="first_col">주문번호</td>
						<td class="second_col" colspan="">${o_list.order_no}</td>
						<td class="third_col">결제 금액</td>
						<td class="forth_col">${o_list.payment_price}</td>
					</tr>
					<tr>
						<td class="first_col">숙소명</td>
						<td class="second_col">${o_list.s_name}</td>
						<td class="third_col">예약일자</td>
						<td class="forth_col">${o_list.order_date }</td>
					</tr>
					<tr>
						<td class="first_col">체크인</td>
						<td class="second_col">${o_list.check_in_date }</td>
						<td class="third_col">체크아웃</td>
						<td class="third_col">${o_list.check_out_date }</td>
					</tr>
					<tr>
						<td class="first_col">번호</td>
						<td class="second_col" colspan="2">객실명</td>
						<td class="third_col">금액</td>
					</tr>
					<c:forEach items="${r_list}" var="li">
						<tr>
							<td class="first_col"><span>${li.row_num}</span></td>
							<td class="second_col" colspan="2"><span>${li.r_name}</span></td>
							<td class="third_col"><span>${li.r_price }</span></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="table_title">
				<span class="refund_text">사용 포인트</span>
			</div>
			<div>
				<table border="1">
					<tr>
						<td class="first_col">포인트</td>
						<td class="second_col" colspan="2">${d_list.point}</td>
					</tr>
				</table>
			</div>
			<div class="table_title">
				<span class="refund_text">사용 쿠폰</span>
			</div>
			<div>
				<table border="1">
					<tr>
						<td class="first_col">쿠폰 이름</td>
						<td class="second_col" colspan="2">${d_list.coupon_name}</td>
					</tr>
					<tr>
						<td class="first_col">쿠폰 금액</td>
						<td class="second_col" colspan="2">${d_list.coupon_no}</td>
					</tr>
				</table>
			</div>
			<div id="under_btn">
				<span>
					<button type="button" id="cancelButton" class="button"
						onclick="goBack();">확인</button>
				</span>
			</div>
		</form>
	</div>

</body>

<script>
	function goBack() {
		window.history.back();
	}
</script>

</html>