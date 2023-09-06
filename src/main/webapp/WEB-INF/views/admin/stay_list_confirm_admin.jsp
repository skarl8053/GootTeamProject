<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/stay_list_confirm_admin.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
	<script>
		function selectbtn(s_no, s_name) {
		    // 메인 창의 함수 호출하고 선택한 값을 전달
		    window.opener.setStayTitle(s_name);
		    window.close();
		}
		
		$(document).ready(function() {
	        $("#searchbtn").click(function(event) {
	        	$(".location").val;
	        	$(".type").val;	        	
	        	
	            event.preventDefault(); // 기본 submit 동작 방지
	            
	            var locationValue = $(".location option:selected").val();
	            var typeValue = $(".type option:selected").val();
	            
	            $(".location").val(locationValue);
	            $(".type").val(typeValue);
	            
	            $("#form").submit();
	            
	        });	
	    });
	</script>
	<style>
		body {
			height : auto;
		}
	</style>
</head>
<body>
<h2>숙소 리스트</h2>
	<form action="stay_list_confirm" id="form">
		<select class="location" name="location">
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
	    <select class="type" name="type">
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
	    <input type="hidden" name="page" value="1" />
	    <input type="hidden" name="location"  id="location"/>
	    <input type="hidden" name="type"  id="type"/>
	    <input type="submit" value="검색" id="search"/>
	 </form>   
<table>
	<colgroup>
		<td width="20%">숙소 번호</td>
		<td width="40%">숙소명</td>
		<td width="15%">지역</td>
		<td width="15%">카테고리</td>
		<td width="10%"></td>
	</colgroup>	
	<c:forEach items="${list }" var="stay_list">
		<tr>
			<td>${stay_list.s_no }</td>
			<td>${stay_list.s_name}</td>
			<td>
				<c:choose>
					<c:when test="${stay_list.s_type == 1}">서울</c:when>
					<c:when test="${stay_list.s_type == 2}">경기</c:when>
					<c:when test="${stay_list.s_type == 3}">인천</c:when>
					<c:when test="${stay_list.s_type == 4}">제주</c:when>
					<c:when test="${stay_list.s_type == 5}">전라</c:when>
					<c:when test="${stay_list.s_type == 6}">경상</c:when>
					<c:when test="${stay_list.s_type == 7}">충청</c:when>
					<c:when test="${stay_list.s_type == 8}">강원</c:when>
				</c:choose>
			</td>
			<td>
				<c:choose>
					<c:when test="${stay_list.s_type == 1}">호텔</c:when>
					<c:when test="${stay_list.s_type == 2}">모텔</c:when>
					<c:when test="${stay_list.s_type == 3}">펜션</c:when>
				</c:choose>
			</td>
			<td>
				<input type="button" value="선택" class="btn" onclick="selectbtn('${stay_list.s_no}', '${stay_list.s_name}')"/>
			</td>
		</tr>
	</c:forEach>
</table> <br />

    <hr />
    <c:if test="${vo.page>1}">
    	<a href="stay_list_confirm?page=1&location=${location }&type=${type}"><i class="fa-solid fa-angles-left"></i></a>
    	<a href="stay_list_confirm?page=${vo.page-1 }&location=${location }&type=${type}"><i class="fa-solid fa-circle-chevron-left"></i></a>
    </c:if>
    
    <c:forEach begin="${vo.pageStart }" end="${vo.pageEnd }" var="i">
    	<c:choose>
    		<c:when test="${i eq vo.page }">
    				<span>${i }</span>
    		</c:when>
    		<c:otherwise>
    				<a href="stay_list_confirm?page=${i }&location=${location }&type=${type}">${i }</a>
    		</c:otherwise>
    	</c:choose>
    </c:forEach>
    
    <c:if test="${vo.page < vo.totPage }">
    	<a href="stay_list_confirm?page=${vo.page+1 }&location=${location }&type=${type}"><i class="fa-solid fa-circle-chevron-right"></i></a>
    	<a href="stay_list_confirm?page=${vo.totPage }&location=${location }&type=${type}"><i class="fa-solid fa-angles-right"></i></a>
    </c:if>

</body>
</html>