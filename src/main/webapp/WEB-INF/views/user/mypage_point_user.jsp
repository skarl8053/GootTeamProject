<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 포인트/쿠폰</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/user/mypage_point.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
</head>
<style>
#content {
	width: auto;
	height: 1500px;
}
</style>
<body>
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
					<li class="page_list"><a href="./mypage_pay?page=1"
						class="menu" id="pay">결제 내역</a> <br></li>
					<li class="page_list"><a href="./mypage_review?page=1"
						class="menu" id="review">숙소 후기</a> <br></li>
					<li class="page_list"><a
						href="./mypage_event?ing_page=1&end_page=1" class="menu"
						id="event">이벤트</a> <br></li>
					<li class="page_list"><a
						href="./mypage_point?point_page=1&coupon_page=1" class="menu"
						id="coupon">포인트 / 쿠폰</a> <br></li>
				</ul>
			</nav>
		</div>
		<div id="Whole">
			<div id="title_point">
				포인트
				<hr>
			</div>
			<div id="table">
				<table id="point_table">
					<tr>
						<th class="No" width="10%" height="15px">No</th>
						<th class="Date" width="15%">날짜</th>
						<th class="content" width="25%">내역</th>
						<th class="point" width="20%">Point In</th>
						<th class="point" width="20%">Point Out</th>
					</tr>
					<c:choose>
						<c:when test="${empty dto_point}">
							<tr>
								<td colspan="5"><img src="resources/img/No_Search.jpeg"
									width="150px" height="150px" /> <br /> <br /> 사용 가능한 포인트가
									없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${dto_point}" var="dto">
								<tr>
									<td height="40px">${dto.row_num}</td>
									<td>${dto.point_usedate}</td>
									<c:choose>
										<c:when test="${dto.point_type == 1}">
											<td>숙박 예약 획득</td>
										</c:when>
										<c:when test="${dto.point_type == 2}">
											<td>숙박 예약 차감</td>
										</c:when>
									</c:choose>
									<td>${dto.point_in}</td>
									<td>${dto.point_out}</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
				<div id="all_point">
					<p id="p_point">총 포인트 :</p>
					<c:choose>
						<c:when test="${empty dto_point }">
							<input type="text" value="0 p" disabled>
						</c:when>
						<c:otherwise>
							<input type="text" value="${dto_point[0].m_point} p" disabled>
						</c:otherwise>
					</c:choose>
				</div>

				<!-- Pagination for Points -->
				<div id="paging">
					<c:if test="${vo1.page > 1}">
						<a
							href="./mypage_point?point_page=1&coupon_page=${param.coupon_page}"><i
							class="fa-solid fa-angles-left"></i></a>
						<a
							href="./mypage_point?point_page=${vo1.page - 1}&coupon_page=${param.coupon_page }"><i
							class="fa-solid fa-circle-chevron-left"></i></a>
					</c:if>
					<c:forEach begin="${vo1.pageStart}" end="${vo1.pageEnd}" var="i">
						<c:choose>
							<c:when test="${i ne vo1.page}">
								<a
									href="./mypage_point?point_page=${i}&coupon_page=${param.coupon_page}">${i}</a>
							</c:when>
							<c:otherwise>
								<span>${i}</span>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${vo1.page < vo1.totPage}">
						<a
							href="./mypage_point?point_page=${vo1.page + 1}&coupon_page=${param.coupon_page }"><i
							class="fa-solid fa-circle-chevron-right"></i></a>
						<a
							href="./mypage_point?point_page=${vo1.totPage}&coupon_page=${param.coupon_page}"><i
							class="fa-solid fa-angles-right"></i></a>
					</c:if>
				</div>


				<div id="title_coupon">
					쿠폰
					<hr>
				</div>
				<div id="table">
					<div class="coupon_text">
						<p>보유 현황</p>
					</div>
					<div id="own_coupon">
						<table class="coupon_table">
							<tr>
								<th class="No" width="15%" height="15px">No</th>
								<th class="Date" width="30%">쿠폰명</th>
								<th class="content" width="30%">수량</th>
							</tr>
							<c:choose>
								<c:when test="${empty dto_coupon }">
									<td colspan="3"><img src="resources/img/No_Search.jpeg"
										width="150px" height="150px" /> <br /> <br /> 보유 중인 쿠폰이
										없습니다.</td>
								</c:when>
								<c:otherwise>
									<c:forEach items="${dto_coupon }" var="dto">
										<tr>
											<td height="40px">${dto.row_number }</td>
											<td>${dto.coupon_no }</td>
											<td>${dto.coupon_qty }</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</table>
						<div id="all_coupon">
							<p id="p_coupon">총 쿠폰 개수 :</p>
							<c:set var="totalCouponQuantity" value="0" />
							<c:forEach items="${dto_coupon}" var="dto">
								<c:set var="totalCouponQuantity"
									value="${totalCouponQuantity + dto.coupon_qty}" />
							</c:forEach>
							<input type="text" value="${totalCouponQuantity} 장" disabled>
						</div>
					</div>



					<div class="coupon_text">
						<p>사용 내역</p>
					</div>
					<div id="use_coupon">
						<table class="coupon_table">
							<tr>
								<th class="No" width="15%" height="15px">No</th>
								<th class="Date" width="25%">쿠폰명</th>
								<th class="content" width="30%">사용 날짜</th>
								<th class="point" width="30%">사용 내역</th>
							</tr>
							<c:choose>
								<c:when test="${empty dto_usecoupon }">
									<td colspan="4"><img src="resources/img/No_Search.jpeg"
										width="150px" height="150px" /> <br /> <br /> 쿠폰 사용 내역이
										없습니다.</td>
								</c:when>
								<c:otherwise>
									<c:forEach items="${dto_usecoupon }" var="dto">
										<tr>
											<td>${dto.row_number }</td>
											<td>${dto.coupon_no }</td>
											<td>${dto.coupon_usedate }</td>
											<td><a
												href="../member/mypage_receipt_popup?m_no=${sessionScope.m_no }&order_no=${dto.order_no}"
												id="receipt_link">구매 내역</a></td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</table>

						<!-- Pagination for Points -->
						<div id="paging">
							<c:if test="${vo2.page > 1}">
								<a
									href="./mypage_point?point_page=${param.point_page }&coupon_page=1"><i
									class="fa-solid fa-angles-left"></i></a>
								<a
									href="./mypage_point?point_page=${param.point_page }&coupon_page=${vo2.page - 1}"><i
									class="fa-solid fa-circle-chevron-left"></i></a>
							</c:if>

							<c:forEach begin="${vo2.pageStart}" end="${vo2.pageEnd}" var="i">
								<c:choose>
									<c:when test="${i ne vo2.page}">
										<a
											href="./mypage_point?point_page=${param.point_page }&coupon_page=${i}">${i}</a>
									</c:when>
									<c:otherwise>
										<span>${i}</span>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${vo2.page < vo2.totPage}">
								<a
									href="./mypage_point?point_page=${param.point_page}&coupon_page=${vo2.page + 1}"><i
									class="fa-solid fa-circle-chevron-right"></i></a>
								<a
									href="./mypage_point?point_page=${param.point_page}&coupon_page=${vo2.totPage}"><i
									class="fa-solid fa-angles-right"></i></a>
							</c:if>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>


</html>