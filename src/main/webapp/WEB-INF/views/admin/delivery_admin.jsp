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
</head>
<body>

	<style>
        
		/* 
		
			이름 : 남기문
			작업 : 배송내역 조회
			
		 */
		
		 /* 화면 디자인 */
		
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
		img{
			width: 200px;
			padding: 40px 30px 0 30px;
		}
		.title{
			padding-left: 10px;
			font-size: 30px;
			font-weight: bold;
			color: blue
		}
		.statusbutton{
			background-color: blue;
            color: white;
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
            background-color: blue;
            color: white;
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

    </script>

	<!-- 메세지 -->
	<c:if test="${msg != ''}">
			
		<script>
			alert("${msg}");
			location.replace("delivery?delivery_no=${delivery_no}");
		</script>
		
	</c:if>



    <!-- 메인 -->
    <h1>배송 관리</h1>

	<div id="form">
		<form action="delivery">
			<div>
				<br />
				<span>
					<c:if test="${empty delivery_no || delivery_no eq ''}">
						<input type="text" id="delivery_no" name="delivery_no" placeholder="주문번호를 입력해주세요" autocomplete="off">
					</c:if>
					<c:if test="${not empty delivery_no}">
						<input type="text" id="delivery_no" name="delivery_no" value="${delivery_no}">
					</c:if>
				</span>
				<span>
					<input type="submit" class="button" value="검색" onclick="searchExecute();">
				</span>
			</div>
			<br><br>
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
							<td class="forth_col">${list.event_name}</td>
						</tr>
						<tr>
							<td class="first_col">제품명</td>
							<td class="second_col" colspan="3">${list.item_name}</td>
						</tr>
						<tr>
							<td class="first_col">배송 상태</td>
							<td class="second_col" colspan="3">${list.step_flag_str}</td>
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
							<img src="resources/img/delivery/Complete.png" alt="이미지">
						</c:if>
						<c:if test="${list.step1_status eq 'N'}">
							<img src="resources/img/delivery/Check_Order.png" alt="이미지">
						</c:if>
					</span>
					<span>
						<c:if test="${list.step2_status eq 'Y'}">
							<img src="resources/img/delivery/Complete.png" alt="이미지">
						</c:if>
						<c:if test="${list.step2_status eq 'N'}">
							<img src="resources/img/delivery/Preparing_Delivery.png" alt="이미지">
						</c:if>
					</span>
					<span>
						<c:if test="${list.step3_status eq 'Y'}">
							<img src="resources/img/delivery/Complete.png" alt="이미지">
						</c:if>
						<c:if test="${list.step3_status eq 'N'}">
							<img src="resources/img/delivery/Delivery.png" alt="이미지">
						</c:if>
					</span>
					<span>
						<c:if test="${list.step4_status eq 'Y'}">
							<img src="resources/img/delivery/Complete.png" alt="이미지">
						</c:if>
						<c:if test="${list.step4_status eq 'N'}">
							<img src="resources/img/delivery/Delivery_Complete.png" alt="이미지">
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
		</form>
	</div>
	
</body>
</html>