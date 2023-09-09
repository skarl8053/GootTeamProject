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
			height: 900px;
		}
	</style>
	
	<style>
        
		/* 
		
			이름 : 남기문
			작업 : 배송내역 조회
			
		 */
		
		 /* 화면 디자인 */
		@font-face {
				    font-family: 'GmarketSansMedium';
				    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
				    font-weight: normal;
				    font-style: normal;
		}
		
		*{
			font-family: 'GmarketSansMedium';
		}
		
		#form{
			width: 1200px;
		}
        .searchbox{
            width: 150px;
            height: 30px;
        }
        #delivery_no{
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
            color:  #EBD01C;
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
        #warning_content{
        	text-align: center;
        }
        #warning_img{
        	width: 150px;
        	height: 150px;
        	margin: 0 auto;
        }
        #warning_text{
        	font-size: 20px;
        }
		.button{
            background-color: #011343;
            color:  #EBD01C;
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
    
</head>
<body>

    <script>

		function status1_change(iscomplete){
			var delivery_no = document.getElementById("delivery_no").value;
			// 배송 주문 확인 처리

			if(iscomplete == "Y")
			{
				return false;
			}

			if(confirm("배송 상태를 '배송 주문 확인'으로 변경하시겠습니까?") == false)
			{
				return false;
			}
			else{
				// 처리 진행
				location.replace("delivery_update?delivery_no=" + delivery_no + "&update=1");
			}

		}

		function status2_change(iscomplete){
			// 배송 준비 처리
			var delivery_no = document.getElementById("delivery_no").value;
			if(iscomplete == "Y")
			{
				return false;
			}

			if(confirm("배송 상태를 '배송 준비 완료'로 변경하시겠습니까?") == false)
			{
				return false;
			}
			else{
				// 처리 진행
				location.replace("delivery_update?delivery_no=" + delivery_no + "&update=2");
			}
		}

		function status3_change(iscomplete){
			// 배송중 처리
			var delivery_no = document.getElementById("delivery_no").value;
			if(iscomplete == "Y")
			{
				return false;
			}

			if(confirm("배송 상태를 '배송중'으로 변경하시겠습니까?") == false)
			{
				return false;
			}
			else{
				// 처리 진행
				location.replace("delivery_update?delivery_no=" + delivery_no + "&update=3");
			}

		}

		function status4_change(iscomplete){
			// 배송 완료 처리
			var delivery_no = document.getElementById("delivery_no").value;
			if(iscomplete == "Y")
			{
				return false;
			}

			if(confirm("배송 상태를 '배송완료'로 변경하시겠습니까?") == false)
			{
				return false;
			}
			else{
				// 처리 진행
				location.replace("delivery_update?delivery_no=" + delivery_no + "&update=4");
			}

		}

		var isNumberCheck = true;

		function searchCheckDelivery(){
			
			var delivery_no = document.getElementById("delivery_no");
			
			if( ! isNumberCheck ){
				isNumberCheck = true;
				return false;
			}
			
			if(delivery_no.value.length < 1)
			{
				alert("배송번호를 입력해주세요");
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
			location.replace("delivery?delivery_no=${delivery_no}");
		</script>
		
	</c:if>



   	<!-- 메인 -->
    <h1>배송 내역 조회 / 상태 변경</h1>

	<div id="form">
		<form action="delivery" onsubmit="return searchCheckDelivery();">
			<div>
				<br />
				<span>
					<c:if test="${empty delivery_no || delivery_no eq ''}">
						<input type="text" id="delivery_no" name="delivery_no" onchange="return inputMoveNumber(this);" placeholder="주문번호를 입력해주세요" autocomplete="off">
					</c:if>
					<c:if test="${not empty delivery_no}">
						<input type="text" id="delivery_no" name="delivery_no" onchange="return inputMoveNumber(this);" value="${delivery_no}" autocomplete="off">
					</c:if>
				</span>
				<span>
					<input type="submit" class="button" value="검색">
				</span>
			</div>
			<br><br>
			<c:if test="${empty param.order_no && empty list}">
				<div id="warning_content" >
    	 			<img id="warning_img" src="resources/img/PL_Search.png" alt="이미지 없음"/>
    	 			<br />
	    	 		<span id="warning_text">배송 내역을 조회할 주문번호를 입력해주세요</span>
	    	 		<br /><br /><br />
    	 		</div>
			</c:if>
			<c:if test="${not empty param.order_no && empty list}">
				<div id="warning_content" >
    	 			<img id="warning_img" src="resources/img/No_Search.jpeg" alt="이미지 없음"/>
    	 			<br />
	    	 		<span id="warning_text">해당 주문번호의 주문 정보가 없습니다.</span>
	    	 		<br /><br /><br />
    	 		</div>
			</c:if>
			<c:if test="${not empty list}">
				<div>
					<div>
						<span class="title">배송 상세내역</span>
					</div>
					<br>
					<table>
						<colgroup>
							<col style="width: 10%">
							<col style="width: 40%">
							<col style="width: 10%">
							<col style="width: 40%">
						</colgroup>
						<tbody>
							<tr>
								<td class="first_col">배송번호</td>
								<td class="second_col" colspan="3">${list.delivery_no}</td>
							</tr>
							<tr>
								<td class="first_col">이벤트명</td>
								<td class="second_col">${list.event_name}</td>
								<td class="third_col">이벤트 등수</td>
								<td class="forth_col">${list.score}</td>
							</tr>
							<tr>
								<td class="first_col">제품명</td>
								<td class="second_col" colspan="3">${list.item_name}</td>
							</tr>
							<tr>
								<td class="first_col">배송 상태</td>
								<td class="second_col" colspan="3" style="color: red; font-weight: bolder;">${list.step_flag_str}</td>
							</tr>
						</tbody>
					</table>
				</div>
				<br><br>
				<div id="bottomfield">
					<div>
						<span class="title">배송 상태 변경</span>
					</div>
					<div class="statusfield">
						<span>
							<c:if test="${list.step1_status eq 'Y'}">
								<img class="step_img" src="resources/img/delivery/Complete.png" alt="이미지">
							</c:if>
							<c:if test="${list.step1_status eq 'N'}">
								<img class="step_img"  src="resources/img/delivery/Check_Order.png" alt="이미지">
							</c:if>
						</span>
						<span>
							<c:if test="${list.step2_status eq 'Y'}">
								<img class="step_img"  src="resources/img/delivery/Complete.png" alt="이미지">
							</c:if>
							<c:if test="${list.step2_status eq 'N'}">
								<img class="step_img"  src="resources/img/delivery/Preparing_Delivery.png" alt="이미지">
							</c:if>
						</span>
						<span>
							<c:if test="${list.step3_status eq 'Y'}">
								<img class="step_img"  src="resources/img/delivery/Complete.png" alt="이미지">
							</c:if>
							<c:if test="${list.step3_status eq 'N'}">
								<img class="step_img"  src="resources/img/delivery/Delivery.png" alt="이미지">
							</c:if>
						</span>
						<span>
							<c:if test="${list.step4_status eq 'Y'}">
								<img class="step_img"  src="resources/img/delivery/Complete.png" alt="이미지">
							</c:if>
							<c:if test="${list.step4_status eq 'N'}">
								<img class="step_img"  src="resources/img/delivery/Delivery_Complete.png" alt="이미지">
							</c:if>
						</span>
					</div>
					<div class="statusfield">
						<c:if test="${list.step1_status eq 'Y'}">
							<button type="button" class="statusbutton_stop" onclick="return status1_change('Y')">처리 완료</button>
						</c:if>
						<c:if test="${list.step1_status eq 'N'}">
							<button type="button"  class="statusbutton" onclick="return status1_change('N')">배송 주문 확인 처리</button>
						</c:if>
						
						<c:if test="${list.step2_status eq 'Y'}">
							<button type="button"  class="statusbutton_stop" onclick="return status2_change('Y')">처리 완료</button>
						</c:if>
						<c:if test="${list.step2_status eq 'N'}">
							<button type="button"  class="statusbutton" onclick="return status2_change('N')">배송 준비 완료 처리</button>
						</c:if>
						
						<c:if test="${list.step3_status eq 'Y'}">
							<button type="button"  class="statusbutton_stop" onclick="return status3_change('Y')">처리 완료</button>
						</c:if>
						<c:if test="${list.step3_status eq 'N'}">
							<button type="button"  class="statusbutton" onclick="return status3_change('N')">배송중 처리</button>
						</c:if>
						
						<c:if test="${list.step4_status eq 'Y'}">
							<button type="button"  class="statusbutton_stop" onclick="return status4_change('Y')">처리 완료</button>
						</c:if>
						<c:if test="${list.step4_status eq 'N'}">
							<button type="button"  class="statusbutton" onclick="return status4_change('N')">배송완료 처리</button>
						</c:if>
						
					</div>
				</div>
			</c:if>
			
		</form>
	</div>
	
</body>
</html>