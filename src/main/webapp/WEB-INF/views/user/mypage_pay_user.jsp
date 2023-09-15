<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 결제내역</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/user/mypage_pay.css" />
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />

</head>
<style>
#content {
	width: auto;
	min-height: 700px;
	height : auto;
}
</style>
<body>
<input type="hidden" value="1" name="page" />
	<div id="con">
		<div id="menu">
			<nav>
				<ul>
					<li id="MyPage_text">
						<p id="MyPage">My Page</p>
						<hr id="menu_bar">
					</li>
					<li class="page_list"><a href="./mypage_info" class="menu"
						id="info">기본 회원 정보</a> <br></li>
					<li class="page_list"><a href="./mypage_pay?page=1" class="menu"
						id="pay">결제 내역</a> <br></li>
					<li class="page_list"><a href="./mypage_review?page=1" class="menu"
						id="review">숙소 후기</a> <br></li>
					<li class="page_list"><a href="./mypage_event?ing_page=1&end_page=1" class="menu"
						id="event">이벤트</a> <br></li>
					<li class="page_list"><a href="./mypage_point?point_page=1&coupon_page=1" class="menu"
						id="coupon">포인트 / 쿠폰</a> <br></li>
				</ul>
			</nav>
		</div>
		<div id="Whole">
			<div id="title">
				결제 내역
				<hr>
			</div>
			<div id="table">
				<table id="pay_table">
					<tr>
						<th width="5%" height="50px">No</th>
						<th width="25%">숙소 정보</th>
						<th width="25%">객실 정보</th>
						<th width="15%">숙박일</th>
						<th width="15%">예약일</th>
						<th width="15%">상태</th>
					</tr>
					<c:choose>
						<c:when test="${empty dto }" >
							<tr>
								<td colspan="6"><img src="resources/img/No_Search.jpeg" width="150px" height="150px" /> <br /><br />
								결제 내역이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${dto }" var="dto"  varStatus="loop">
								<tr>
									<td height="200px">${dto.row_num }</td>
									<td><a href="stay_detail_user?s_no=${dto.s_no }" id="s_link"><img src="resources/upload_img/admin/stay/${dto.s_img1 }"  id="s_img"/><br />
											${dto.s_name }</a></td>
									<td>
											<c:forEach items="${r_name[loop.index]}" var="r_name" >
           								    		${r_name } <br />
          									 </c:forEach>
									</td>
									<td>${dto.check_in_date }<br />~ <br />${dto.check_out_date }
									</td>
									<td>${dto.order_date }</td>
									<c:choose>
									<c:when test="${dto.step_flag eq 1 }">
									<td>환불 검토 중</td>
									</c:when>
									<c:when test="${dto.step_flag eq 2 }">
									<td><a href="../member/mypage_refundreceipt_popup?m_no=${sessionScope.m_no}&order_no=${dto.order_no}"  id="refund_link">환불 내역</a></td>
									</c:when>
									<c:when test="${dto.step_flag eq 3 }">
									<td><a href="../member/mypage_refund_popup?m_no=${sessionScope.m_no}&order_no=${dto.order_no}"  id="refund_link">환불 신청</a></td>
									</c:when>
									<c:when test="${dto.step_flag eq 4 }">
									<td><a href="./review_writeview_user?m_no=${sessionScope.m_no}&s_no=${dto.s_no}&r_no=${dto.r_no}&order_no=${dto.order_no}" id="review_link">후기 작성</a> <br />
									<a href="../member/mypage_receipt_popup?m_no=${sessionScope.m_no }&order_no=${dto.order_no}" class="receipt_link">구매 내역</a></td>
									</c:when>
									<c:when test="${dto.step_flag eq 5 }">
									<td><a href="../member/mypage_receipt_popup?m_no=${sessionScope.m_no }&order_no=${dto.order_no}" class="receipt_link">구매 내역</a></td>
									</c:when>
									</c:choose>
								
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>

				<div id="paging">
        		<c:if test="${vo.page>1}">
					<a href="mypage_pay?page=1"><i class="fa-solid fa-angles-left"></i></a>
					<a href="mypage_pay?page=${vo.page-1 }"><i class="fa-solid fa-circle-chevron-left"></i></a>
				</c:if>
				
			<c:forEach begin="${vo.pageStart}" end="${vo.pageEnd }" var="i">
				<c:choose>
					<c:when test="${ i ne param.page}">
						<a href="mypage_pay?page=${i}">${i}</a>
					</c:when>
					<c:otherwise>
						<span>${i}</span>
					</c:otherwise>
				</c:choose>
			</c:forEach>

				<c:if test="${vo.page < vo.totPage }">
					<a href="mypage_pay?page=${vo.page+1 }"><i class="fa-solid fa-circle-chevron-right"></i></a>
					<a href="mypage_pay?page=${vo.totPage }"><i class="fa-solid fa-angles-right"></i></a>
				</c:if>
        	</div>
			</div>
		</div>
	</div>
</body>
	<c:if test="${not empty msg}">      
      <script>
         alert("${msg}");
         location.replace("mypage_pay?page=1")
      </script>
   </c:if>

</html>