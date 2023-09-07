<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
	
	<!-- 개별 화면 content 크기를 조절하는 방법 -->
	<style>
		#content{
			height: 800px;
		}
	</style>
	
	<style>
        
		/* 
		
			이름 : 남기문
			작업 : 이벤트 조회
			
		 */
		
		 /* 화면 디자인 */
		
		 .searchbox{
		     width: 150px;
		     height: 30px;
		 }
		 #keyword{
		     width: 280px;
		     height: 29px;
		 }
		 .button{
		     background-color: blue;
		     color: white;
		     font-weight: bold;
		     border-radius: 3px;
		     width: 100px;
		     height: 32px;
		 }
		 .button:hover{
		 	cursor: pointer;
		 }
		 table{
		     text-align: center;
		     width: 1200px;
		 }
		 table tbody tr td{
		 	height: 40px;
		 }
		 table thead tr td{
		     border-bottom: 1px solid black;
		 }
		#paging{
			width: 1200px;
			text-align: center;
			
		}
        .winner_button{
           width: 98%; 
        }

    </style>
	
</head>
<body>
    <script>
    
	    $(document).ready(function() {
	        $("#header_checkbox").click(function() {
	            if($("#header_checkbox").is(":checked")) $("input[name=chk]").prop("checked", true);
	            else $("input[name=chk]").prop("checked", false);
	        });
	
	        $("input[name=chk]").click(function() {
	            var total = $("input[name=chk]").length;
	            var checked = $("input[name=chk]:checked").length;
	
	            if(total != checked) $("#header_checkbox").prop("checked", false);
	            else $("#header_checkbox").prop("checked", true); 
	        });
	    });	
    
        function searchExecute(){

            var keyword = document.getElementById("keyword").value;
            
            // 검색 결과 조회
            location.replace("couponlist?page=1&keyword="+ keyword);
            
        }
        
        function couponInsertView()
        {
        	// 쿠폰 등록 화면 이동
        	location.replace("couponinsertview");
        	  
        }
        
        
        function couponDelete()
        {
        	// 쿠폰 삭제
        	
        	var arr = new Array();
        	
            var rows = document.getElementById("searchData").getElementsByTagName("tr");

            // 체크한 데이터들 가져오기
            for (var i = 0; i < rows.length; i++) {
                var cells = rows[i].getElementsByTagName("td")[0].getElementsByTagName("input")[0];

                if(cells.checked == true)
               	{
                	arr.push(rows[i].getElementsByTagName("td")[1].innerHTML);	
               	}
            }
           	
            if(arr.length < 1)
           	{
           		alert("삭제할 쿠폰을 선택해주세요");
           		return false;
           	}
            
            var result = confirm("삭제한 쿠폰은 복구할 수 없습니다. 계속 진행하시겠습니까?")
            
            if(result)
           	{
            	location.replace("coupondelete?coupon_no="+ arr)
           	}
            else
            {
            	return false;	
            }
        }
        
        function coupon_no(){
        	
        }

    </script>

	<!-- 메세지 -->
	<%-- 	<c:if test="${msg != ''}"> --%>
				
	<!-- 		<script> -->
	<%-- 				alert("${msg}"); --%>
	<!--  			 location.replace("event?page=1");  -->
	<!-- 		</script> -->
		
	<%-- </c:if> --%>



    <!-- 메인 -->
    <h1>쿠폰 관리</h1>

    <form action="couponlist">
    
    	<input type="hidden" name="page" value="1" />
    	
    	<div>
    		<br />
    		<span>
    			<c:if test="${empty keyword || keyword eq ''}">
            		<input type="text" id="keyword" name="keyword" placeholder="검색할 쿠폰명을 입력해주세요" autocomplete="off">
            	</c:if>
                <c:if test="${not empty keyword}">
            		<input type="text" id="keyword" name="keyword" value="${keyword}" autocomplete="off">
            	</c:if>
    		</span>
    		<span>
    			<input type="submit" class="button" value="검색" onclick="searchExecute();">
    		</span>
    	</div>
    	<br><br>
    	<div>
    		
    		<table>
	            <thead>
                    <tr>
                    	<td width="3%"><input type="checkbox" id="header_checkbox"></td>
		                <td width="10%">쿠폰번호 / 금액</td>
		                <td width="32%">쿠폰명</td>
		                <td width="15%">무제한 여부</td>
		                <td width="20%">잔여 수량</td>
		                
                    </tr>
                </thead>
                <tbody id="searchData">
                
                	<c:forEach items="${dto}" var="couponlist">
		            	<tr>
			                <!-- 데이터 -->
			                <td><input type="checkbox" name="chk"></td>
					 		<td>${couponlist.coupon_no }</td>
					 		<td>${couponlist.coupon_detail }</td>
					 		<td>${couponlist.coupon_flag }</td>
					 		<td>${couponlist.coupon_qty }</td>
	 	
			            </tr>
		            </c:forEach>
	            
                </tbody>
	            
	        </table>
    		<br /><br />
    	</div>
    	<div>
        	<br />
        	<div id="paging">
        		<c:if test="${vo.page>1}">
					<a href="couponlist?page=1&keyword=${param.keyword}"><i class="fa-solid fa-angles-left"></i></a>
					<a href="couponlist?page=${vo.page-1 }&keyword=${param.keyword}"><i class="fa-solid fa-circle-chevron-left"></i></a>
				</c:if>
	        	<c:forEach begin="${vo.pageStart}" end="${vo.pageEnd }" var="i">
	        	
	        		<c:choose>
	        			<c:when test="${ i ne param.page }">
	        				<a href="couponlist?page=${i}&keyword=${keyword}">${i}</a>
	        			</c:when>
	        			<c:otherwise>
	        				<span>${i}</span>
	        			</c:otherwise>
	        		</c:choose>
	        		
	        	</c:forEach>
	        	<c:if test="${vo.page < vo.totPage}">
					<a href="couponlist?page=${vo.page+1 }&keyword=${param.keyword}"><i class="fa-solid fa-circle-chevron-right"></i></a>
					<a href="couponlist?page=${vo.totPage }&keyword=${param.keyword}"><i class="fa-solid fa-angles-right"></i></a>
				</c:if>
        	</div>
        </div>
    	<div>
    	 	<br />
    	 	<span><input type="button" class="button" value="쿠폰 등록" onclick="return couponInsertView()"></span>
            <span><input type="button" class="button" value="쿠폰 삭제" onclick="couponDelete()"></span>
    	</div>
    </form>
    
</body>
</html>