<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<!-- 개별 화면 content 크기를 조절하는 방법 -->
	<style>
		#content{
			height: 1600px;
		}
	</style>
	
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

</head>
<body>

	<style>
        body{
            font-size: 20px;
        }
        #form{
            width: 1200px;
        }
        ul{
            list-style: none;
            padding-left: 0;
        }
        li{
            float: left;
            padding-right: 20px;
        }
        #main_first_col{
            width: 700px;
        }
        #main_second_col{
            width: 450px;
        }
        #stay_resv_table{
            width: 690px;
        }
        #stay_resv_table, #stay_resv_table tr, #stay_resv_table td{
            border: 1px solid lightgray;
            border-collapse: collapse;
        }
        #check_date_table{
            width: 500px;
            text-align: center;
            margin: 0 auto;
        }
        #check_date_table, #check_date_table tr, #check_date_table td{
            border: 1px solid lightgray;
            border-collapse: collapse;
        }
        .check_date_header_row{
            color: red;
            font-weight: bold;
        }
        .check_date_data_row{
            height: 80px;
            font-size: 30px;
            font-weight: bold;
            color: blue;
        }
        .first_row{
            height: 30px;
        }
        .second_row{
            height: 150px;
        }
        .first_col{
            width: 25%;
        }
        .second_col{
            width: 57%;
        }
        .third_col{
            width: 18%;
            text-align: center;
        }
        .header{
            font-weight: bolder;
        }
        #delivery_info div{
            padding-bottom: 20px;
        }
        #pay_div div{
            padding-bottom: 20px;
        }
        #use_point{
            height: 26px;
        }
        .cardNumber {
            text-align:center;
            width: 72px;
            font-size: 20px;
            outline: 3px solid red;
        }
        button{
            background-color: blue;
            color: white;
            font-weight: bold;
            border-radius: 3px;
            width: 100px;
            height: 32px;
            cursor: pointer;
        }
        #coupon_none{
            display: none;
        }
        
        #submit{
            background-color: blue;
            color: white;
            font-weight: bold;
            border-radius: 3px;
            width: 100%;
            height: 50px;
            font-size: 20px;
            cursor: pointer;
        }
    </style>

    <script>

        // var use_Coupon_flag = false;

    	function coupon_popup_open(m_no){
    		
    		var opensite = "couponpopup?m_no=" + m_no;
            window.open(opensite, 'window', 'width=700px, height=830px');

            // 쿠폰 등록하면 coupon_flag_change()로 이동함. (onchange 이벤트때문에)
            // 쿠폰 등록하면 use_coupon_flag가 true로 바뀜
    	}
    	
        function coupon_cancel_exec(){
            
        	var totalPrice = parseInt(document.getElementById("totalPrice").innerHTML);
        	var pointPrice = parseInt(document.getElementById("use_point").value);
        	var couponPrice = parseInt(document.getElementById("coupon_no").value);
        	
        	if(document.getElementById("coupon_no").value.length < 1)
       		{
       			alert("쿠폰을 적용시키지 않아 쿠폰을 삭제할 수 없습니다.");
       			return false;
       		}
        		
        	
        	document.getElementById("coupon_price").innerHTML = pointPrice;
        	document.getElementById("discountPrice").innerHTML = pointPrice;
        	document.getElementById("resultPrice").innerHTML = (totalPrice - couponPrice + pointPrice);
        	
        	document.getElementById("coupon_no").value = "";
        }

        $(document).ready(function(){
            //onchange="return usePointEXEC(this)"
            $("#use_point").change(function(){

                var totalPrice = parseInt(document.getElementById("totalPrice").innerHTML);
                var use_Coupon = parseInt(document.getElementById("coupon_price").innerHTML);
                var use_point = document.getElementById("use_point").value;
                var currentAllPoint = parseInt(document.getElementById("currentAllPoint").innerHTML);

                if(use_point.length < 1){
                    
                	 document.getElementById("resultPrice").innerHTML = (totalPrice - use_Coupon);
                	
                    document.getElementById("discountPrice").innerHTML = use_Coupon;
                    document.getElementById("use_point").value = 0;
                   
                    return false;
                }

                if(isFinite(parseInt(use_point)) == false){

                    alert("포인트 금액은 숫자만 입력할 수 있습니다.")
                    document.getElementById("discountPrice").innerHTML = 0;
                    document.getElementById("use_point").value = 0;

                    document.getElementById("resultPrice").innerHTML = totalPrice - use_Coupon;

                    return false;
                }

                if(parseInt(use_point) > parseInt(currentAllPoint)){

                    alert('보유한 포인트보다 많은 포인트를 입력할 수 없습니다.');

                    document.getElementById("discountPrice").innerHTML = 0;
                    document.getElementById("use_point").value = 0;

                    document.getElementById("resultPrice").innerHTML = totalPrice - use_Coupon;

                    return false;
                }

                if(parseInt(totalPrice - use_point) < 0)
                {
                    alert('결제 금액 이상의 포인트를 사용할 수 없습니다.');

                    document.getElementById("discountPrice").innerHTML = 0;
                    document.getElementById("use_point").value = 0;

                    document.getElementById("resultPrice").innerHTML = totalprice - use_Coupon;

                    return;
                }


                payPointExec();
            });

        })
        
        
    	function useAllPoint(){
    		
    		// 포인트 전액 사용
    		
            var totalPrice = document.getElementById("totalPrice").innerHTML;
    		var allPoint = document.getElementById("currentAllPoint").innerHTML;
    		
            if(totalPrice - allPoint < 0){

                alert('결제 금액 이상의 포인트를 사용할 수 없습니다.');

                document.getElementById("discountPrice").innerHTML = totalPrice;
                document.getElementById("use_point").value = totalPrice;

                document.getElementById("resultPrice").innerHTML = 0;

                return;
            }

    		document.getElementById("use_point").value = allPoint;

            payPointExec();
            
    	}

        function payPointExec(){

            // 할인금액에 표시


            var usePoint = parseInt(document.getElementById("use_point").value);
            var useCoupon = parseInt(document.getElementById("coupon_price").innerHTML);

            // 할인 금액은 포인트 금액과 쿠폰금액 합쳐서 보여줌.
            document.getElementById("discountPrice").innerHTML = (usePoint + useCoupon);

            var totalPrice = document.getElementById("totalPrice").innerHTML;

            // 결과 금액은 전체 - (쿠폰할인 + 포인트할인)이다.
            document.getElementById("resultPrice").innerHTML = (totalPrice - (usePoint + useCoupon));

        }
    
        function inputMoveNumber(target) {
        	
            // 카드 번호 관련
            
            if(isFinite(target.value) == false) {
                alert("카드번호는 숫자만 입력할 수 있습니다.");
                target.value = "";
                return false;
            }
            if(target.value.length < 4)
            {
                target.style.outline= "3px solid red";
            }
            else{
                target.style.outline= "3px solid blue";
            }
            max = target.getAttribute("maxlength");

            var first_cardnumber = document.getElementById("first_cardnumber").value;
            var second_cardnumber = document.getElementById("second_cardnumber").value;
            var third_cardnumber = document.getElementById("third_cardnumber").value;
            var forth_cardnumber = document.getElementById("forth_cardnumber").value;

            if(first_cardnumber.length < 4 || second_cardnumber.length < 4 || third_cardnumber.length < 4 || forth_cardnumber.length < 4){
                document.getElementById("card_number").value = "";
            }
            else{
                
                var cardnumber = first_cardnumber + "-" + second_cardnumber + "-" + third_cardnumber + "-" + forth_cardnumber;
                document.getElementById("card_number").value = cardnumber;

                return false;
            }

            if(target.value.length >= max) {
                target.nextElementSibling.focus();
            }
            
            

        }

        function paymentExec(){

        	var totalAllPrice = document.getElementById("totalPrice").innerHTML;
        	var totalDiscountPrice = document.getElementById("discountPrice").innerHTML;
        	var totalResultPrice = document.getElementById("resultPrice").innerHTML;
        	
            var pay_type = document.getElementById("pay_type").value;
            var cardnumber = document.getElementById("card_number").value;

            if(pay_type == 1){
                
                if(cardnumber.length < 1)
                {
                    alert("카드번호를 입력해주세요");
                    return false;
                }
            }

            var check = confirm("결제를 계속 진행하시겠습니까?");
            
            if(check == false){
                return false;
            }
            
            document.getElementById("totalAllPrice").value = totalAllPrice;
            document.getElementById("totalDiscountPrice").value = totalDiscountPrice;
            document.getElementById("totalResultPrice").value = totalResultPrice;
            
        }

    </script>

	<h1>결제 진행</h1>

    <div id="form">
        <form action="payment_exec" onsubmit="return paymentExec()">
			
			<input type="hidden" name="m_no" value="${param.m_no}" />
			<input type="hidden" name="stay_no" value="${param.stay_no}" />
			<input type="hidden" name="room_no" value="1_2_3_4" /> <%-- ${param.room_no} --%>
			<input type="hidden" name="checkindate" value="${param.checkindate}" />
			<input type="hidden" name="checkoutdate" value="${param.checkoutdate}" />
			<input type="hidden" id="totalAllPrice"name="totalAllPrice" value="" />
			<input type="hidden" id="totalDiscountPrice"name="totalDiscountPrice" value="" />
			<input type="hidden" id="totalResultPrice"name="totalResultPrice" value="" />
			<input type="hidden" name="totalEarnPoint" value="${earnpoint}" />
			<input type="hidden" id="coupon_no" name="coupon_no" value="" />
            <input type="hidden" id="card_number" name="cardNumber" value="" />

            <div>
                <ul>
                    <li id="main_first_col">
                        <div id="delivery_info">
                            <div>
                                <p class="header">예약자 정보</p>
                                <hr>
                            </div>
                            <div>
                                <span>${resvList.m_name }</span>
                            </div>
                            <div>
                                <span>${resvList.m_address}</span>
                            </div>
                            <div>
                                <span>${resvList.m_tel}</span>
                            </div>
                            <div>
                                <table id="check_date_table">
                                    <tr>
                                        <td class="check_date_header_row">체크인 일자</td>
                                        <td class="check_date_header_row">체크아웃 일자</td>
                                        <td class="check_date_header_row">총 예약 일자</td>
                                    </tr>
                                    <tr>
                                        <td class="check_date_data_row">${checkin_date }</td>
                                        <td class="check_date_data_row">${checkout_date }</td>
                                        <td class="check_date_data_row">${diffDay }</td>
                                    </tr>
                                </table>
                            </div>
                            <br><br><br>
                            <div>
                                <span class="header">예약 숙소</span>
                                <hr>
                                <table id="stay_resv_table">
                                    <tr class="first_row">
                                        <td class="first_col" colspan="3">${stayList.s_name }</td>
                                    </tr>  
                                    <tr class="first_row">
                                        <td class="first_col" colspan="3">${stayList.s_addr }</td>
                                    </tr>
                                    
                                     <c:forEach items="${roomList}" var="li">
                                     		<tr class="second_row">
		                                        <td class="first_col"><img src="resources/upload_img/admin/stay/${li.r_img1}" alt="이미지 없음" width="200px"></td>
		                                        <td class="second_col">
		                                            <div>
		                                                <span>${li.r_name }</span>
		                                            </div>
		                                            <div>
		                                                객실 최대인원수 : <span>${li.r_person_cnt}</span>
		                                            </div>
		                                        </td>
		                                        <td class="third_col"><span>${li.r_price}</span>원</td>
		                                    </tr>
                                    </c:forEach>
                                    
                                </table>
                                <br><br><br>
                            </div>
                            <div>
                                <span class="header">쿠폰 / 포인트</span>
                            </div>
                            <hr><br>
                            <div>
                                 <span>쿠폰 할인</span>
                                 <button type="button" id="coupon_use" onclick="coupon_popup_open('${param.m_no}');">쿠폰 적용</button>
                                 <button type="button" id="coupon_cancel" onclick="return coupon_cancel_exec();">쿠폰 삭제</button>
                            </div>
                            <div>
                                <span>&nbsp;&nbsp;&nbsp;└ 즉시 할인</span>
                                <span style="color:red; font-weight: bold;"><span id="coupon_price">0</span>원 </span>
                            </div>
                            <br><hr><br>
                            <div>
                                <span>포인트</span>
                                <span><input type="text" id="use_point" name="totalUsePoint" value="0" ></span><span>원</span>
                                <span><button type="button" onclick="useAllPoint()">전액 사용</button></span>
                                &nbsp;&nbsp;<span id="currentAllPoint">${resvList.m_point}</span> 포인트 사용 가능 
                            </div>
                            <div>
                                
                            </div>
                        </div>
                        
                    </li>
                    <li id="main_second_col">
                        <div id="point_div">
                            <p class="header">적립 혜택</p>
                        </div>
                        <hr>
                        <div>
                            <span>포인트 : </span>
                            <span id="earnpoint" style="color:red; font-weight: bold;">${earnpoint}</span><span>원</span>
                        </div>
                        <br><br><hr>
                        <div id="pay_div">
                            <div>
                                <span class="header">결제 예정금액</span>
                            </div>
                            <div>
                                <span>숙소 금액 : </span>
                                <span style="color:black; font-weight: bold;"><span id="totalPrice">${sumPrice}</span>원</span> 
                            </div>
                            <div>
                                <span>할인 금액 : </span>
                                <span style="color:blue; font-weight: bold;"><span id="discountPrice">0</span>원</span>
                            </div>
                            <div>
                                <span>최종 결제 금액 : </span>
                                <span style="color:red; font-weight: bold;"><span id="resultPrice">${sumPrice}</span>원</span> 
                            </div>
                            <hr>
                            <div>
                                <span>결제 수단 : </span>
                                <span>
                                    <input type="radio" id="pay_type" name="pay_type" value="1" checked> 신용카드 결제
                                </span>
                            </div>
                            <br>
                            <fieldset>
                                <span>카드번호 :</span>
                                <br><br>
                                <input type="text" id="first_cardnumber" class="cardNumber" onKeyup="return inputMoveNumber(this);" maxlength="4"/>&nbsp;-&nbsp;
                                <input type="password" id="second_cardnumber" class="cardNumber" onKeyup="return inputMoveNumber(this);" maxlength="4"/>&nbsp;-&nbsp;
                                <input type="password" id="third_cardnumber" class="cardNumber" onKeyup="return inputMoveNumber(this);" maxlength="4"/>&nbsp;-&nbsp;
                                <input type="text" id="forth_cardnumber" class="cardNumber" onKeyup="return inputMoveNumber(this);" maxlength="4"/>
                            </fieldset>
                            <br>
                        </div>
                        <div>
                            <div>
                                <input type="submit" id="submit" value="${sumPrice}원 결제하기">
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </form>
    </div>
	
</body>
</html>