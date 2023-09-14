<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 숙소후기</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/user/mypage_review.css" />
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
				숙소 후기
				<hr>
			</div>
			<div id="table">
				<table id="review_table">
					<c:choose>
						<c:when test="${empty dto }">
							<tr>
								<td id="no_img" colspan="5"><img src="resources/img/No_Search.jpeg"  style="width: 150px; height: 150px; padding-top: 50px;"/> <br /><br />
								등록된 후기가 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${dto }" var="dto">
								<tr>
									<td class="border_bottom" rowspan="3" width="5%" >${dto.review_no }</td>

									<td class="border_bottom" rowspan="3" width="30%" height="350px">
										<c:if test="${not empty dto.photo_url}">
											<img src="resources/upload_img/admin/stay/${dto.photo_url }" alt="이미지 X"  id="s_img"/>
										</c:if>
										<c:if test="${empty dto.photo_url }">
											<img src="resources/img/No_Image.png" alt="이미지 X"  id="s_img"/>
										</c:if>
									</td>
									<td colspan="3" height="70px" 
										style="text-align: left; padding-left: 20px; padding-top:10px;"><a href="user/stay_detail_user?s_no=${dto.s_no }&m_no=${sessionScope.m_no }" id="stay_name">${dto.s_name }</a></td>
									</tr>
									<tr>
										<td class="border_bottom" rowspan="2" width="50%"
											style="text-align: left; padding-left: 20px;">${dto.review_content }</td>
										<td colspan="2"></td>
									</tr>
									<tr>
										<td class="border_bottom" width="60px" height="80px"><img
											src="resources/img/user/review/reviewLikeIcon.png"
											alt="좋아용" width="40px" height="40px" /></td>
										<td class="border_bottom" width="30px">${dto.likes }</td>
									</tr>
					</c:forEach>
					</c:otherwise>
					</c:choose>
				</table>
				<div id="paging">
					<c:if test="${vo.page>1}">
						<a href="mypage_review?page=1"><i class="fa-solid fa-angles-left"></i></a>
						<a href="mypage_review?page=${vo.page-1 }"><i
							class="fa-solid fa-circle-chevron-left"></i></a>
					</c:if>

					<c:forEach begin="${vo.pageStart}" end="${vo.pageEnd }" var="i">
						<c:choose>
							<c:when test="${ i ne param.page}">
								<a href="mypage_review?page=${i}">${i}</a>
							</c:when>
							<c:otherwise>
								<span>${i}</span>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:if test="${vo.page < vo.totPage }">
						<a href="mypage_review?page=${vo.page+1 }"><i
							class="fa-solid fa-circle-chevron-right"></i></a>
						<a href="mypage_review?page=${vo.totPage }"><i
							class="fa-solid fa-angles-right"></i></a>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</body>


</html>