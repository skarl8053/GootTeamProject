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
		/* 
		
			이름 : 신재환
			작업 : 이벤트 게시판 (유저)
			
		 */
		
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
		     margin: auto;
		 }
		 #keyword{
		     width: 280px;
		     height: 29px;
		     margin: auto;
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
		     margin: auto;
		 }
		 td {
		 	border-bottom: 1px solid #f6f6f6;
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
			margin: auto;
		}
		.event_img {
			width : 250px;
			height : 250px;
		}
    </style>
	
	<script>
		function searchExecute(){
	
	        var searchType = document.getElementById("searchType").value;
	        var keyword = document.getElementById("keyword").value;
	        
	        // 검색 결과 조회
	        location.replace("event_notice?page=1&searchType=" + searchType + "&keyword="+ keyword);
	        
	    }
	</script>
	
</head>
<body>

    <!-- 메인 -->
    <h1>이벤트 게시판</h1>

    <form action="event_notice">
    
    	<input type="hidden" name="page" value="1" />
    	
    	<div>
    		<br />
    		<span>
    		
    			<select class="searchbox" id ="searchType" name="searchType" >
		           	<c:if test="${empty searchType || searchType eq 1}">
		                <option value="1" selected>전체 조회</option>
		                <option value="2">이벤트 시작 전</option>
		                <option value="3">이벤트 진행 중</option>
		                <option value="4">이벤트 종료</option>
		            </c:if>
		            <c:if test="${searchType eq 2}">
		                <option value="1">전체 조회</option>
		                <option value="2" selected>이벤트 시작 전</option>
		                <option value="3">이벤트 진행 중</option>
		                <option value="4">이벤트 종료</option>
		            </c:if>
		            <c:if test="${searchType eq 3}">
		                <option value="1">전체 조회</option>
		                <option value="2">이벤트 시작 전</option>
		                <option value="3" selected>이벤트 진행 중</option>
		                <option value="4">이벤트 종료</option>
		            </c:if>
		            <c:if test="${searchType eq 4}">
		                <option value="1">전체 조회</option>
		                <option value="2">이벤트 시작 전</option>
		                <option value="3">이벤트 진행 중</option>
		                <option value="4" selected>이벤트 종료</option>
		            </c:if>
		        </select>
		        
    		</span>
    		<span>
    		
    			<c:if test="${empty keyword || keyword eq ''}">
            		<input type="text" id="keyword" name="keyword" placeholder="검색할 이벤트 이름을 입력해주세요" autocomplete="off">
            	</c:if>
                <c:if test="${keyword != ''}">
            		<input type="text" id="keyword" name="keyword" value="${keyword}" autocomplete="off">
            	</c:if>
            	
    		</span>
    		<span>
    		
    			<input type="button" class="button" value="검색" onclick="searchExecute();">
    			
    		</span>
    	</div>
    	<br><br>
    	<div>
    		
    		<table>
	            <thead>
                    <tr>
		                <td width="10%">이벤트 번호</td>
		                <td width="20%">이벤트 명</td>
		                <td width="32%">이벤트 이미지</td>
		                <td width="15%">이벤트 진행 상태</td>
		                <td width="20%">이벤트 기간</td>
                    </tr>
                </thead>
     
                	<c:forEach items="${event_list}" var="event_list">
		            	<tr>
			                <td>${event_list.event_no }</td>
			                <td>${event_list.event_name }</td>
			                <%-- <td><a href="#"><img src="resources/upload_img/admin/event/${event_list.filename2 }" alt="" /></a></td> --%>
			                <td><a href="event_page?event_no=${event_list.event_no }"><img  class="event_img" src="../admin/resources/upload_img/admin/event/${event_list.filename2 }" alt="" /></a></td>
			                <td>
			                		<c:if test="${event_list.event_flag_num eq 1 }">
			                			<span>이벤트 시작 전</span>
			                		</c:if>
			                		<c:if test="${event_list.event_flag_num eq 2 }">
			                			<span>이벤트 진행중</span>
			                		</c:if>
			                		<c:if test="${event_list.event_flag_num eq 3 }">
			                			<span>이벤트 종료</span>
			                		</c:if> 
			                </td>
			                <td>${event_list.event_startdate } ~ <br />
			                	${event_list.event_enddate }</td>
			            </tr>
		            </c:forEach>
	            
	        </table>
    		<br /><br />
    	</div>
    	<div>
        	<br />
        	<div id="paging">
        		<c:if test="${vo.page>1}">
					<a href="event_notice?page=1&searchType=${param.searchType}&keyword=${param.keyword}"><i class="fa-solid fa-angles-left"></i></a>
					<a href="event_notice?page=${vo.page-1 }&searchType=${param.searchType}&keyword=${param.keyword}"><i class="fa-solid fa-circle-chevron-left"></i></a>
				</c:if>
	        	<c:forEach begin="${vo.pageStart}" end="${vo.pageEnd }" var="i">
	        	
	        		<c:choose>
	        			<c:when test="${ i ne param.page }">
	        				<a href="event_notice?page=${i}&searchType=${searchType}&keyword=${keyword}">${i}</a>
	        			</c:when>
	        			<c:otherwise>
	        				<span>${i}</span>
	        			</c:otherwise>
	        		</c:choose>
	        		
	        	</c:forEach>
	        	<c:if test="${vo.page < vo.totPage}">
					<a href="event_notice?page=${vo.page+1 }&searchType=${param.searchType}&keyword=${param.keyword}"><i class="fa-solid fa-circle-chevron-right"></i></a>
					<a href="event_notice?page=${vo.totPage }&searchType=${param.searchType}&keyword=${param.keyword}"><i class="fa-solid fa-angles-right"></i></a>
				</c:if>
        	</div>
        </div>
    	<div>
    	 	
    	</div>
    </form>
    
</body>
</html>