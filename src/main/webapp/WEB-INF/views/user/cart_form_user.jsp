<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	
	<style>
		#content{
			
		}
	</style>
	
	<style>
        @font-face {
            font-family: 'GmarketSansMedium';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
        body{
            font-family: 'GmarketSansMedium';
        }
        #form{
            width: 1200px;
        }
        table, tr, td{
            width: 1190px;
            
            border: 1px solid black;
            border-collapse: collapse;
        }

        thead{
            text-align: center;
        }
        thead tr{
            height: 30px;
        }
        tbody tr{
            height: 60px;
        }
        input[class="select"]{
        	display: inline-block;
			width: 20px;
			height: 20px;
			border: 2px solid #bcbcbc;
			cursor: pointer;
        }
        #warning_content{
        	text-align: center;
        }
        #warning_img{
        	width: 150px;
        	height: 150px;
        	margin: 0 auto;
        }
        #warning_text{
        	font-size: 20px;
        }
		.check_index, .col_no, .s_no, .r_no{
            display: none;
            visibility: collapse;
        }
        .button{
		     background-color: #011343;
		     color: #EBD01C;
		     border-radius: 3px;
		     width: 100px;
		     height: 32px;
		     cursor: pointer;
		 }
		 
    </style>
	
</head>
<body>

	<script>

		window.addEventListener('DOMContentLoaded', function(){
		  alert('DOMContentLoaded');
		});
		/* $(document).ready(function() {
			alert("${fn:length(s_list)}")
		}); */
	
	
        function checkOnlyOne(element, s_no) {
        
            const checkboxes = document.getElementsByName("select");
            
            checkboxes.forEach((cb) => {
                cb.checked = false;
            })
            
            element.checked = true;
            document.getElementById("checked_s_no").value = s_no;
            
        }

        function paymentCheck(){
        	
            if(document.getElementById("checked_s_no").value.length < 1){
            	alert("결제 진행할 숙소를 선택해주세요");
            	return false;
            }
            
        	if(confirm("결제 진행하시겠습니까?") == false)
        	{
        		return false;
        	}
        	
        }
        
        function cartDelete(){
        	
        	var checked_s_no = document.getElementById("checked_s_no").value;
        	
        	if(checked_s_no.length < 1){
        		alert("장바구니에서 삭제할 숙소를 선택해주세요");
        		return false;
        	}
        	
        	if( confirm("선택한 내역을 삭제하시겠습니까?") == false){
        		return false;
        	}
        	
        	location.replace("/travel/user/cart_delete?m_no=${param.m_no}&s_no=" + checked_s_no);
        }
    </script>

    <h1>장바구니</h1>
    <div id="form">
        <br>
        <div>
       		<form action="cart_to_payment" onsubmit="return paymentCheck()">
       			<input type="hidden" name="m_no" value="${param.m_no}" />
	        	<input type="hidden" id="checked_s_no" name="s_no" value="" />
	            <div>
	                <table>
	                    <colgroup>
	                        <col style="width: 10%">
	                        <col style="width: 20%">
	                        <col style="width: 50%">
	                        <col style="width: 20%">
	                    </colgroup>
	                    <thead>
	                        <tr>
	                            <td rowspan="2">체크</td>
	                            <td class="col_no">번호</td>
	                            <td>숙소구분</td>
	                            <td colspan="2">숙소명</td>
	                        </tr>
	                        <tr>
	                            <td class="col_no">번호</td>
	                            <td colspan="2">객실명</td>
	                            <td>객실가격 (1DAY 기준)</td>
	                        </tr>
	                    </thead>
	                    <c:forEach items="${s_list}" var="s_list" varStatus="st">
		                    <tbody>
		                        <tr>
		                            <td rowspan="4" style="text-align: center;">
		                            	<input type="checkbox" class="select" name="select" onclick="checkOnlyOne(this,'${s_list.s_no}')">
	                            	</td>
		                            <td class="s_no" style="padding: 0 20px">${s_list.s_no }</td>
		                            <td style="padding: 0 20px">${s_list.s_type}</td>
		                            <td colspan="2" style="padding: 0 20px">${s_list.s_name}</td>
		                        </tr>
		                        <c:forEach items="${r_list[st.index]}" var="r_list">
		                        	<tr>
			                            <td class="r_no" style="padding: 0 20px">${r_list.r_no}</td>
			                            <td colspan="2" style="padding: 0 20px">${r_list.r_name }</td>
			                            <td style="padding: 0 20px">${r_list.r_price} 원</td>
			                        </tr>
		                        </c:forEach>
		                    </tbody>
	                    </c:forEach>
	                </table>
	            </div>
	            <div>
		    	 	<br />
		    	 	<c:if test="${empty s_list}">
		    	 		<div id="warning_content" >
		    	 			<img id="warning_img" src="resources/img/No_Search.jpeg" alt="이미지 없음"/>
		    	 			<br />
			    	 		<span id="warning_text">등록한 장바구니 내역이 존재하지 않습니다.</span>
			    	 		<br /><br /><br />
		    	 		</div>
		    	 	</c:if>
		    	 	
		    	 	<span><input type="submit" class="button" value="결제 진행"></span>
		    	 	&nbsp; &nbsp;
		            <span><input type="button" class="button" value="선택내역 삭제" onclick="return cartDelete();"></span>
		    	</div>
	        </form>
		</div>
    </div>
	
</body>
</html>