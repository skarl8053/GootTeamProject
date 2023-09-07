<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
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
#content{
	width:auto;
	height:1450px;
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
         <div id="title_point">
            포인트
            <hr>
         </div>
         <div id="table">
            <table id="point_table">
                  <tr>
                     <th class="No" width="10%">No</th>
                     <th class="Date" width="15%">날짜</th>
                     <th class="content" width="25%">내역</th>
                     <th class="point" width="20%">Point In</th>
                     <th class="point" width="20%">Point Out</th>
                  </tr>
                  <tr>
                     <td>이름</td>
                     <td>이름</td>
                     <td>이름</td>
                     <td>이름</td>
                     <td>이름</td>
                  </tr>
                  <tr>
                     <td>전화번호</td>
                     <td>전화번호</td>
                     <td>전화번호</td>
                     <td>전화번호</td>
                     <td>전화번호</td>
                  </tr>
                  <tr>
                     <td>주소</td>
                     <td>주소</td>
                     <td>주소</td>
                     <td>주소</td>
                     <td>주소</td>
                  </tr>
                  <tr>
                     <td>사용 내역</td>
                     <td>사용 내역</td>
                     <td>사용 내역</td>
                     <td>사용 내역</td>
                     <td>사용 내역</td>
                  </tr>
                  <tr>
                     <td> 플러스 마이너</td>
                     <td> 플러스 마이너</td>
                     <td> 플러스 마이너</td>
                     <td> 플러스 마이너</td>
                     <td> 플러스 마이너</td>
                  </tr>
            </table>
            <div id="all_point">
               <p id="p_point">총 포인트 : </p><input type="text" value="오조오억" disabled>
            </div>
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
                     <th class="No" width="15%">No</th>
                     <th class="Date" width="25%">쿠폰명</th>
                     <th class="content" width="30%">취득 내역</th>
                     <th class="point" width="30%">취득 일자</th>
                  </tr>
                  <tr>
                     <td>1</td>
                     <td>10000</td>
                     <td>회원가입</td>
                     <td>2020.02.02</td>
                  </tr>
                  <tr>
                     <td>1</td>
                     <td>10000</td>
                     <td>회원가입</td>
                     <td>2020.02.02</td>
                  </tr>
                  <tr>
                     <td>1</td>
                     <td>10000</td>
                     <td>회원가입</td>
                     <td>2020.02.02</td>
                  </tr>
                  <tr>
                     <td>1</td>
                     <td>10000</td>
                     <td>회원가입</td>
                     <td>2020.02.02</td>
                  </tr>
               </table>
               <div id="all_coupon">
                  <p id="p_coupon">남은 쿠폰 개수 : </p><input type="text" value="오조오억" disabled>
               </div>
            </div>
            <div class="coupon_text">
               <p>사용 내역</p>
            </div>
            <div id="use_coupon">
               <table class="coupon_table">
                  <tr>
                     <th class="No" width="15%">No</th>
                     <th class="Date" width="25%">쿠폰명</th>
                     <th class="content" width="30%">사용 날짜</th>
                     <th class="point" width="30%">사용 내역</th>
                  </tr>
                  <tr>
                     <td>1</td>
                     <td>10000</td>
                     <td>2020.02.02</td>
                     <td><a href="#">구매 내역</a></td>
                  </tr>
                  <tr>
                     <td>1</td>
                     <td>10000</td>
                     <td>2020.02.02</td>
                     <td><a href="#">구매 내역</a></td>
                  </tr>
                  <tr>
                     <td>1</td>
                     <td>10000</td>
                     <td>2020.02.02</td>
                     <td><a href="#">구매 내역</a></td>
                  </tr>
                  <tr>
                     <td>1</td>
                     <td>10000</td>
                     <td>2020.02.02</td>
                     <td><a href="#">구매 내역</a></td>
                  </tr>
               </table>
            </div>
         </div>
      </div>
   </div> 
   </body>


</html>