<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/user/reviewT_user.css" />
<script src="resources/js/user/star_user.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>

<!-- 평점에 맞춰 색변화 -->
<script>
	function callrating(reviewNo, rate) {
		/* alert("review_rate : " + rate); */
		var starElement = document.getElementById("star2_" + reviewNo);
		starElement.style.width = rate * 20 + "%";
	}
</script>
</head>
<body onload="callrating();">
	
	<a href="review_writeview_user">위치는 이동해야하지만 어쨋든 후기쓰기</a>
	<div class="container">
		<div class="a">
			<div class="aa">객실</div>
			<div class="aa">숙소정보</div>
			<div class="aa">후기</div>
		</div>
		<div class="b">
			<div class="repl">후기(${totalRCont })</div>
			<div class="star_avg">
				<span>☆</span> <span id="st1">${rateAvg }</span> <span id="st2">/5</span>

			</div>
		</div>
		
		<!-- 검색기능 -->
		<form action="review_list_user" method="post">
		<div class="sft">
			<select name="rS" id="c1">
				<option value="RoomA">객실전체</option>
				<option value="Room1">객실1</option>
				<option value="Room2">객실2</option>
				<option value="Room3">객실3</option>
			</select> 
			<br> 
			<select name="fS" id="tAndRS">
				<option value="lately">최신순</option>
				<option value="likerate">인기순</option>
			</select>
			<div id="pS">포토후기만 보기 
				<c:choose>
					<c:when test="${pS }">
						<input type="checkbox" name="pS" value="pS" checked />
					</c:when>
					<c:otherwise>
							<input type="checkbox" name="pS" value="pS" />
					</c:otherwise>
				</c:choose>
			
				<input type="submit" value="검색"/>
			
				<!-- 포토후기만 보기 <input type="checkbox" name="pS" value="pS"> -->
				
			</div>
		</div>
		</form>
	</div>

	<!-- 평점 -->
	<c:forEach items="${rlist}" var="dto">
    <div class="container">
        <div class="d">
            <div class="dt">
                <span class="star"> ★★★★★ <span id="star2_${dto.review_no}" style="width: ${dto.review_rate * 20}%;">★★★★★</span> <input
                        type="range"
                        value="${dto.review_rate}" step="1" min="1" max="5" oninput="callrating('${dto.review_no}', this.value);">
                </span>
            </div>
            <div class="dl">이메일 : ${dto.m_no }&nbsp;&nbsp;&nbsp;&nbsp;
                / 등록일 : ${dto.review_date }</div>
            <div class="dr">
                <a href="review_user_like?review_no=${dto.review_no }"><input type="button" value="좋아요"></a>
              <%--   <a href="review_report?review_no=${dto.review_no }"><input type="button" value="신고"></a> --%>
             <%-- <a href="locallhost:8090/travel/user?review_no=${dto.review_no }"><input type="button" value="신고"></a> --%>
             <a href="report?review_no=${dto.review_no }"><input type="button" value="신고"></a>
            </div>
            <div class="db">
                <textarea name="" id="review_content" cols="156" rows="2">${dto.review_content }::::${dto.review_rate*20}%</textarea>
            </div>
        </div>
        <c:if test="${dto.photo_url ne null }">
            <div class="image-container">
                <img src="resources/upload_img/user/review/${dto.photo_url }" alt="reviewP" /> 
            </div>
        </c:if>
    </div>
</c:forEach>

</body>
</html>