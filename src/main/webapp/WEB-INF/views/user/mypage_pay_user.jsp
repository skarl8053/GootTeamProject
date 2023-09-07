<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
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
            결제 내역
            <hr>
         </div>
         <div id="table">
            <table id="pay_table">
                  <tr>
                     <th width="10%">No</th>
                     <th width="15%">숙소 정보</th>
                     <th width="25%">예약 날짜</th>
                     <th width="20%">예약일</th>
                     <th width="20%">상태</th>
                  </tr>
                  <tr>
                     <td height="200px">번호</td>
                     <td><a href="#">이미지 및 링크</a></td>
                     <td>예약 날짜</td>
                     <td>예약일</td>
                     <td><a href="#">후기 작성</a></td>
                  </tr>
                  <tr>
                     <td  height="200px">번호</td>
                     <td><a href="#">이미지 및 링크</a></td>
                     <td>예약 날짜</td>
                     <td>예약일</td>
                     <td>입금 확인</td>
                  </tr>
                  <tr>
                     <td  height="200px">번호</td>
                     <td><a href="#">이미지 및 링크</a></td>
                     <td>예약 날짜</td>
                     <td>예약일</td>
                     <td><a href="#">환불 신청</a></td>
                  </tr>
            </table>
         </div>
      </div>
   </div>
</body>


</html>