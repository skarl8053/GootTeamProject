<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<!-- 개별 화면 content 크기를 조절하는 방법 -->
	<style>
		#content{
			height: 1100px;
		}
	</style>
</head>
<body>

	<style>
        
		/* 
		
			이름 : 남기문
			작업 : 환불내역 조회
			
		 */
		
		 /* 화면 디자인 */
		
		#form{
			width: 1200px;
		}
        .searchbox{
            width: 150px;
            height: 30px;
        }
        #order_no{
            width: 280px;
            height: 29px;
        }
        table, tr, td{
            text-align: center;
			border: 1px solid black;
            width: 1200px;
			border-collapse: collapse;
        }
        table tbody tr td{
        	height: 40px;
        }
		.second_col{
			text-align: left;
			padding-left: 20px;
		}
		.forth_col{
			text-align: left;
			padding-left: 20px;
		}
		.statusfield{
			width: 1200px;
			height: auto;
			text-align: center;
		}
		.step_img{
			width: 200px;
			height: 200px;
			padding: 40px 30px 0 30px;
		}
		.title{
			padding-left: 10px;
			font-size: 30px;
			font-weight: bold;
			color: #011343;
		}
		.statusbutton{
			background-color: #011343;
            color: yellow;
			font-size: 20px;
            font-weight: bold;
            border-radius: 3px;
            width: 200px;
            height: 50px;
			cursor: pointer;
			margin: 10px 30px 0px 30px;
		}
		.statusbutton_stop{
			background-color: gray;
            color: black;
			font-size: 20px;
            font-weight: bold;
            border-radius: 3px;
            width: 200px;
            height: 50px;
			cursor: not-allowed;
			margin: 10px 30px 0px 30px;
			
		}
		
		.button{
            background-color: #011343;
            color: yellow;
            font-weight: bold;
            border-radius: 3px;
            width: 100px;
            height: 32px;
			cursor: pointer;
        }
        .button:hover{
        	cursor: pointer;
        }
		#bottomfield{
			
		}

    </style>

    <script>

    	
    
		function status1_change(iscomplete){

			var m_no = document.getElementById("m_no").value;
			var order_no = document.getElementById("order_no").value;
			// 환불 주문 확인 처리

			if(iscomplete == "Y")
			{
				return false;
			}

			if(confirm("환불 상태를 '환불 주문 확인'으로 변경하시겠습니까?") == false)
			{
				return false;
			}
			else{
				// 처리 진행
				location.replace("refund_update?m_no=" + m_no + "&order_no=" + order_no + "&update=1");
			}

		}

		function status2_change(iscomplete){
			// 환불 준비 처리
			
			var m_no = document.getElementById("m_no").value;
			var order_no = document.getElementById("order_no").value;
			
			if(iscomplete == "Y")
			{
				return false;
			}

			if(confirm("환불 상태를 '환불 완료'로 변경하시겠습니까?") == false)
			{
				return false;
			}
			else{
				// 처리 진행
				location.replace("refund_update?m_no=" + m_no + "&order_no=" + order_no + "&update=2");
			}
		}

		var isNumberCheck = true;

		function searchCheckrefund(){
			
			var order_no = document.getElementById("order_no");
			
			if( ! isNumberCheck ){
				isNumberCheck = true;
				return false;
			}
			
			if(order_no.value.length < 1)
			{
				alert("환불번호를 입력해주세요");
				return false;
			}
			
		}
		
		function inputMoveNumber(target){
			if(isFinite(target.value) == false) {

                alert("주문번호는 숫자만 입력할 수 있습니다.");
                target.value = "";
				isNumberCheck = false;

                return false;
            }
		}

    </script>

	<!-- 메세지 -->
	<c:if test="${msg != ''}">
			
		<script>
			alert("${msg}");
			location.replace("refund?order_no=${order_no}");
		</script>
		
	</c:if>



    <!-- 메인 -->
    <h1>환불 관리</h1>

	<div id="form">
		<form action="refund" onsubmit="return searchCheckrefund();">
			<input type="hidden" id="m_no" value="${list.m_no}" />
			
			<div>
				<br />
				<span>
					<c:if test="${empty order_no || order_no eq ''}">
						<input type="text" id="order_no" name="order_no" placeholder="주문번호를 입력해주세요" onchange="return inputMoveNumber(this);" autocomplete="off">
					</c:if>
					<c:if test="${not empty order_no}">
						<input type="text" id="order_no" name="order_no" value="${order_no}" onchange="return inputMoveNumber(this);"  autocomplete="off">
					</c:if>
				</span>
				<span>
					<input type="submit" class="button" value="검색">
				</span>
			</div>
			<br><br>
			<div>
				<div>
					<span class="title">환불 상세내역</span>
				</div>
				<br>
				<table>
					<colgroup>
						<col style="width: 10%">
						<col style="width: 90%">
					</colgroup>
					<tbody>
						<tr>
							<td class="first_col">환불 번호</td>
							<td class="second_col">${list.refund_no}</td>
						</tr>
						<tr>
							<td class="first_col">환불 신청자명</td>
							<td class="second_col">${list.m_name}</td>
						</tr>
						<tr>
							<td class="first_col">환불 사유</td>
							<td class="second_col">${list.refund_reason}</td>
						</tr>
						<tr>
							<td class="first_col">환불 숙소명</td>
							<td class="second_col">${list.s_name}</td>
						</tr>
						<tr>
							<td class="first_col">환불 금액</td>
							<td class="second_col">${list.refund_price}</td>
						</tr>
						<tr>
							<td class="first_col">환불 쿠폰명</td>
							<td class="second_col">${list.refund_coupon}</td>
						</tr>
						<tr>
							<td class="first_col">환불 포인트</td>
							<td class="second_col">${list.refund_point}</td>
						</tr>
						<tr>
							<td class="first_col">환불 상태</td>
							<td class="second_col" style="color: red; font-weight: bolder;">${list.step_flag_str}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<br><br>
			<div id="bottomfield">
				<div>
					<span class="title">환불 상태 변경</span>
				</div>
				<div class="statusfield">
					<span>
						<c:if test="${list.step1_status eq 'Y'}">
							<img class="step_img"  src="resources/img/refund/Complete.png" alt="이미지">
						</c:if>
						<c:if test="${list.step1_status eq 'N'}">
							<img class="step_img"  src="resources/img/refund/list.png" alt="이미지">
						</c:if>
					</span>
					<span>
						<c:if test="${list.step2_status eq 'Y'}">
							<img class="step_img"  src="resources/img/refund/Complete.png" alt="이미지">
						</c:if>
						<c:if test="${list.step2_status eq 'N'}">
							<img class="step_img"  src="resources/img/refund/refund.png" alt="이미지">
						</c:if>
					</span>
				</div>
				<div class="statusfield">

					<c:if test="${list.step1_status eq 'Y'}">
						<button type="button" class="statusbutton_stop" onclick="return status1_change('Y')">처리 완료</button>
					</c:if>
					<c:if test="${list.step1_status eq 'N'}">
						<button type="button"  class="statusbutton" onclick="return status1_change('N')">환불 주문 확인 처리</button>
					</c:if>
					
					<c:if test="${list.step2_status eq 'Y'}">
						<button type="button"  class="statusbutton_stop" onclick="return status2_change('Y')">처리 완료</button>
					</c:if>
					<c:if test="${list.step2_status eq 'N'}">
						<button type="button"  class="statusbutton" onclick="return status2_change('N')">환불 완료 처리</button>
					</c:if>
					
				</div>
			</div>
		</form>
	</div>
	
</body>
</html>