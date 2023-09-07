<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 회원정보</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/user/mypage_info.css" />
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
            기본 회원 정보
            <hr>
         </div>
         <div id="table">
            <table>
               
                  <tr>
                     <td><label>이메일</label></td>
                     <td><input type="email" class="enter" name="m_email" id="m_email" placeholder="Goot@korea.kr"
                           disabled />
                     </td>
                  </tr>
                  <tr>
                     <td><label>이름</label></td>
                     <td><input type="password" class="enter" name="m_pw" id="m_pw" placeholder="홍길동"
                           disabled /> </td>
                  </tr>
                  <tr>
                     <td><label>전화번호</label></td>
                     <td><input type="password" class="enter" name="m_name" id="m_name" placeholder="010-0112-0119"
                           disabled /></td>
                  </tr>
                  <tr>
                     <td><label>주소</label></td>
                     <td><input type="text" class="enter" name="m_address" placeholder="경기도 서울시 인천동" disabled /></td>
                     <td>
                        <a href="../member/modify" id="Fix">회원정보수정</a>
                     </td>
                  </tr>
            </table>
         </div>
         <div id="delete">
            <hr> <br><br>
            <p id="delete_text">회원탈퇴를 원하시면 회원탈퇴 버튼을 눌러주세요.
               <a href="../member/delete" id="delete_btn">회원탈퇴</a>
            </p>
         </div>
      </div>
   </div>
</body>


</html>