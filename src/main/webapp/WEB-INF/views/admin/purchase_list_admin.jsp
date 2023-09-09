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
			height: 2900px;
		}
	</style>
	
	<style>
        
		/* 
		
			이름 : 신재환
			작업 : 회원 구매 내역 조회
			
		 */
		
		/* 화면 디자인 */
		@font-face {
				    font-family: 'GmarketSansMedium';
				    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
				    font-weight: normal;
				    font-style: normal;
		}
		*{
			font-family: 'GmarketSansMedium';
		}
		.searchbox{
			width: 150px;
			height: 30px;
		}
		#keyword{
			width: 280px;
			height: 29px;
		}
		.button{
			background-color: #011343;
			color: #EBD01C;
			border-radius: 3px;
			width: 100px;
			height: 32px;
			cursor: pointer;
		}
		.button:hover{
			cursor: pointer;
		}
		.s_img1, .img_col{
			width: 250px;
			height: 250px;	
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
		#paging{
			width: 1200px;
			text-align: center;
			
		}
		.winner_button{
			width: 98%; 
			background-color: #011343;
			color: #EBD01C;
			cursor: pointer;
		}

    </style>
	
</head>
<body>
    

	<!-- 메세지 -->
	<c:if test="${not empty msg}">
			
		<script>
			alert("${msg}");
			location.replace("purchase");
		</script>
		
	</c:if>

	<script>
	
		function searchbox_change(){
			
			document.getElementById("keyword").value = "";
			
		}
		
		function searchCheck(){
			
			var keyword = document.getElementById("keyword").value;
			
			if(keyword.length < 1){
				alert("검색할 내용을 입력해주세요");
				return false;
			}
			
		}
	
	</script>

    <!-- 메인 -->
    <h1>회원 구매 내역 조회</h1>

    <form action="purchase" onsubmit="return searchCheck()">
    
    	<input type="hidden" name="page" value="1" />
    	
    	<div>
    		<br />
    		<span>
				<select class="searchbox" id="searchType" name="searchType" onchange="searchbox_change()">
                    <c:if test="${searchType eq 1 || searchType eq null}">
	                    <option value="1" selected>이름으로 검색</option>
	                    <option value="2">이메일로 검색</option>
	                    <option value="3">주문번호로 검색</option>
                    </c:if>
                    <c:if test="${searchType eq 2}">
	                    <option value="1">이름으로 검색</option>
	                    <option value="2" selected>이메일로 검색</option>
	                    <option value="3">주문번호로 검색</option>
                    </c:if>
                    <c:if test="${searchType eq 3}">
	                    <option value="1">이름으로 검색</option>
	                    <option value="2">이메일로 검색</option>
	                    <option value="3" selected>주문번호로 검색</option>
                    </c:if>
                </select>
    		</span>
    		<span>
    			<c:choose>
					<c:when test="${empty keyword || keyword eq ''}">
						<input type="text" id="keyword" name="keyword" placeholder="검색할 내용을 입력해주세요" autocomplete="off">
					</c:when>
					<c:otherwise>
						<input type="text" id="keyword" name="keyword" autocomplete="off" value="${param.keyword}">
					</c:otherwise>
				</c:choose>
    		</span>
    		<span>
    			<input type="submit" class="button" value="검색">
    		</span>
    	</div>
    	<br><br>
    	<div>
    		<table>
	            <thead>
					<tr>
						<td width="5%">주문번호</td>
						<td width="18%">숙소 썸네일</td>
						<td width="21%">숙소명</td>
						<td width="7%">결제방식</td>
						<td width="7%">결제금액</td>
						<td width="14%">결제날짜</td>
						<td width="16%">다녀온 날짜</td>
					</tr>
                </thead>
                <tbody id="searchData">
					<c:forEach items="${p_list }" var="p_list">
						<tr>
							<td>${p_list.order_no }</td>
							<td class="img_col"><img src="resources/upload_img/admin/stay/${p_list.s_img1}" class="s_img1" alt="이미지 없음" class="stay_image"/></td>
							<td>${p_list.s_name }</td>
							<td>${p_list.payment_method }</td>
							<td>${p_list.payment_price }</td>
							<td>${p_list.order_date }</td>
							<td>${p_list.check_in_date } ~ <br />
								${p_list.check_out_date }
							</td>
						</tr>
					</c:forEach>
                </tbody>
	        </table>
    		<br /><br />
    	</div>
    	<div>
        	<br />
        	<c:if test="${empty param.searchType && empty param.keyword}">
    	 		<div id="warning_content" >
    	 			<img id="warning_img" src="resources/img/PL_Search.png" alt="이미지 없음"/>
    	 			<br />
	    	 		<span id="warning_text">내용을 검색해주세요</span>
	    	 		<br /><br /><br />
    	 		</div>
    	 	</c:if>
        	<c:if test="${(not empty param.param1 || not empty param.keyword) && empty p_list}">
		    	 <div id="warning_content" >
		    	 		<img id="warning_img" src="resources/img/No_Search.jpeg" alt="이미지 없음"/>
		    	 		<br />
			    	 	<span id="warning_text">검색된 회원 구매내역이 없습니다.</span>
			    	 	<br /><br /><br />
		    	 </div>
		    </c:if>
		    <c:if test="${not empty p_list}">
		    	<div id="paging">
	        		<c:if test="${vo.page>1}">
						<a href="purchase?page=1&searchType=${param.searchType}&keyword=${param.keyword}"><i class="fa-solid fa-angles-left"></i></a>
						<a href="purchase?page=${vo.page-1 }&searchType=${param.searchType}&keyword=${param.keyword}"><i class="fa-solid fa-circle-chevron-left"></i></a>
					</c:if>
		        	<c:forEach begin="${vo.pageStart}" end="${vo.pageEnd }" var="i">
		        	
		        		<c:choose>
		        			<c:when test="${ i ne param.page }">
		        				<a href="purchase?page=${i}&searchType=${searchType}&keyword=${keyword}">${i}</a>
		        			</c:when>
		        			<c:otherwise>
		        				<span>${i}</span>
		        			</c:otherwise>
		        		</c:choose>
		        		
		        	</c:forEach>
		        	<c:if test="${vo.page < vo.totPage}">
						<a href="purchase?page=${vo.page+1 }&searchType=${param.searchType}&keyword=${param.keyword}"><i class="fa-solid fa-circle-chevron-right"></i></a>
						<a href="purchase?page=${vo.totPage }&searchType=${param.searchType}&keyword=${param.keyword}"><i class="fa-solid fa-angles-right"></i></a>
					</c:if>
	        	</div>
		    </c:if>
        </div>
    </form>
    
</body>
</html>