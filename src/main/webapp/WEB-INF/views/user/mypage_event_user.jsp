<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
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
                     <td>이벤트 img</td>
                     <td>이벤트 img</td>
                     <td>이벤트 img</td>
                  </tr>
               </table>
            </div>
         </div>
         <div id="finish">
            <div id="event_text">
               <p>종료 <b>※ 당첨된 이벤트만 표시됩니다.</b></p>
            </div>
            <div id="table">
               <table id="event_table">
                  <tr>
                     <td>이벤트 img</td>
                     <td>이벤트 img</td>
                     <td>이벤트 img</td>
                  </tr>
               </table>
            </div>
         </div>
      </div>
   </div>
</body>


</html>