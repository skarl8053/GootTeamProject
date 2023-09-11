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
			height: 100%;
		}
	</style>
	
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    
    
</head>
<body onload="showInfo();">

	<style>
		@font-face {
            font-family: 'GmarketSansMedium';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
        *{
            font-family: 'GmarketSansMedium';
        }
        body{
        	font-size: 20px;
        };
        #form{
            width: 1200px;
        }
        #form{
            list-style: none;
            padding-left: 0;
        }
        #form li{
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
            width: 600px;
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
        .check_date_data_row, #datepicker_startdate, #datepicker_enddate{
            height: 80px;
            font-size: 30px;
            font-weight: bold;
            color: blue;
        }
        #datepicker_startdate, #datepicker_enddate{
        	width: 200px;
        	text-align: center;
        	border-style: none;
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
            font-size: 30px;
            color: purple;
        }
        .r_img{
        	width: 200px;
        	height: 200px;
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
        .button{
            background-color:  #011343;
            color: #EBD01C;
            border-radius: 3px;
            width: 100px;
            height: 32px;
            cursor: pointer;
        }
        #coupon_none{
            display: none;
        }
        
        .paybutton{
            background-color:  #011343;
            color: #EBD01C;
            border-radius: 3px;
            width: 100%;
            height: 50px;
            font-size: 20px;
            cursor: pointer;
            font-size: 24px;
        }
        #kakaoPaymentButton{
            display: none;
        }
    </style>

    <script>

        // var use_Coupon_flag = false;

        function showInfo(){
        	
        	var checkindate = '<c:out value="${param.checkindate}"/>';
        	var checkoutdate = '<c:out value="${param.checkoutdate}"/>';
        	
        	if(checkindate== "" || checkoutdate == ""){
        		$("#resv_field").hide();
        		$("#coupon_field").hide();
        		$("#price_field").hide();
       		}
        	
        }
        
        function resvDate_click(m_no, s_no, r_no){
        	
        	// 예약일자 확정 클릭
        	
        	var checkindate = document.getElementById("datepicker_startdate").value;
        	var checkoutdate = document.getElementById("datepicker_enddate").value;
        	
        	if(checkindate== "" || checkoutdate == ""){
        		alert("체크인 / 체크아웃 일자를 설정해주세요")
        		return false;
       		}
        	
        	if(confirm("예약일자를 확정하시겠습니까?") == false){
        		return false;
        	}
        	
        	location.replace("payment?m_no=" +m_no + "&s_no=" + s_no + "&r_no=" +r_no + "&checkindate=" + checkindate + "&checkoutdate=" + checkoutdate );
        }
        
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
        		
        	
        	document.getElementById("coupon_price").innerHTML = 0;
        	document.getElementById("discountPrice").innerHTML = pointPrice;
        	document.getElementById("resultPrice").innerHTML = (totalPrice - couponPrice + pointPrice);
        	
        	document.getElementById("coupon_no").value = "";
        }

        $(document).ready(function(){
            //onchange="return usePointEXEC(this)"
            $("#use_point").change(function(){

                var totalPrice = parseInt(document.getElementById("totalPrice").innerHTML);
                var use_Coupon = parseInt(document.getElementById("coupon_price").innerHTML);
                var use_point = parseInt(document.getElementById("use_point").value);
                var currentAllPoint = parseInt(document.getElementById("currentAllPoint").innerHTML);

                if(document.getElementById("use_point").value.length < 1){
                    
                    document.getElementById("discountPrice").innerHTML = use_Coupon;
                    document.getElementById("use_point").value = 0;

                	document.getElementById("resultPrice").innerHTML = (totalPrice - use_Coupon);
                	
                    return false;
                }

                if(isFinite(parseInt(use_point)) == false){

                    alert("포인트 금액은 숫자만 입력할 수 있습니다.")
                    document.getElementById("discountPrice").innerHTML = use_Coupon;
                    document.getElementById("use_point").value = 0;

                    document.getElementById("resultPrice").innerHTML = totalPrice - use_Coupon;

                    return false;
                }

                if(parseInt(use_point) > parseInt(currentAllPoint)){

                    alert('보유한 포인트보다 많은 포인트를 입력할 수 없습니다.');

                    document.getElementById("discountPrice").innerHTML = use_Coupon;
                    document.getElementById("use_point").value = 0;

                    document.getElementById("resultPrice").innerHTML = totalPrice - use_Coupon;

                    return false;
                }

                if(parseInt(totalPrice - use_point - use_Coupon) < 0)
                {
                    alert('결제 금액 이상의 포인트를 사용할 수 없습니다.');

                    document.getElementById("discountPrice").innerHTML = use_Coupon;
                    document.getElementById("use_point").value = 0;

                    document.getElementById("resultPrice").innerHTML = totalprice - use_Coupon;

                    return;
                }

                payPointExec();
                
            });

        })
        
        
    	function useAllPoint(){
    		
    		// 포인트 전액 사용
    		
            var totalPrice = parseInt(document.getElementById("totalPrice").innerHTML);
    		var allPoint = parseInt(document.getElementById("currentAllPoint").innerHTML);
    		var use_Coupon = parseInt(document.getElementById("coupon_price").innerHTML);
    		
            if( (totalPrice - allPoint - use_Coupon) < 0){

                alert('결제 금액 이상의 포인트를 사용할 수 없습니다.');
                
                document.getElementById("discountPrice").innerHTML = use_Coupon;
                document.getElementById("use_point").value = 0;

                document.getElementById("resultPrice").innerHTML = totalPrice - use_Coupon;

                return false;
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

        

        function payMethodChange(methodNum){

            var cardform = document.getElementById("cardform");
            var cardPaymentButton = document.getElementById("cardPaymentButton");
            var kakaoPaymentButton = document.getElementById("kakaoPaymentButton");

            if(methodNum == 1){

                // 카드 결제
                
                cardform.style.display = "block";
                cardPaymentButton.style.display = "block";
                kakaoPaymentButton.style.display = "none";

                document.getElementById("paymethod").value = "1";

            }
            else if(methodNum == 2){
                
                // 카카오페이 결제

                cardform.style.display = "none";
                cardPaymentButton.style.display = "none";
                kakaoPaymentButton.style.display = "block";

                document.getElementById("paymethod").value = "2";

            }
        }

        function paymentExec(){

            // 일반 카드 결제

        	var totalAllPrice = document.getElementById("totalPrice").innerHTML;
        	var totalDiscountPrice = document.getElementById("discountPrice").innerHTML;
        	var totalResultPrice = document.getElementById("resultPrice").innerHTML;
        	
            var paymethod = document.getElementById("paymethod").value;
            var cardnumber = document.getElementById("card_number").value;

            if(paymethod == 1){
                
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

            if(paymethod == 1){
                cardpayExec();
            }
            else if(paymethod == 2){
                kakaopayExec();
            }
        }

        function cardpayExec(){

            var m_no = document.getElementById("m_no").value;
            var s_no = document.getElementById("s_no").value;
            var r_no = document.getElementById("r_no").value;
            var checkindate = document.getElementById("checkindate").value;
            var checkoutdate = document.getElementById("checkoutdate").value;
            var totalAllPrice = document.getElementById("totalPrice").innerHTML;
            var totalDiscountPrice = document.getElementById("discountPrice").innerHTML;
            var totalResultPrice = document.getElementById("resultPrice").innerHTML;
            var totalUsePoint = document.getElementById("use_point").value;
            var totalEarnPoint = document.getElementById("totalEarnPoint").value;
            var coupon_no = document.getElementById("coupon_no").value;
            var card_number = document.getElementById("card_number").value;
            var paymethod = document.getElementById("paymethod").value;

            location.replace("payment_exec?m_no=" + m_no + "&s_no=" + s_no + "&r_no=" + r_no + "&checkindate=" 
            + checkindate + "&pay_type=1&checkoutdate=" + checkoutdate + "&totalAllPrice=" + totalAllPrice + "&totalDiscountPrice=" + totalDiscountPrice
            + "&totalResultPrice=" + totalResultPrice + "&totalUsePoint=" + totalUsePoint + "&totalEarnPoint=" + + totalEarnPoint + "&coupon_no=" + coupon_no + "&cardNumber=" + card_number);
                

        }

        // 카카오 페이 사용 소스

        ///////////////////////////////////////////

        var IMP = window.IMP; 
        IMP.init("imp07346301"); 
      
        var today = new Date();   
        var hours = today.getHours(); // 시
        var minutes = today.getMinutes();  // 분
        var seconds = today.getSeconds();  // 초
        var milliseconds = today.getMilliseconds();
        var makeMerchantUid = hours +  minutes + seconds + milliseconds;
        
        function kakaopayExec(){

            // 카카오페이 결제
            
            var m_no = document.getElementById("m_no").value;
            var s_no = document.getElementById("s_no").value;
            var r_no = document.getElementById("r_no").value;
            var checkindate = document.getElementById("checkindate").value;
            var checkoutdate = document.getElementById("checkoutdate").value;
            var totalAllPrice = document.getElementById("totalPrice").innerHTML;
            var totalDiscountPrice = document.getElementById("discountPrice").innerHTML;
            var totalResultPrice = document.getElementById("resultPrice").innerHTML;
            var totalUsePoint = document.getElementById("use_point").value;
            var totalEarnPoint = document.getElementById("totalEarnPoint").value;
            var coupon_no = document.getElementById("coupon_no").value;
            var card_number = document.getElementById("card_number").value;
            var paymethod = document.getElementById("paymethod").value;

            IMP.request_pay({
                pg : 'kakaopay.TC0ONETIME',
                pay_method : 'card',
                merchant_uid: "IMP"+makeMerchantUid, 
                name : '코드와 아이들 / 숙소 예약',
                amount : parseInt(totalResultPrice)
            }, function (rsp) {
                if (rsp.success) {
                	
                    // 카카오 페이 결제 성공할 경우
                    console.log(rsp);
					// 결제 정보 등록
                    location.replace("payment_exec?m_no=" + m_no + "&s_no=" + s_no + "&r_no=" + r_no + "&checkindate=" 
                    + checkindate + "&pay_type=2&checkoutdate=" + checkoutdate + "&totalAllPrice=" + totalAllPrice + "&totalDiscountPrice=" + totalDiscountPrice
                    + "&totalResultPrice=" + totalResultPrice + "&totalUsePoint=" + totalUsePoint + "&totalEarnPoint=" + + totalEarnPoint + "&coupon_no=" + coupon_no + "&cardNumber=" + card_number);
                        
                } else {
                    console.log(rsp);
                    alert("카카오페이 결제가 실패하였습니다.");
                }
            });
        }

        /////////////////////////////////////////////////////

       $(function(){
	
	        var selected_StartDate = null;
	        var selected_EndDate = null;
	
	     	// datePicker 이벤트 시작일
	
	        $('#datepicker_startdate').datepicker({
	            showOn: "both",                             						// 달력을 표시할 타이밍 (both: focus or button)
	            buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",     	// 버튼 이미지
	            buttonImageOnly : true,                     					// 버튼 이미지만 표시할지 여부
	            buttonText: "날짜선택",                     					// 버튼의 대체 텍스트
	            dateFormat: "yy-mm-dd",                     					// 날짜의 형식
	            changeMonth: true,                          					// 월을 이동하기 위한 선택상자 표시여부
	            minDate: 1,                           						// 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
	            onClose: function( selectedDate ) {    
                // 시작일(fromDate) datepicker가 닫힐때
                // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
	                $("#datepicker_enddate").datepicker( "option", "minDate", selectedDate );
	
                	// 맨 처음 조회할 때는 selectedDate가 없는 상태임..
                
                	if(selected_StartDate == null){
                		selected_StartDate = document.getElementById("datepicker_startdate").value;
                	}
                	else{
                		selected_StartDate = selectedDate;
                	}
                	
                	if(selected_EndDate == null){
                		selected_EndDate = document.getElementById("datepicker_enddate").value;
                	}
                	
	            }                
	        });
	
	     	// datePicker 이벤트 종료일
	        $('#datepicker_enddate').datepicker({
	            showOn: "both", 
	            buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif", 
	            buttonImageOnly : true,
	            buttonText: "날짜선택",
	            dateFormat: "yy-mm-dd",
	            changeMonth: true,
	            minDate: 1, 
	            onClose: function( selectedDate ) {
	                // 종료일(toDate) datepicker가 닫힐때
	                // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
	                $("#datepicker_startdate").datepicker( "option", "maxDate", selectedDate );
	 
	                if(selected_StartDate == null){
                		selected_StartDate = document.getElementById("datepicker_startdate").value;
                	}
	                
	                if(selected_EndDate == null){
                		selected_EndDate = document.getElementById("datepicker_enddate").value;
                	}
	                else{
	                	selected_EndDate = selectedDate;
	                }
	                
	            }                
	        });
	    })
	         
	    // datePicker 한글적용을 위해 추가
	    $.datepicker.setDefaults({
	        dateFormat: 'yy.mm.dd',
	        prevText: '이전 달',
	        nextText: '다음 달',
	        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	        showMonthAfterYear: true,
	        yearSuffix: '년'
	    });
        
        function dateChange(){
        	
        	var checkInDate_str = document.getElementById("datepicker_startdate").value;
        	var checkOutDate_str = document.getElementById("datepicker_enddate").value;
        	
        	if(checkInDate_str.length < 1 || checkOutDate_str.length < 1){
        		return false;
        	}
        	
        	const checkInDate = new Date(checkInDate_str).getTime();
        	const checkOutDate = new Date(checkOutDate_str).getTime();
        	
        	// 예약일자 (체크인 ~ 체크아웃 일자)
    		var resvDate = ((checkOutDate - checkInDate) / (1000 * 60 * 60 * 24)) + 1;
    		
        	$("#diffday").html(resvDate);
        	
        }
        
    </script>

	<h1>결제 진행</h1>

    <div id="form">
        
			<input type="hidden" id="m_no" name="m_no" value="${param.m_no}" />
			<input type="hidden" id="s_no" name="s_no" value="${param.s_no}" />
			<input type="hidden" id="r_no" name="r_no" value="${param.r_no}" /> <%-- ${param.r_no} --%>
			<input type="hidden" id="checkindate" name="checkindate" value="${param.checkindate}" />
			<input type="hidden" id="checkoutdate" name="checkoutdate" value="${param.checkoutdate}" />
			<input type="hidden" id="totalEarnPoint" name="totalEarnPoint" value="${earnpoint}" />
			<input type="hidden" id="coupon_no" name="coupon_no" value="" />
            <input type="hidden" id="card_number" name="cardNumber" value="" />
            
            <input type="hidden" id="paymethod" name="paymethod" value="1" />

            <div>
                <ul id="form">
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
                                	<c:if test="${not empty param.checkindate && not empty param.checkoutdate}">
                                		<tr>
	                                        <td class="check_date_header_row" >체크인 일자</td>
	                                        <td class="check_date_header_row">체크아웃 일자</td>
	                                        <td class="check_date_header_row">총 예약 일자</td>
	                                    </tr>
	                                    <tr>
	                                        <td class="check_date_data_row">${checkin_date }</td>
	                                        <td class="check_date_data_row">${checkout_date }</td>
	                                        <td class="check_date_data_row">${diffDay }</td>
	                                    </tr>
                                	</c:if>
                                    <c:if test="${empty param.checkindate || empty param.checkoutdate}">
                                		<tr>
	                                        <td class="check_date_header_row">체크인 일자</td>
	                                        <td class="check_date_header_row">체크아웃 일자</td>
	                                        <td class="check_date_header_row">총 예약 일자</td>
	                                    </tr>
	                                    <tr>
	                                        <td class="check_date_data_row">
	                                        	<input type="text" id="datepicker_startdate" name="event_startdate"  autocomplete="off" readonly placeholder="날짜 선택" onchange="return dateChange();">
	                                        </td>
	                                        <td class="check_date_data_row">
	                                        	<input type="text" id="datepicker_enddate" name="event_startdate" autocomplete="off" readonly placeholder="날짜 선택" onchange="return dateChange();">
	                                        </td>
	                                        <td class="check_date_data_row"  id="diffday">${diffDay }</td>
	                                    </tr>
	                                    <tr>
	                                    	<td colspan="3" style="text-align: right; padding: 10px 10px;">
	                                    		<button type="button"  class="button"  onclick="return resvDate_click('${param.m_no}','${param.s_no}','${param.r_no}');">예약일자 확정</button>
	                                    	</td>
	                                    </tr>
                                	</c:if>
                                </table>
                            </div>
                            <br><br><br>
                            <div id="resv_field">
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
		                                        <td class="first_col"><img class="r_img" src="resources/upload_img/admin/stay/${li.r_img1}" alt="이미지 없음"></td>
		                                        <td class="second_col">
		                                            <div>
		                                                <span>${li.r_name }</span>
		                                            </div>
		                                            <div>
		                                                객실 최대인원수 : <span>${li.r_person_cnt}</span>
		                                            </div>
		                                        </td>
		                                        <td class="third_col"><span id="r_price">${li.r_price}</span>원</td>
		                                    </tr>
                                    </c:forEach>
                                    
                                </table>
                                <br><br><br>
                            </div>
                            <div id="coupon_field">
	                            <div>
	                                <span class="header">쿠폰 / 포인트</span>
	                            </div>
	                            <hr><br>
	                            <div>
	                                 <span>쿠폰 할인</span>
	                                 <button type="button" class="button" id="coupon_use" onclick="coupon_popup_open('${param.m_no}');">쿠폰 적용</button>
	                                 <button type="button" class="button" id="coupon_cancel" onclick="return coupon_cancel_exec();">쿠폰 삭제</button>
	                            </div>
	                            <div>
	                                <span>&nbsp;&nbsp;&nbsp;└ 즉시 할인</span>
	                                <span style="color:red; font-weight: bold;"><span id="coupon_price">0</span>원 </span>
	                            </div>
	                            <br><hr><br>
	                            <div>
	                                <span>포인트</span>
	                                <span><input type="text" id="use_point" name="totalUsePoint" value="0"  autocomplete="off"></span><span>원</span>
	                                <span><button type="button" class="button" onclick="return useAllPoint();">전액 사용</button></span>
	                                &nbsp;&nbsp;<span id="currentAllPoint">${resvList.m_point}</span> 포인트 사용 가능 
	                            </div>
                          	</div>  
                        </div>
                        
                    </li>
                    <li id="main_second_col">
                    	<div id="price_field">
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
	                                    <input type="radio" name="pay_type" value="1" onchange="payMethodChange(1);" checked> 신용카드 결제
	                                    <input type="radio" name="pay_type" value="2" onchange="payMethodChange(2);"> 카카오페이 결제
	                                </span>
	                            </div>
	                            <br>
	                            <fieldset id="cardform">
	                                <span>카드번호 :</span>
	                                <br><br>
	                                <input type="text" id="first_cardnumber" class="cardNumber" onKeyup="return inputMoveNumber(this);" maxlength="4" autocomplete="off"/>&nbsp;-&nbsp;
	                                <input type="password" id="second_cardnumber" class="cardNumber" onKeyup="return inputMoveNumber(this);" maxlength="4"  autocomplete="off"/>&nbsp;-&nbsp;
	                                <input type="password" id="third_cardnumber" class="cardNumber" onKeyup="return inputMoveNumber(this);" maxlength="4"  autocomplete="off"/>&nbsp;-&nbsp;
	                                <input type="text" id="forth_cardnumber" class="cardNumber" onKeyup="return inputMoveNumber(this);" maxlength="4"  autocomplete="off"/>
	                            </fieldset>
	                            <br>
	                        </div>
	                        <div>
	                            <div>
	                                <input type="button" class="paybutton" id="cardPaymentButton" onclick="return paymentExec()" value="카드로 결제하기">
	                                <input type="button" class="paybutton" id="kakaoPaymentButton" onclick="return paymentExec();" value="카카오 페이로 결제하기">
	                            </div>
	                        </div>
                        </div>
                    </li>
                </ul>
            </div>
       
    </div>
	
</body>
</html>