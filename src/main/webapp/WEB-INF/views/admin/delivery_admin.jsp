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
        #keyword{
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

		function status1_change(){

			// 배송 주문 확인 처리

			if(confirm("배송 상태를 '배송 주문 확인'으로 변경하시겠습니까?") == false)
			{
				return false;
			}
			else{
				// 처리 진행
				
			}

		}

		function status2_change(){
			// 배송 준비 처리

			if(confirm("배송 상태를 '배송 준비 완료'로 변경하시겠습니까?") == false)
			{
				return false;
			}
			else{
				// 처리 진행
				
			}
		}

		function status3_change(){
			// 배송중 처리
			
			if(confirm("배송 상태를 '배송중'으로 변경하시겠습니까?") == false)
			{
				return false;
			}
			else{
				// 처리 진행
				
			}

		}

		function status4_change(){
			// 배송 완료 처리

			if(confirm("배송 상태를 '배송완료'로 변경하시겠습니까?") == false)
			{
				return false;
			}
			else{
				// 처리 진행
				
			}

		}

    </script>

	<!-- 메세지 -->
	<c:if test="${msg != ''}">
			
		<script>
			alert("${msg}");
			location.replace("delivery");
		</script>
		
	</c:if>



    <!-- 메인 -->
    <h1>배송 관리</h1>

	<div id="form">
		<form action="delivery">
			<div>
				<br />
				<span>
					<c:if test="${empty keyword || keyword eq ''}">
						<input type="text" id="keyword" name="keyword" placeholder="주문번호를 입력해주세요" autocomplete="off">
					</c:if>
					<c:if test="${not empty keyword}">
						<input type="text" id="keyword" name="keyword" value="${keyword}">
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
						<img src="./이미지_sample.jpg" alt="이미지">
					</span>
					<span>
						<img src="./이미지_sample.jpg" alt="이미지">
					</span>
					<span>
						<img src="./이미지_sample.jpg" alt="이미지">
					</span>
					<span>
						<img src="./이미지_sample.jpg" alt="이미지">
					</span>
				</div>
				<div class="statusfield">
					<button class="statusbutton" onclick="return status1_change()">배송 주문 확인 처리</button>
					<button class="statusbutton" onclick="return status2_change()">배송 준비 완료 처리</button>
					<button class="statusbutton" onclick="return status3_change()">배송중 처리</button>
					<button class="statusbutton" onclick="return status4_change()">배송완료 처리</button>
				</div>
			</div>
		</form>
	</div>
	
</body>
</html>