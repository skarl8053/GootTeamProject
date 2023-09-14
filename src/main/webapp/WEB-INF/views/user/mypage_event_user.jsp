<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 이벤트</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/user/mypage_event.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
</head>
<style>
#content {
	width: auto;
	height: auto;
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
					<li class="page_list"><a href="./mypage_pay" class="menu"
						id="pay">결제 내역</a> <br></li>
					<li class="page_list"><a href="./mypage_review" class="menu"
						id="review">숙소 후기</a> <br></li>
					<li class="page_list"><a href="./mypage_event?ing_page=1&end_page=1" class="menu"
						id="event">이벤트</a> <br></li>
					<li class="page_list"><a
						href="./mypage_point?point_page=1&coupon_page=1" class="menu"
						id="coupon">포인트 / 쿠폰</a> <br></li>
				</ul>
			</nav>
		</div>
		<div id="Whole">
			<div id="title">
				이벤트
				<hr>
			</div>
			<div id="attend">
				<div id="event_text">
					<p>참가중</p>
				</div>
				<div id="table">
					<table id="event_table">
						<tr>
							<c:forEach items="${dtoS }" var="dto">
								<td class="event_img"><a
									href="user/event_page?event_no=${dto.event_no }"> <img
										src="resources/upload_img/${dto.filename2 }"
										alt="진행중인 이벤트 사진 없음" />
								</a></td>
							</c:forEach>
						</tr>
					</table>
				</div>
				<!-- 참가중인 이벤트 페이징 -->
				<div class="paging">
					<c:if test="${vo1.page > 1}">
						<a href="./mypage_event?ing_page=1&end_page=${param.end_page}"><i
							class="fa-solid fa-angles-left"></i></a>
						<a
							href="./mypage_event?ing_page=${vo1.page - 1}&end_page=${param.end_page }"><i
							class="fa-solid fa-circle-chevron-left"></i></a>
					</c:if>
					<c:forEach begin="${vo1.pageStart}" end="${vo1.pageEnd}" var="i">
						<c:choose>
							<c:when test="${i ne vo1.page}">
								<a
									href="./mypage_event?ing_page=${i}&end_page=${param.end_page}">${i}</a>
							</c:when>
							<c:otherwise>
								<span>${i}</span>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${vo1.page < vo1.totPage}">
						<a
							href="./mypage_event?ing_page=${vo1.page + 1}&end_page=${param.end_page }"><i
							class="fa-solid fa-circle-chevron-right"></i></a>
						<a
							href="./mypage_event?ing_page=${vo1.totPage}&end_page=${param.end_page}"><i
							class="fa-solid fa-angles-right"></i></a>
					</c:if>
				</div>
			</div>


			<div id="finish">
				<div id="event_text">
					<p>
						종료 <b>※ 당첨된 이벤트만 표시됩니다.</b>
					</p>
				</div>
				<div id="table">
					<table id="event_table">
						<tr>
							<c:forEach items="${dtoE }" var="dto">
								<td class="event_img"><a
									href="user/event_page?event_no=${dto.event_no }"> <img
										src="resources/upload_img/${dto.filename2 }"
										alt="종료된 이벤트 사진 없음" />
								</a></td>
							</c:forEach>
						</tr>
					</table>
				</div>
			</div>
			<!-- 종료 이벤트 페이징 -->
			<div class="paging">
				<c:if test="${vo2.page > 1}">
					<a
						href="./mypage_event?ing_page=${param.ing_page }&end_page=1"><i
						class="fa-solid fa-angles-left"></i></a>
					<a
						href="./mypage_event?ing_page=${param.ing_page }&end_page=${vo2.page - 1}"><i
						class="fa-solid fa-circle-chevron-left"></i></a>
				</c:if>

				<c:forEach begin="${vo2.pageStart}" end="${vo2.pageEnd}" var="i">
					<c:choose>
						<c:when test="${i ne vo2.page}">
							<a
								href="./mypage_event?ing_page=${param.ing_page }&end_page=${i}">${i}</a>
						</c:when>
						<c:otherwise>
							<span>${i}</span>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${vo2.page < vo2.totPage}">
					<a
						href="./mypage_event?ing_page=${param.ing_page}&end_page=${vo2.page + 1}"><i
						class="fa-solid fa-circle-chevron-right"></i></a>
					<a
						href="./mypage_event?ing_page=${param.ing_page}&end_page=${vo2.totPage}"><i
						class="fa-solid fa-angles-right"></i></a>
				</c:if>
			</div>
		</div>
	</div>
</body>


</html>