<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>숙소 리스트</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/stay_list_admin.css"/>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
	<!-- 개별 화면 content 크기를 조절하는 방법 -->
    <style>
        #content{
            height: auto;
            width : 1200px;
            margin : 0 auto;
        }
    </style>
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	    $(document).ready(function() {
	        $("#searchbtn").click(function(event) {
	            event.preventDefault(); // 기본 submit 동작 방지

	            $("#location").val;
	        	$("#type").val;      		        	
	        	$("#sh_loca").val;      		        	
	        	$("#sh_type").val;      		        	
	            
	            var locationValue = $("#location option:selected").val();
	            var typeValue = $("#type option:selected").val();
	            
	            $("#location").val(locationValue);
	            $("#type").val(typeValue);
	            
	            $("#form").submit();
	            
	        });	
	    });
	    
	    function searchExecute(){

            var location = document.getElementById("location").value;
            var type = document.getElementById("type").value;
            
            // 검색 결과 조회
            location.replace("stay_list?page=1&location=" + location + "&type="+ type);
            
        }
	    
	    function openNewWindow(s_no) {
	        const option = "width=600,height=720,left=500,top=120";
	        const popupWindow = window.open("stay_list_room_confirm?s_no=" + s_no, "객실 리스트", option);
	        
	        // 팝업 창의 iframe 로드 이벤트에 함수 할당
	        popupWindow.document.querySelector("#popup-iframe").onload = function() {
	            // 팝업 창에서 메인 창으로 콜백으로 전달하기 위한 함수 할당
	            popupWindow.setStayTitle = setStayTitle;
	        };
	    }
	</script>


</head>
<body>
    <p>숙소 리스트</p>
    <hr>
    <form id="form" action="stay_list" method="post">
    <input type="hidden" name="page" value="1" />
	    <select name="location" id="location" class="location">
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
	    <select name="type" id="type" class="type">
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
	    <input type="submit" id="searchbtn" value="검색" onclick="searchExecute();" />
    </form>
    <table style="border: 1px solid black; width: 100%">
        <tr>
            <td style="width: 8%">숙소번호</td>
            <td style="width: 30%">숙소 썸네일</td>
            <td style="width: 20%">숙소명</td>
            <td style="width: 10%">지역</td>
            <td style="width: 10%">카테고리</td>
            <td style="width: 10%">별점</td>
            <td style="width: 20%">수정 및 삭제</td>
        </tr>
        
        <c:forEach items="${list }" var="list">
        <input type="hidden" name="s_no" id="s_no" value="${list.s_no }" />
        	<tr>
	            <td>${list.s_no }</td>
	            <td><img src="resources/upload_img/admin/stay/${list.s_img1 }" alt="이미지 없음" class="stay_image"/></td>
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
	            	<input type="button" value="수정" class="tbbtn" onclick="location.href='stay_edit?s_no=${list.s_no }'" />
	            	<input type="button" value="삭제" class="tbbtn" onclick="openNewWindow(${list.s_no})" />
	            </td>
        	</tr>
        </c:forEach>
        
    </table> <br />
    
    <c:if test="${vo.page>1}">
    	<a href="stay_list?page=1&location=${location }&type=${type}"><i class="fa-solid fa-angles-left"></i></a>
    	<a href="stay_list?page=${vo.page-1 }&location=${location }&type=${type}"><i class="fa-solid fa-circle-chevron-left"></i></a>
    </c:if>

	<c:forEach begin="${vo.pageStart}" end="${vo.pageEnd }" var="i">
		<c:choose>
			<c:when test="${i ne page}">
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
    
</body>
</html>