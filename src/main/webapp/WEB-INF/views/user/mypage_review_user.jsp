<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
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
#content{
	width:auto;
	height:auto;
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
              <li class="page_list">
                  <a href="./mypage_info" class="menu" id="info">기본 회원 정보</a> <br>
               </li>
               <li class="page_list">
                  <a href="./mypage_pay" class="menu" id="pay">결제 내역</a> <br>
               </li>
               <li class="page_list">
                  <a href="./mypage_review" class="menu" id="review">숙소 후기</a> <br>
               </li>
               <li class="page_list">
                  <a href="./mypage_event" class="menu" id="event">이벤트</a> <br>
               </li>
               <li class="page_list">
                  <a href="./mypage_point" class="menu" id="coupon">포인트 / 쿠폰</a> <br>
               </li>
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
               <tr>
                  <td class="border_bottom" rowspan="3" width="10%" height="350px">No</td>
                  <td class="border_bottom" rowspan="3" width="30%">후기 img</td>
                  <td colspan="3" height="70px"><a href="#">후기 제목</a></td>
               </tr>
               <tr>
                  <td class="border_bottom" rowspan="2" width="40%">후기 내용</td>
                  <td colspan="2"></td>
               </tr>
               <tr>        
                  <td class="border_bottom" width="5%" height="50px">좋아요 이미지</td>
                  <td class="border_bottom" width="10%">좋아요개수</td>
               </tr>
            </table>
         </div>
      </div>
   </div>
</body>


</html>