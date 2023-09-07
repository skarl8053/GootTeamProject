<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>���������� ��������</title>
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
            ���� ����
            <hr>
         </div>
         <div id="table">
            <table id="pay_table">
                  <tr>
                     <th width="10%">No</th>
                     <th width="15%">���� ����</th>
                     <th width="25%">���� ��¥</th>
                     <th width="20%">������</th>
                     <th width="20%">����</th>
                  </tr>
                  <tr>
                     <td height="200px">��ȣ</td>
                     <td><a href="#">�̹��� �� ��ũ</a></td>
                     <td>���� ��¥</td>
                     <td>������</td>
                     <td><a href="#">�ı� �ۼ�</a></td>
                  </tr>
                  <tr>
                     <td  height="200px">��ȣ</td>
                     <td><a href="#">�̹��� �� ��ũ</a></td>
                     <td>���� ��¥</td>
                     <td>������</td>
                     <td>�Ա� Ȯ��</td>
                  </tr>
                  <tr>
                     <td  height="200px">��ȣ</td>
                     <td><a href="#">�̹��� �� ��ũ</a></td>
                     <td>���� ��¥</td>
                     <td>������</td>
                     <td><a href="#">ȯ�� ��û</a></td>
                  </tr>
            </table>
         </div>
      </div>
   </div>
</body>


</html>