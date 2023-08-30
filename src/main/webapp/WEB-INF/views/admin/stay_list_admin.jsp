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
            height: 2000px;
            width : 1200px;
            margin : 0 auto;
        }
    </style>
</head>
<body>
    <p>숙소 리스트</p>
    <hr>
    <select name="location" id="location">
        <option value="서울">서울</option>
        <option value="경기">경기</option>
        <option value="제주">인천</option>
        <option value="강원">강원</option>
        <option value="전라">전라</option>
        <option value="경상">경상</option>
        <option value="충청">충청</option>
        <option value="강원">강원</option>
    </select>
    <select name="type" id="type">
        <option value=" " selected>인기순</option>
        <option value="별점순">별점순</option>
        <option value="댓글순">댓글순</option>
    </select>
    <table style="border: 1px solid black;">
        <tr>
            <td>NO</td>
            <td>숙소번호</td>
            <td>숙소 썸네일</td>
            <td>숙소명</td>
            <td>별점</td>
            <td>댓글</td>
            <td>수정 및 삭제</td>
        </tr>
        
        <c:forEach items="${list }" var="list">
        	<tr>
	            <td>NO</td>
	            <td>${list.s_no }</td>
	            <td><input type="box" style="width: 100px; height: 100px;"></td>
	            <td><a href="stay_view?s_no=${list.s_no }">${list.s_name }</a></td>
	            <td>별점</td>
	            <td>댓글 수</td>
	            <td>
	            	<input type="button" value="수정" onclick="location.href='stay_edit?s_no=${list.s_no }'" />
	            	<input type="button" value="삭제" onclick="location.href='stay_delete?s_no=${list.s_no }'" />
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