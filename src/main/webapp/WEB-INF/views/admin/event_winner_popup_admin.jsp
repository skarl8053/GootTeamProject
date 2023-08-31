<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>

	<style>
        body{
            resize: none;
        }
        #form{
            width: 600px;
            height: 800px;
            max-width: 600px;
            max-height: 800px;
            text-align: center;
        }
        #search{
            width: 675px;
            margin: 0 auto;
        }
        #searchType{
            width: 180px;
            height: 28px;
            margin: 0 auto;
        }
        #keyword{
            width: 345px;
            height: 25px;
        }
        #result{
            border: 1px solid black;
            width: 670px;
            height: 650px;
        }

        table{
            width: 650px;
            margin: 0 auto;
            text-align: center;
        }
        th{
            border-bottom: 1px solid black;
        }
        tr{
            height: 50px
        }
        #paging{
            width: 670px;
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
    </style>
    
    <h1>아이디 검색</h1>

    <script>

    	function searchResult(m_no_gubun, m_email_gubun){
    		
    		var searchType = document.getElementById("searchType").value;
    		var keyword = document.getElementById("keyword").value;
    		
    		var event_no = document.getElementById("event_no").value;
    		
    		
    		location.replace("memberpopup?event_no=" + event_no + "&m_no_gubun=" + m_no_gubun +"&m_email_gubun=" + m_email_gubun + "&searchType=" + searchType + "&keyword=" + keyword);
    	}
    
        function selectItem(m_no_gubun, m_no_value, m_email_gubun, m_email_value){
        	
        	opener.document.getElementById(m_no_gubun).value = m_no_value;
			opener.document.getElementById(m_email_gubun).value = m_email_value;
			
			window.close();
		 }

    </script>

    <div id="form">
        <div id="search">
            <span>
            	
            	<input type="hidden" id="event_no" name="event_no" value="${param.event_no }" />
            	<input type="hidden" id="gubun" name="gubun" value="${param.gubun }" />
            	
                <select id="searchType" name="searchType">
                	<c:if test="${empty searchType || searchType eq '1'}">
	                    <option value="1" selected>전체</option>
	                    <option value="2">이름으로 검색</option>
	                    <option value="3">아이디로 검색</option>
                    </c:if>
                    <c:if test="${searchType eq '2'}">
	                    <option value="1">전체</option>
	                    <option value="2" selected>이름으로 검색</option>
	                    <option value="3">아이디로 검색</option>
                    </c:if>
                    <c:if test="${searchType eq '3'}">
	                    <option value="1">전체</option>
	                    <option value="2">이름으로 검색</option>
	                    <option value="3" selected>아이디로 검색</option>
                    </c:if>
                </select>
            </span>
            <span>
            	<c:if test="${empty keyword || keyword eq ''}">
            		<input type="text" id="keyword" name="keyword" placeholder="검색할 내용을 입력해주세요">
            	</c:if>
                <c:if test="${keyword != ''}">
            		<input type="text" id="keyword" name="keyword" autocomplete="off" value=${param.keyword }>  
            	</c:if>
            </span>
            <span>
                <button type="button" onclick="searchResult('${param.m_no_gubun}', '${param.m_email_gubun}')">검색</button>
            </span>
        </div>
        <br>
        <div id="result">
            <table>
                <colgroup>
                    <th width="20%">회원번호</th>
                    <th width="30%">아이디</th>
                    <th width="30%">이름</th>
                    <th width="20%">선택</th>
                </colgroup>
                <c:forEach items="${list}" var="li">
	                <tr>
	                    <td>${li.m_no }</td>
	                    <td>${li.m_email }</td>
	                    <td>${li.m_name }</td>
	                    <td><button type="button" onclick="selectItem('${param.m_no_gubun}','${li.m_no}','${param.m_email_gubun}','${li.m_email}')">선택</button></td>
	                </tr>
                </c:forEach>
            </table> 
        </div>
        <br>
        <div id="paging">
        		<c:if test="${vo.page>1}">
					<a href="memberpopup?page=1&searchType=${param.searchType}&keyword=${param.keyword}"><i class="fa-solid fa-angles-left"></i></a>
					<a href="memberpopup?page=${vo.page-1 }&searchType=${param.searchType}&keyword=${param.keyword}"><i class="fa-solid fa-circle-chevron-left"></i></a>
				</c:if>
	        	<c:forEach begin="${vo.pageStart}" end="${vo.pageEnd }" var="i">
	        		<c:choose>
	        			<c:when test="${ i ne param.page }">
	        				<a href="memberpopup?page=${i}&searchType=${searchType}&keyword=${keyword}">${i}</a>
	        			</c:when>
	        			<c:otherwise>
	        				<span>${i}</span>
	        			</c:otherwise>
	        		</c:choose>
	        	</c:forEach>
	        	<c:if test="${vo.page < vo.totPage}">
					<a href="memberpopup?page=${vo.page+1 }&searchType=${param.searchType}&keyword=${param.keyword}"><i class="fa-solid fa-circle-chevron-right"></i></a>
					<a href="memberpopup?page=${vo.totPage }&searchType=${param.searchType}&keyword=${param.keyword}"><i class="fa-solid fa-angles-right"></i></a>
				</c:if>
        	</div>
    </div>
	
</body>
</html>