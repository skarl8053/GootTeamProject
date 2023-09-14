<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

.table_title, #refund_reason_title {
	text-align: left;
	padding: 15px 0 10px 30px;
	font-size:20px;
	text-decoration: none;
}
.title_option{
	text-align: left;
	padding: 15px 0 0 30px;
	font-size:20px;
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

#refundButton {
	background-color: gray;
	color: black;
	border-radius: 5px;
	width: 150px;
	height: 50px;
	cursor: not-allowed;
	font-size: 20px;
	border: 0px;
	line-height:50px;
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
	line-height:50px;
}

#under_btn{
	margin-top: 20px;
	margin-bottom: 20px;
}

#checkStr {
	cursor: pointer;
}

#totalprice {
	color: red;
	font-weight: bold;
}

#refund_reason, #refund_reason option {
	width: 250px;
	height: 30px;
	font-size: 20px;
}
</style>

	

	<div id="form">
		<div>
			<h1>환불 진행</h1>
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
						<td class="third_col">환불 금액</td>
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
						<td class="third_col" >체크아웃</td>
						<td class="third_col">${o_list.check_out_date }</td>
					</tr>
					<tr>
						<td class="first_col">번호</td>
						<td class="second_col" colspan="2">객실명</td>
						<td class="third_col" >금액</td>
					</tr>
					<c:forEach items="${r_list}" var="li">
						<tr>
							<td class="first_col"><span>${li.row_num}</span></td>
							<td class="second_col" colspan="2"><span>${li.r_name}</span></td>
							<td class="third_col" ><span>${li.r_price }</span></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="table_title">
				<span  class="refund_text">포인트 환불</span>
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
				<span  class="refund_text">쿠폰 환불</span>
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
			<br>
			<div class="title_option">
				<span class="refund_text">환불 사유</span>
			</div>
			<div id="refund_reason_title">
				<select id="refund_reason" name="refund_reason">
					<c:forEach items="${reason_list}" var="li">
						<option value="${li.refund_reason_no}">${li.refund_reason_name}</option>
					</c:forEach>
				</select>
			</div>
			<br>
			<div>
				<input type="checkbox" id="continueRefund"
					onchange="continueRefundCK(this)" style="cursor: pointer;"><span
					id="checkStr" onclick="setCheckbox()">위와 같은 내용을 확인하였습니다.</span>
			</div>
			<div id="under_text">
				<span>환불을 계속 진행하시겠습니까?</span>
			</div>
			<div id="under_btn">
				<span> <input type="submit" id="refundButton" value="환불 진행"></span> 
				<span> <button type="button" id="cancelButton" class="button"onclick="goBack();">취소</button></span>
			</div>
		</form>
	</div>

</body>

<script>
		function setCheckbox() {

			// 위와 같은 내용을 확인하였습니다. 클릭할 경우

			var checkbox = document.getElementById("continueRefund");

			if (checkbox.checked == false) {
				document.getElementById("continueRefund").checked = true;
			} else {
				document.getElementById("continueRefund").checked = false;
			}

			continueRefundCK(checkbox);
		}

		function continueRefundCK(target) {

			// 체크박스 선택 / 취소 여부에 따라 달라짐

			var refundButton = document.getElementById("refundButton");
			var cancelButton = document.getElementById("cancelButton");

			if (target.checked == true) {
				buttonStyle(" #011343", "#EBD01C", "pointer");
			} else {
				buttonStyle("gray", "black", "not-allowed");
			}
		}

		function buttonStyle(bgcolor, fontcolor, cursor) {
			refundButton.style.backgroundColor = bgcolor;
			refundButton.style.color = fontcolor;
			refundButton.style.cursor = cursor;
		}

		function refundCheck() {
			var checkbox = document.getElementById("continueRefund").checked;

			if (checkbox == false) {
				return false;
			}
		}

		function goBack() {

			window.history.back();
		}
	</script>
</html>