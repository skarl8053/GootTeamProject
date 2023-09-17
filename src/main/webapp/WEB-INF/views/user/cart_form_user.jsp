<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	
	<style>
		#content{
			height: 100%;
		}
	</style>
	
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
        #form{
            width: 1200px;
        }

		#cart_list{
			width: 1190px;
            margin: 0 auto;
		}

		#recomend_list{
			width: 1190px;
			margin: 0 auto;
		}

        #cart_list, #recomend_list, tr, td{
            border: 1px solid black;
            border-collapse: collapse;
            font-size: 20px;
        }

		#recomend_list tbody img{
			width: 235px;
			height: 200px;
			margin: 0 auto;
		}

        #cart_list thead, #recomend_list thead{
            text-align: center;
        }
        #cart_list thead tr{
            height: 30px;
        }
        #cart_list tbody tr{
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
        
        #recommend_field{
        	display: none;
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
		
		function simfunc(target, s_no) {
			if (target.checked) {
				var htmltxt="";
				$.ajax({
					type:"post",
					url:"cart_sim?s_no=" + s_no,
					success:function(result){
						
						var img_path = "resources/upload_img/admin/stay/"
						var link_path = "stay_detail_user?s_no=";
						
						for(i=0; i<5; i++){
							
							// 추천 숙소 이미지 넣기
							$('#recomend_img' + (i+1)).attr("src", img_path + result[i].s_img1);
							$('#recommend_link' + (i+1)).attr("href", link_path + result[i].s_no);
							
						}
					}
				});	
			}
		}
	
        function checkOnlyOne(element, s_no, s_name) {
        
            const checkboxes = document.getElementsByName("select");
            
            checkboxes.forEach((cb) => {
                cb.checked = false;
            })
            
            element.checked = true;
            document.getElementById("checked_s_no").value = s_no;
            
            simfunc(element, s_no);
            
            $("#recommend_field").css("display", "block");
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
        	
        	var m_no = "<c:out value='${param.m_no}'/>";
        	var checked_s_no = document.getElementById("checked_s_no").value;
        
        	if(checked_s_no.length < 1){
        		alert("장바구니에서 삭제할 숙소를 선택해주세요");
        		return false;
        	}
        	
        	if( confirm("선택한 내역을 삭제하시겠습니까?") == false){
        		return false;
        	}
        	
        	location.replace("cart_delete?m_no=" + m_no + "&s_no=" + checked_s_no);
        }
    </script>

	<!-- 메세지 -->
	<c:if test="${msg != ''}">
			
		<script>
			alert("${msg}");
			location.replace("cart?m_no=${m_no}");
		</script>
		
	</c:if>

    <h1>장바구니</h1>
	
    <div id="form">
        <br>
        <div>
       		<form action="cart_to_payment" onsubmit="return paymentCheck()">
       			<input type="hidden" name="m_no" value="${param.m_no}" />
	        	<input type="hidden" id="checked_s_no" name="s_no" value="" />
	            <div>
	                <table id="cart_list">
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
		                            <td rowspan="${fn:length(r_list[st.index]) + 1}" style="text-align: center;">
		                            	<input type="checkbox" class="select" name="select" onclick="checkOnlyOne(this,'${s_list.s_no}', '${s_list.s_name}')">
	                            	</td>
		                            <td class="s_no" style="padding: 0 20px">${s_list.s_no }</td>  <!-- 숙소번호는 숨김 -->
		                            <td style="padding: 0 20px; color: green;">${s_list.s_type}</td>
		                            <td colspan="2" style="padding: 0 20px; color: blue;"><a href="stay_detail_user?s_no=${s_list.s_no}">${s_list.s_name}</a></td>
		                        </tr>
		                        <c:forEach items="${r_list[st.index]}" var="r_list">
		                        	<tr>
			                            <td class="r_no" style="padding: 0 20px">${r_list.r_no}</td> <!-- 객실 번호는 숨김 -->
			                            <td colspan="2" style="padding: 0 20px; color: purple;">${r_list.r_name }</td>
			                            <td style="padding: 0 20px; color: red;">${r_list.r_price} 원</td>
			                        </tr>
		                        </c:forEach>
		                    </tbody>
	                    </c:forEach>
	                </table>
	            </div>
	            <div>
		    	 	<br /><br />
		    	 	<c:if test="${empty s_list}">
		    	 		<div id="warning_content" >
		    	 			<img id="warning_img" src="resources/img/No_Search.jpeg" alt="이미지 없음"/>
		    	 			<br />
			    	 		<span id="warning_text">등록한 장바구니 내역이 존재하지 않습니다.</span>
			    	 		<br /><br /><br />
		    	 		</div>
		    	 	</c:if>
					<div id="recommend_field">
						<hr>
						<br>
						<h3>이런 숙소들도 장바구니에 담아보세요!!</h3>
						<table id="recomend_list">
							<thead>
								<tr>
									<td>추천 숙소 1</td>
									<td>추천 숙소 2</td>
									<td>추천 숙소 3</td>
									<td>추천 숙소 4</td>
									<td>추천 숙소 5</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<a id="recommend_link1" href=""><img id="recomend_img1" src="" alt=""></a>
									</td>
									<td>
										<a id="recommend_link2" href=""><img id="recomend_img2" src="" alt=""></a>
									</td>
									<td>
										<a id="recommend_link3" href=""><img id="recomend_img3" src="" alt=""></a>
									</td>
									<td>
										<a id="recommend_link4" href=""><img id="recomend_img4" src="" alt=""></a>
									</td>
									<td>
										<a id="recommend_link5" href=""><img id="recomend_img5" src="" alt=""></a>
									</td>
								</tr>
							</tbody>
							
						</table>
					</div>
					<br><hr /><br />
					
		    	 	<span><input type="submit" class="button" value="결제 진행"></span>
		    	 	&nbsp; &nbsp;
		            <span><input type="button" class="button" value="선택내역 삭제" onclick="return cartDelete();"></span>
		    	</div>
	        </form>
		</div>
    </div>
	
</body>
</html>