<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />

	<!-- 개별 화면 content 크기를 조절하는 방법 -->
	<style>
		#content{
			height: 100%;
		}
	</style>

	<style>
	
		
		@font-face {
            font-family: 'GmarketSansMedium';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

		*{
			font-family: 'GmarketSansMedium';
		}

		#form, hr{
			width: 1200px;
		}
		 .searchbox{
		     width: 150px;
		     height: 30px;
		 }
		ul{
			float: left;
			list-style: none;
			padding-left: 0;
			font-size: 30px;
		}
		ul li div{
			float: left;
		}
		#second_col{
			width: 160px;
		}
		#third_col{
			width: 830px;
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
		table{
			width: 1200px;
		}
		table tr td{
			padding-left: 0;
			font-size: 20px;
		}
		thead tr td{
			border-bottom: 1px solid black;
		}
		.left-menubar{
			padding: 30px 0 30px 0;
			width: 170px;
			font-size: 30px;
		}
		#paging{
			text-align: center;
		}
		.button{
            background-color: #011343;
            color: #EBD01C;
            font-weight: bold;
            border-radius: 3px;
            width: 100px;
            height: 32px;
            cursor: pointer;
        }
	</style>
	
</head>
<body>
	
	<h1>알림</h1>
	<div id="form">
		<form action="pushal">
			<input type="hidden" name="m_no" value="${sessionScope.m_no}" />
			<input type="hidden" name="page" value="1" />
			<div>
				<br />
				<span>
					<select class="searchbox" id ="searchType" name="searchType" >
						<c:if test="${empty searchType || searchType eq 0}">
							<option value="0" selected>전체 조회</option>
							<option value="1">결제</option>
							<option value="2">환불</option>
							<option value="3">배송</option>
						</c:if>
						<c:if test="${searchType eq 1}">
							<option value="0">전체 조회</option>
							<option value="1" selected>결제</option>
							<option value="2">환불</option>
							<option value="3">배송</option>
						</c:if>
						<c:if test="${searchType eq 2}">
							<option value="0">전체 조회</option>
							<option value="1">결제</option>
							<option value="2" selected>환불</option>
							<option value="3">배송</option>
						</c:if>
						<c:if test="${searchType eq 3}">
							<option value="0">전체 조회</option>
							<option value="1">결제</option>
							<option value="2">환불</option>
							<option value="3" selected>배송</option>
						</c:if>
					</select>
				</span>
				<span><input type="submit" class="button" value="검색"></span>
			</div>
			<br /><br />
			<div>
				<table id="right-table">
					<thead>
						<tr>
							<td width="130px" >번호</td>
							<td width="400px">알림 내용</td>
							<td width="400px">알림 일자</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="list" varStatus="st">
							<tr>
								<td class="right-value">${st.index + 1}</td>
								<td class="right-value"><a href="${list.order_no}">${ list.al_content }</a></td>
								<td class="right-value">${list.al_time}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<br /><br />
			<div>
				<c:if test="${empty list}">
	    	 		<div id="warning_content" >
	    	 			<img id="warning_img" src="resources/img/No_Search.jpeg" alt="이미지 없음"/>
	    	 			<br />
		    	 		<span id="warning_text">해당 알림이 없습니다.</span>
		    	 		<br /><br /><br />
	    	 		</div>
	    	 	</c:if>
				<c:if test="${not empty list}">
					<div id="paging">
						<c:if test="${vo.page>1}">
							<a href="pushal?m_no=${param.m_no}&page=1&searchType=${param.searchType}"><i class="fa-solid fa-angles-left"></i></a>
							<a href="pushal?m_no=${param.m_no}&page=${vo.page-1 }&searchType=${param.searchType}"><i class="fa-solid fa-circle-chevron-left"></i></a>
						</c:if>
						<c:forEach begin="${vo.pageStart}" end="${vo.pageEnd }" var="i">
						
							<c:choose>
								<c:when test="${ i ne param.page }">
									<a href="pushal?m_no=${param.m_no}&page=${i}&searchType=${searchType}">${i}</a>
								</c:when>
								<c:otherwise>
									<span>${i}</span>
								</c:otherwise>
							</c:choose>
							
						</c:forEach>
						<c:if test="${vo.page < vo.totPage}">
							<a href="pushal?m_no=${param.m_no}&page=${vo.page+1 }&searchType=${param.searchType}"><i class="fa-solid fa-circle-chevron-right"></i></a>
							<a href="pushal?m_no=${param.m_no}&page=${vo.totPage }&searchType=${param.searchType}"><i class="fa-solid fa-angles-right"></i></a>
						</c:if>
					</div>
				</c:if>
			</div>
		</form>
	</div>	
	
</body>
</html>