<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>���������� �����ı�</title>
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
                  <a href="./mypage_info" class="menu" id="info">�⺻ ȸ�� ����</a> <br>
               </li>
               <li class="page_list">
                  <a href="./mypage_pay" class="menu" id="pay">���� ����</a> <br>
               </li>
               <li class="page_list">
                  <a href="./mypage_review" class="menu" id="review">���� �ı�</a> <br>
               </li>
               <li class="page_list">
                  <a href="./mypage_event" class="menu" id="event">�̺�Ʈ</a> <br>
               </li>
               <li class="page_list">
                  <a href="./mypage_point" class="menu" id="coupon">����Ʈ / ����</a> <br>
               </li>
            </ul>
         </nav>
      </div>
      <div id="Whole">
         <div id="title">
            ���� �ı�
            <hr>
         </div>
         <div id="table">
            <table id="review_table">
               <tr>
                  <td class="border_bottom" rowspan="3" width="5%" height="350px">No</td>
                  <td class="border_bottom" rowspan="3" width="30%">�ı� img</td>
                  <td colspan="3" height="70px" style="text-align:left; padding-left:10px;"><a href="#">�ı� ����</a></td>
               </tr>
               <tr>
                  <td class="border_bottom" rowspan="2" width="40%" style="text-align:left; padding-left:10px;">�ı� ����</td>
                  <td colspan="2"></td>
               </tr>
               <tr>        
                  <td class="border_bottom" width="10%" height="80px">���ƿ�<br />�̹���</td>
                  <td class="border_bottom" width="8%">���ƿ�<br />����</td>
               </tr>
            </table>
         </div>
      </div>
   </div>
</body>


</html>