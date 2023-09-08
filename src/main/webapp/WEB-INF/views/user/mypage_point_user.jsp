<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>���������� ����Ʈ/����</title>
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
         <div id="title_point">
            ����Ʈ
            <hr>
         </div>
         <div id="table">
            <table id="point_table">
                  <tr>
                     <th class="No" width="10%">No</th>
                     <th class="Date" width="15%">��¥</th>
                     <th class="content" width="25%">����</th>
                     <th class="point" width="20%">Point In</th>
                     <th class="point" width="20%">Point Out</th>
                  </tr>
                  <tr>
                     <td>�̸�</td>
                     <td>�̸�</td>
                     <td>�̸�</td>
                     <td>�̸�</td>
                     <td>�̸�</td>
                  </tr>
                  <tr>
                     <td>��ȭ��ȣ</td>
                     <td>��ȭ��ȣ</td>
                     <td>��ȭ��ȣ</td>
                     <td>��ȭ��ȣ</td>
                     <td>��ȭ��ȣ</td>
                  </tr>
                  <tr>
                     <td>�ּ�</td>
                     <td>�ּ�</td>
                     <td>�ּ�</td>
                     <td>�ּ�</td>
                     <td>�ּ�</td>
                  </tr>
                  <tr>
                     <td>��� ����</td>
                     <td>��� ����</td>
                     <td>��� ����</td>
                     <td>��� ����</td>
                     <td>��� ����</td>
                  </tr>
                  <tr>
                     <td> �÷��� ���̳�</td>
                     <td> �÷��� ���̳�</td>
                     <td> �÷��� ���̳�</td>
                     <td> �÷��� ���̳�</td>
                     <td> �÷��� ���̳�</td>
                  </tr>
            </table>
            <div id="all_point">
               <p id="p_point">�� ����Ʈ : </p><input type="text" value="��������" disabled>
            </div>
         </div>
         <div id="title_coupon">
            ����
            <hr>
         </div>
         <div id="table">
            <div class="coupon_text">
               <p>���� ��Ȳ</p>
            </div>
            <div id="own_coupon">
               <table class="coupon_table">
                  <tr>
                     <th class="No" width="15%">No</th>
                     <th class="Date" width="30%">������</th>
                     <th class="content" width="30%">����</th>
                  </tr>
                  <tr>
                     <td>1</td>
                     <td>10000</td>
                     <td>100</td>
                  </tr>
                  <tr>
                     <td>2</td>
                     <td>20000</td>
                     <td>200</td>
                  </tr>
                  <tr>
                     <td>3</td>
                     <td>30000</td>
                     <td>300</td>
                  </tr>

               </table>
               <div id="all_coupon">
                  <p id="p_coupon">���� ���� ���� : </p><input type="text" value="��������" disabled>
               </div>
            </div>
            <div class="coupon_text">
               <p>��� ����</p>
            </div>
            <div id="use_coupon">
               <table class="coupon_table">
                  <tr>
                     <th class="No" width="15%">No</th>
                     <th class="Date" width="25%">������</th>
                     <th class="content" width="30%">��� ��¥</th>
                     <th class="point" width="30%">��� ����</th>
                  </tr>
                  <tr>
                     <td>1</td>
                     <td>10000</td>
                     <td>2020.02.02</td>
                     <td><a href="#">���� ����</a></td>
                  </tr>
                  <tr>
                     <td>1</td>
                     <td>10000</td>
                     <td>2020.02.02</td>
                     <td><a href="#">���� ����</a></td>
                  </tr>
                  <tr>
                     <td>1</td>
                     <td>10000</td>
                     <td>2020.02.02</td>
                     <td><a href="#">���� ����</a></td>
                  </tr>
                  <tr>
                     <td>1</td>
                     <td>10000</td>
                     <td>2020.02.02</td>
                     <td><a href="#">���� ����</a></td>
                  </tr>
               </table>
            </div>
         </div>
      </div>
   </div> 
   </body>


</html>