<%@page import="com.travel.dao.user.IDao_pushal_user"%>
<%@page import="com.travel.dto.user.DTO_pushal_user"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
</head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/pushal.css">
<!-- <link rel="stylesheet" href="resources/css/user/notice.css"> -->
<style>
#warning_content {
	text-align: center;
}

#warning_img {
	width: 150px;
	height: 150px;
	margin: 0 auto;
}

#warning_text {
	font-size: 20px;
	font-weight: bolder;
}
</style>
<body>
	<div id="con">
		<div id="menu">
			<nav>
				<ul>
					<li id="notice_text">
						<p id="notice">
							알림
						<i class="fa-solid fa-bell" style="color: #ebd01c; font-size: 40px;"></i>
						</p>
						<hr id="menu_bar">
					</li>
					<li class="page_list">
					<a href="pushalpayment?m_no=${sessionScope.m_no }&page=1" class="menu" id="payment">결제</a>
					</li>
					<li class="page_list">
					<a href="pushalrefund?m_no=${sessionScope.m_no }&page=1" class="menu" id="refund">환불</a>
					</li>
					<li class="page_list">
					<a href="pushaldelivery?m_no=${sessionScope.m_no }&page=1" class="menu" id="delivery">배송</a>
					</li>
				</ul>
			</nav>
		</div>
		<div id="Whole">
			<div id="title">
				환불 현황
				<hr>
			</div>
			<div id="table">
				<table>
					<tr>
						<td>
							<c:forEach items="${dto }" var="refund">
								<div id="data_form">
									<!-- 링크로 넘어게가끔 해놓음, 클릭시 데이터 넘어감 -->
									<a href="refundcheck?m_no=${refundinfo.m_no }"
										id="data"
										onclick="refunnd('${refund.al_no}',
														 '${refund.al_content }',
														  ${refund.order_no })">
									
										알림번호 : ${refund.al_no } <br/>
										환불내용 : ${refund.al_content } <br/>
										환불번호 : ${refund.order_no }
									</a>
									<hr id="content_bar">
								</div>
							</c:forEach>
						</td>
					</tr>
				</table>
			</div>
			<c:if test="${empty dto}">
		    	 		<div id="warning_content" >
		    	 			<i class="fa-solid fa-circle-exclamation" 
							   style="color: #f00a38; font-size: 100px;"></i>
		    	 			<br /><br/>
			    	 		<span id="warning_text">환불 내역이 존재하지 않습니다.</span>
			    	 		<br /><br /><br />
		    	 		</div>
		    </c:if>
			 <div id="paging" style="text-align: center;">
        		<c:if test="${vo.page>1}">
					<a href="pushalrefund?m_no=${param.m_no}&page=1"><i class="fa-solid fa-angles-left"></i></a>
					<a href="pushalrefund?m_no=${param.m_no}&page=${vo.page-1 }"><i class="fa-solid fa-circle-chevron-left"></i></a>
				</c:if>
	        	<c:forEach begin="${vo.pageStart}" end="${vo.pageEnd }" var="i">
	        		<c:choose>
	        			<c:when test="${ i ne param.page }">
	        				<a href="pushalrefund?m_no=${param.m_no}&page=${i}">${i}</a>
	        			</c:when>
	        			<c:otherwise>
	        				<span>${i}</span>
	        			</c:otherwise>
	        		</c:choose>
	        		
	        	</c:forEach>
	        	<c:if test="${vo.page < vo.totPage}">
					<a href="pushalrefund?m_no=${param.m_no}&page=${vo.page+1 }"><i class="fa-solid fa-circle-chevron-right"></i></a>
					<a href="pushalrefund?m_no=${param.m_no}&page=${vo.totPage }"><i class="fa-solid fa-angles-right"></i></a>
				</c:if>
        	</div>
		</div>
	</div>
</body>
</html>