<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>

	<style>
        div{
            text-align: center;
        }

        #form{
            width: 600px;
            height: 1000px;
            border: 1px solid black;
            margin: 20px auto 0 auto;
            position: relative;
        }
        hr{
            width: 550px;
        }
        .table_title, #refund_reason_title{
            text-align: left;
            padding: 15px 0 10px 30px;
            font-weight: bold;
            text-decoration: underline;
        }
        table{
            width: 550px;
            margin: 0 auto 5px auto;
            border-collapse: collapse;
        }
        .first_col{
            width: 13%;
            height: 50px;
        }
        .second_col{
            width: 50%;
            height: 50px;
        }
        .third_col{
            width: 7%;
            height: 50px;
        }
        .forth_col{
            width: 30%;
            height: 50px;
        }
        #refundButton{
            background-color: gray;
            color: black;
            font-weight: bold;
            border-radius: 3px;
            width: 100px;
            height: 32px;
            cursor: not-allowed;
        }
        .button{
            background-color: blue;
            color: white;
            font-weight: bold;
            border-radius: 3px;
            width: 100px;
            height: 32px;
            cursor: pointer;
        }
        #checkStr{
            cursor: pointer;
        }
        #totalprice{
            color: red;
            font-weight: bold;
        }
        #refund_reason, #refund_reason option{
            width: 250px;
            height: 30px;
            font-size: 20px;
        }
        footer{
            position: absolute;
            bottom: 5px;
            width: 600px;
            margin: 0 auto;
        }
        footer div{
            margin: 10px 0 20px 0;
        }
    </style>

    <script>
        

        function setCheckbox(){

            // 위와 같은 내용을 확인하였습니다. 클릭할 경우

            var checkbox =  document.getElementById("continueRefund");

            if(checkbox.checked == false){
                document.getElementById("continueRefund").checked = true;
            }
            else{
                document.getElementById("continueRefund").checked = false;
            }

            continueRefundCK(checkbox);
        }

        function continueRefundCK(target){
            
            // 체크박스 선택 / 취소 여부에 따라 달라짐

            var refundButton = document.getElementById("refundButton");
            var cancelButton = document.getElementById("cancelButton");

            if(target.checked == true){
                buttonStyle("blue", "white", "pointer");
            }
            else{
                buttonStyle("gray", "black", "not-allowed");
            }
        }

        function buttonStyle(bgcolor, fontcolor, cursor){
            refundButton.style.backgroundColor = bgcolor;
            refundButton.style.color = fontcolor;
            refundButton.style.cursor = cursor;
        }
        
        function refundCheck(){
            var checkbox =  document.getElementById("continueRefund").checked;

            if(checkbox == false){
                return false;
            }
        }

        function cancelRefund(){

            // 취소 버튼을 누르면 닫는다.
            window.close();
            self.close();
        }

    </script>

    <div id="form">
        <div>
            <h1>환불 진행</h1>
        </div>
        <hr>
        
        <form action="refund_insert" onsubmit="return refundCheck();">

            <input type="hidden" name="m_no" value="${param.m_no}">
            <input type="hidden" name="order_no" value="${param.order_no}">

            <div>
                <div class="table_title">
                    <span>주문 정보</span>
                </div>
                <table border="1">
                    <tr>
                        <td class="first_col">주문번호</td>
                        <td class="second_col" colspan="">${o_list.order_no}</td>
                        <td class="third_col">환불 금액</td>
                        <td class="forth_col" >${o_list.payment_price}</td>
                    </tr>
                    <tr>
                        <td class="first_col">숙소명</td>
                        <td class="second_col" colspan="3">${o_list.s_name}</td>
                    </tr>
                    <tr>
                        <td class="first_col">번호</td>
                        <td class="second_col">객실명</td>
                        <td class="third_col" colspan="2">금액</td>
                    </tr>
                    <c:forEach items="${r_list}" var="li">
                        <tr>
                            <td class="first_col"><span>${li.row_num}</span></td>
                            <td class="second_col"><span>${li.r_name}</span></td>
                            <td class="third_col" colspan="2"><span>${li.r_price }</span></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <div class="table_title">
                <span>포인트 환불</span>
            </div>
            <div>
                <table border="1">
                    <tr>
                        <td class="first_col">포인트</td>
                        <td class="second_col" colspan="2">${d_list.point}</td>
                    </tr>
                </table>
            </div>
            <div class="table_title">
                <span>쿠폰 환불</span>
            </div>
            <div>
                <table border="1">
                    <tr>
                        <td class="first_col">쿠폰 이름</td>
                        <td class="second_col" colspan="2">${d_list.coupon_name}</td>
                    </tr>
                    <tr>
                        <td class="first_col">쿠폰 금액</td>
                        <td class="second_col" colspan="2">${d_list.coupon_no}</td>
                    </tr>
                </table>
            </div>
            <br>
            <div class="table_title">
                <span>환불 사유</span>
            </div>
            <div id="refund_reason_title">
                <select id="refund_reason" name="refund_reason">
                    <c:forEach items="${reason_list}" var="li">
                        <option value="${li.refund_reason_no}">${li.refund_reason_name}</option>
                    </c:forEach>
                </select>
            </div>
            <br>
            <footer>
                <div>
                    <input type="checkbox" id="continueRefund" onchange="continueRefundCK(this)" style="cursor: pointer;"><span id="checkStr" onclick="setCheckbox()">위와 같은 내용을 확인하였습니다.</span>
                </div>
                <div>
                    <span>환불을 계속 진행하시겠습니까?</span>
                </div>
                <div>
                    <span>
                        <input type="submit" id="refundButton" value="환불 진행">
                    </span>
                    <span>
                        <button type="button" id="cancelButton" class="button" onclick="cancelRefund();">취소</button>
                    </span>
                </div>
            </footer>
        </form>
    </div>
	
</body>
</html>