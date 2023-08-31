<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>숙소 리스트</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/stay_list_admin.css"/>
	<!-- 개별 화면 content 크기를 조절하는 방법 -->
    <style>
        #content{
            height: 2700px;
            width : 1200px;
            margin : 0 auto;
        }
    </style>
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	    $(document).ready(function() {
	        $("#searchbtn").click(function(event) {
	        	$("#location").val;
	        	$("#type").val;	        	
	        	
	            event.preventDefault(); // 기본 submit 동작 방지
	            
	            var locationValue = $("#location option:selected").val();
	            var typeValue = $("#type option:selected").val();
	            
	            $("#location").val(locationValue);
	            $("#type").val(typeValue);
	            
	            $("#form").submit();
	            
	        });	
	    });
	</script>


</head>
<body>
    <p>숙소 리스트</p>
    <hr>
    <form id="form" action="stay_list" method="post">
	    <select name="location" id="location" class="location">	    	
	        <option value="0">전체 지역</option>
	        <option value="1">서울</option>
	        <option value="2">경기</option>
	        <option value="3">인천</option>
	        <option value="4">제주</option>
	        <option value="5">전라</option>
	        <option value="6">경상</option>
	        <option value="7">충청</option>
	        <option value="8">강원</option>
	    </select>
	    <select name="type" id="type" class="type">
	        <option value="0">전체 타입</option>
	        <option value="1" >호텔</option>
	        <option value="2">모텔</option>
	        <option value="3">펜션</option>
	    </select>
	    <input type="hidden" name="location"  id="location"/>
	    <input type="hidden" name="type"  id="type"/>
	    <input type="submit" id="searchbtn" value="검색" />
    </form>
    <table style="border: 1px solid black; width: 100%">
        <tr>
            <td style="width: 10%">숙소번호</td>
            <td style="width: 30%">숙소 썸네일</td>
            <td style="width: 20%">숙소명</td>
            <td style="width: 10%">카테고리</td>
            <td style="width: 10%">별점</td>
            <td style="width: 20%">수정 및 삭제</td>
        </tr>
        
        <c:forEach items="${list }" var="list">
        	<tr>
	            <td>${list.s_no }</td>
	            <td><input type="box" style="width: 200px; height: 200px; background-color:navy;"></td>
	            <td><a href="stay_view?s_no=${list.s_no }">${list.s_name }</a></td>
	            <td>
				    <c:choose>
				        <c:when test="${list.s_loca eq 1}">호텔</c:when>
				        <c:when test="${list.s_loca eq 2}">모텔</c:when>
				        <c:when test="${list.s_loca eq 3}">펜션</c:when>
				        <c:otherwise>기타</c:otherwise>
				    </c:choose>
				</td>
	            <td><%-- ${list.s_rate } --%></td>
	            <td>
	            	<input type="button" value="수정" class="tbbtn" onclick="location.href='stay_edit?s_no=${list.s_no }'" />
	            	<input type="button" value="삭제" class="tbbtn" onclick="location.href='stay_delete?s_no=${list.s_no }'" />
	            </td>
        	</tr>
        </c:forEach>
        
    </table> <br />
    총 게시물 갯수 : ${totRowcnt } <br />
    현재페이지 / 토탈페이지 : ${searchVO.page } / ${searchVO.totPage }
    <hr />
    <c:if test="${searchVO.page>1}">
    	<a href="stay_list?page=1">처음</a>
    	<a href="stay_list?page=${searchVO.page-1 }">이전</a>
    </c:if>
    
    <c:forEach begin="${searchVO.pageStart }" end="${searchVO.pageEnd }" var="i">
    	<c:choose>
    		<c:when test="${i eq searchVO.page }">
    				<span>${i }</span>
    		</c:when>
    		<c:otherwise>
    				<a href="stay_list?page=${i }">${i }</a>
    		</c:otherwise>
    	</c:choose>
    </c:forEach>
    
    <c:if test="${searchVO.page < searchVO.totPage }">
    	<a href="stay_list?page=${searchVO.page+1 }">다음</a>
    	<a href="stay_list?page=${searchVO.totPage }">마지막</a>
    </c:if>
    
</body>
</html>