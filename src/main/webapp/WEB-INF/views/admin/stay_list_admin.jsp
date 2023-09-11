<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
	
	<!-- 개별 화면 content 크기를 조절하는 방법 -->
	<style>
		#content{
			height: auto;
		}
	</style>
	
	<style>
        
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
		.searchbox{
			width: 150px;
			height: 30px;
		}
		#keyword{
			width: 280px;
			height: 29px;
		}
		.s_img1, .img_col{
			width: 250px;
			height: 250px;	
		}
		.button{
			background-color: #011343;
			color: #EBD01C;
			border-radius: 3px;
			width: 100px;
			height: 32px;
			cursor: pointer;
		}
		.button:hover{
			cursor: pointer;
		}
		table{
			text-align: center;
			width: 1200px;
		}
		table tbody tr td{
			height: 40px;
		}
		table thead tr td{
			border-bottom: 1px solid black;
		}
		#paging{
			width: 1200px;
			text-align: center;
			
		}
		.winner_button{
			width: 98%; 
			background-color: #011343;
			color: #EBD01C;
			cursor: pointer;
		}

    </style>
	
</head>
<body>
    
	<script>
		
		function update_click(s_no){
			
			location.replace("stay_edit?s_no=" + s_no);
			
		}
	
	    function openNewWindow(s_no) {
	        const option = "width=800,height=800,left=500,top=120";
	        const popupWindow = window.open("stay_list_room_confirm_popup?s_no=" + s_no, "객실 리스트", option);
	        
	        // 팝업 창의 iframe 로드 이벤트에 함수 할당
	        popupWindow.document.querySelector("#popup-iframe").onload = function() {
	            // 팝업 창에서 메인 창으로 콜백으로 전달하기 위한 함수 할당
	            popupWindow.setStayTitle = setStayTitle;
	        };
	    }
	    
	    function searchExecute(){

            var location = document.getElementById("location").value;
            var type = document.getElementById("type").value;
            
            // 검색 결과 조회
            location.replace("stay_list?page=1&location=" + location + "&type="+ type);
            
        }

	</script>

	<!-- 메세지 -->
	<%-- <c:if test="${msg != ''}">
			
		<script>
			alert("${msg}");
			location.replace("event?page=1");
		</script>
		
	</c:if> --%>

    <!-- 메인 -->
    <h1>숙소 조회</h1>

    <form id="form" action="stay_list" method="post">
    
    	<input type="hidden" name="page" value="1" />
    	
    	<div>
    		<br />
    		<span>
				<select class="searchbox" id="location" name="location">
					<c:if test="${empty location || location eq 0}">
						<option value="0" selected>전체 지역</option>
						<option value="1">서울</option>
						<option value="2">경기</option>
						<option value="3">인천</option>
						<option value="4">제주</option>
						<option value="5">전라</option>
						<option value="6">경상</option>
						<option value="7">충청</option>
						<option value="8">강원</option>
					</c:if>
					<c:if test="${location eq 1 }">
						<option value="0">전체 지역</option>
						<option value="1" selected>서울</option>
						<option value="2">경기</option>
						<option value="3">인천</option>
						<option value="4">제주</option>
						<option value="5">전라</option>
						<option value="6">경상</option>
						<option value="7">충청</option>
						<option value="8">강원</option>
					</c:if>
					<c:if test="${location eq 2 }">
						<option value="0">전체 지역</option>
						<option value="1">서울</option>
						<option value="2" selected>경기</option>
						<option value="3">인천</option>
						<option value="4">제주</option>
						<option value="5">전라</option>
						<option value="6">경상</option>
						<option value="7">충청</option>
						<option value="8">강원</option>
					</c:if>
					<c:if test="${location eq 3 }">
						<option value="0">전체 지역</option>
						<option value="1">서울</option>
						<option value="2">경기</option>
						<option value="3" selected>인천</option>
						<option value="4">제주</option>
						<option value="5">전라</option>
						<option value="6">경상</option>
						<option value="7">충청</option>
						<option value="8">강원</option>
					</c:if>
					<c:if test="${location eq 4 }">
						<option value="0">전체 지역</option>
						<option value="1">서울</option>
						<option value="2">경기</option>
						<option value="3">인천</option>
						<option value="4" selected>제주</option>
						<option value="5">전라</option>
						<option value="6">경상</option>
						<option value="7">충청</option>
						<option value="8">강원</option>
					</c:if>
					<c:if test="${location eq 5 }">
						<option value="0">전체 지역</option>
						<option value="1">서울</option>
						<option value="2">경기</option>
						<option value="3">인천</option>
						<option value="4">제주</option>
						<option value="5" selected>전라</option>
						<option value="6">경상</option>
						<option value="7">충청</option>
						<option value="8">강원</option>
					</c:if>
					<c:if test="${location eq 6 }">
						<option value="0">전체 지역</option>
						<option value="1">서울</option>
						<option value="2">경기</option>
						<option value="3">인천</option>
						<option value="4">제주</option>
						<option value="5">전라</option>
						<option value="6" selected>경상</option>
						<option value="7">충청</option>
						<option value="8">강원</option>
					</c:if>
					<c:if test="${location eq 7 }">
						<option value="0">전체 지역</option>
						<option value="1">서울</option>
						<option value="2">경기</option>
						<option value="3">인천</option>
						<option value="4">제주</option>
						<option value="5">전라</option>
						<option value="6">경상</option>
						<option value="7" selected>충청</option>
						<option value="8">강원</option>
					</c:if>
					<c:if test="${location eq 8 }">
						<option value="0">전체 지역</option>
						<option value="1">서울</option>
						<option value="2">경기</option>
						<option value="3">인천</option>
						<option value="4">제주</option>
						<option value="5">전라</option>
						<option value="6">경상</option>
						<option value="7">충청</option>
						<option value="8" selected>강원</option>
					</c:if>
				</select>
    		</span>
			<span>
				<select class="searchbox" name="type" id="type">
					<c:if test="${empty type || type eq 0 }">
						<option value="0" selected>전체 타입</option>
						<option value="1" >호텔</option>
						<option value="2">모텔</option>
						<option value="3">펜션</option>
					</c:if>
					<c:if test="${type eq 1 }">
						<option value="0">전체 타입</option>
						<option value="1"  selected>호텔</option>
						<option value="2">모텔</option>
						<option value="3">펜션</option>
					</c:if>
					<c:if test="${type eq 2 }">
						<option value="0">전체 타입</option>
						<option value="1" >호텔</option>
						<option value="2" selected>모텔</option>
						<option value="3">펜션</option>
					</c:if>
					<c:if test="${type eq 3 }">
						<option value="0">전체 타입</option>
						<option value="1" >호텔</option>
						<option value="2">모텔</option>
						<option value="3" selected>펜션</option>
					</c:if>
				</select>
			</span>
    		<span>
    			<input type="submit" class="button" value="검색" onclick="searchExecute();">
    		</span>
    	</div>
    	<br><br>
    	<div>
    		<table>
    			<thead>
    				<tr>
						<td style="width: 8%">숙소번호</td>
						<td style="width: 30%">숙소 썸네일</td>
						<td style="width: 20%">숙소명</td>
						<td style="width: 10%">지역</td>
						<td style="width: 10%">카테고리</td>
						<td style="width: 10%">별점</td>
						<td style="width: 20%">수정 및 삭제</td>
					</tr>
    			</thead>
				<tbody>
					<c:forEach items="${list }" var="list">
						<input type="hidden" id="s_no" value="${list.s_no }" />
							<tr>
								<td>${list.s_no }</td>
								<td class="img_col" > <a href="stay_view?s_no=${list.s_no }">
									<img class="s_img1" src="resources/upload_img/admin/stay/${list.s_img1 }" alt="이미지 없음" /></a></td>
								<td><a href="stay_view?s_no=${list.s_no }">${list.s_name }</a></td>
								<td>
									<c:choose>
										<c:when test="${list.s_loca eq 1}">서울</c:when>
										<c:when test="${list.s_loca eq 2}">경기</c:when>
										<c:when test="${list.s_loca eq 3}">인천</c:when>
										<c:when test="${list.s_loca eq 4}">제주</c:when>
										<c:when test="${list.s_loca eq 5}">전라</c:when>
										<c:when test="${list.s_loca eq 6}">경상</c:when>
										<c:when test="${list.s_loca eq 7}">충청</c:when>
										<c:when test="${list.s_loca eq 8}">강원</c:when>
										<c:otherwise>기타</c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${list.s_type eq 1}">호텔</c:when>
										<c:when test="${list.s_type eq 2}">모텔</c:when>
										<c:when test="${list.s_type eq 3}">펜션</c:when>
										<c:otherwise>기타</c:otherwise>
									</c:choose>
								</td>
								<td><%-- ${list.s_rate } --%></td>
								<td>
									<input type="button" value="수정" class="button" onclick="update_click('${list.s_no }');"/>
									<input type="button" value="삭제" class="button" onclick="openNewWindow(${list.s_no})" />
								</td>
							</tr>
						</c:forEach>
				</tbody>
				
				
				
			</table> <br />
    		<br /><br />
    	</div>
    	<div>
        	<br />
        	<div id="paging">
        		<c:if test="${vo.page>1}">
					<a href="stay_list?page=1&location=${location }&type=${type}"><i class="fa-solid fa-angles-left"></i></a>
					<a href="stay_list?page=${vo.page-1 }&location=${location }&type=${type}"><i class="fa-solid fa-circle-chevron-left"></i></a>
				</c:if>
				
			<c:forEach begin="${vo.pageStart}" end="${vo.pageEnd }" var="i">
				<c:choose>
					<c:when test="${ i ne param.page}">
						<a href="stay_list?page=${i}&location=${location}&type=${type}">${i}</a>
					</c:when>
					<c:otherwise>
						<span>${i}</span>
					</c:otherwise>
				</c:choose>
			</c:forEach>

				<c:if test="${vo.page < vo.totPage }">
					<a href="stay_list?page=${vo.page+1 }&location=${location }&type=${type}"><i class="fa-solid fa-circle-chevron-right"></i></a>
					<a href="stay_list?page=${vo.totPage }&location=${location }&type=${type}"><i class="fa-solid fa-angles-right"></i></a>
				</c:if>
        	</div>
        </div>
    </form>
    
</body>
</html>