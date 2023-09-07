<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 구매 내역</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/purchase_list_admin.css"/>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
	<style>
        #content{
            height: auto;
            margin : auto;
        }
    </style>
</head>
<body>

	<c:if test="${not empty sessionScope.m_no}">
   
      <c:if test="${not empty msg}">
         <script>
            alert("${msg}");
            location.replace("/travel/admin/purchase");
         </script>
      </c:if>
      
   </c:if>
   
	<!-- 신재환 회원 구매 내역 -->
	
	<h2>회원 구매내역</h2>
    <hr>
    <h3>다녀온 숙소</h3>
    <form action="">
    <div id="form">
        <div id="search">
            <span>
            	
                <select id="searchType" name="searchType">
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
				            <input type="text" id="keyword" name="keyword" placeholder="검색할 내용을 입력해주세요">
				        </c:when>
				       <c:otherwise>
				            <input type="text" id="keyword" name="keyword" autocomplete="off" value="${param.keyword}">
				       </c:otherwise>
				    </c:choose>
				</span>
            <span>
                <button type="submit" id="btn">검색</button>
            </span>
        </div>
    </div><br /> 
    </form>
    <table style="border: 1px solid black;">
        <tr>
            <td width="10%">주문번호</td>
            <td width="18%">숙소 썸네일</td>
            <td width="10%">숙소명</td>
            <td width="10%">결제방식</td>
            <td width="10%">결제금액</td>
            <td width="14%">결제날짜</td>
            <td width="16%">다녀온 날짜</td>
        </tr>
        <c:forEach items="${p_list }" var="p_list">
       	<input type="hidden" name="page" value="1" />
        	<tr>
	        	<td>${p_list.order_no }</td>
	            <td><img src="resources/upload_img/admin/stay/${p_list.s_img1 }" alt="이미지 없음" class="stay_image"/></td>
	            <td>${p_list.s_name }</td>
	            <td>${p_list.payment_method }</td>
	            <td>${p_list.payment_price }</td>
	            <td>${p_list.order_date }</td>
	            <td>${p_list.check_in_date } ~ <br />
	            	${p_list.check_out_date }
	            </td>
        	</tr>
        </c:forEach>
    </table>
    
    <c:if test="${vo.page>1}">
    	<a href="purchase?page=1&searchType=${searchType }&keyword=${keyword}"><i class="fa-solid fa-angles-left"></i></a>
    	<a href="purchase?page=${vo.page-1 }&searchType=${searchType }&keyword=${keyword}"><i class="fa-solid fa-circle-chevron-left"></i></a>
    </c:if>

	<c:forEach begin="${vo.pageStart}" end="${vo.pageEnd }" var="i">
		<c:choose>
			<c:when test="${i ne page}">
				<a href="purchase?page=${i}&searchType=${searchType }&keyword=${keyword}">${i}</a>
			</c:when>
			<c:otherwise>
				<span>${i}</span>
			</c:otherwise>
		</c:choose>
	</c:forEach>

	<c:if test="${vo.page < vo.totPage }">
    	<a href="purchase?page=${vo.page+1 }&searchType=${searchType }&keyword=${keyword}"><i class="fa-solid fa-circle-chevron-right"></i></a>
    	<a href="purchase?page=${vo.totPage }&searchType=${searchType }&keyword=${keyword}"><i class="fa-solid fa-angles-right"></i></a>
    </c:if>
    
</body>
</html>