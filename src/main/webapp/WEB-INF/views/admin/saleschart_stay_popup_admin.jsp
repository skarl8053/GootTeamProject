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
        button, #submit{
            background-color: blue;
            color: white;
            font-weight: bold;
            border-radius: 3px;
            width: 100px;
            height: 32px;
            cursor: pointer;
        }
    </style>
    
    <h1>숙소 검색</h1>

    <script>
		
    	function selectItem(s_no, s_name){
    		
    		// 부모 폼에 데이터를 뿌려준다.
    		opener.document.getElementById("s_no").value = s_no;
			opener.document.getElementById("s_name").value = s_name;
			
			window.close();
		}

    </script>

    <div id="form">
    
    	<form action="stay_popup">

    		<input type="hidden" name="page" value="1" />

	    	<div id="search">
	            <span>
	            	<c:if test="${empty keyword || keyword eq ''}">
	            		<input type="text" id="keyword" name="keyword" placeholder="검색할 내용을 입력해주세요">
	            	</c:if>
	                <c:if test="${keyword != ''}">
	            		<input type="text" id="keyword" name="keyword" autocomplete="off" value=${param.keyword }>  
	            	</c:if>
	            </span>
	            <span>
	            	<input type="submit" id="submit" value="검색"/>
	            </span>
	        </div>
	        <br>
	        <div id="result">
	            <table>
	                <colgroup>
	                    <th width="15%">숙소 번호</th>
	                    <th width="59%">숙소 이름</th>
	                    <th width="26%">숙소 타입</th>
	                    <th width="10%">선택</th>
	                </colgroup>
	                <c:if test="${not empty list}">
	                
	                	<c:forEach items="${list}" var="li">
			                <tr>
			                    <td>${li.s_no }</td>
			                    <td>${li.s_name }</td>
			                    <td>${li.s_type }</td>
			                    <td><button type="button" onclick="selectItem('${li.s_no}','${li.s_name}')">선택</button></td>
			                </tr>
	                	</c:forEach>
	                </c:if>
	            </table> 
	        </div>
	        <br>
	        <c:if test="${not empty list}">
	        	<div id="paging">
	        		<c:if test="${vo.page>1}">
						<a href="stay_popup?page=1&searchType=${param.searchType}&keyword=${param.keyword}"><i class="fa-solid fa-angles-left"></i></a>
						<a href="stay_popup?page=${vo.page-1 }&searchType=${param.searchType}&keyword=${param.keyword}"><i class="fa-solid fa-circle-chevron-left"></i></a>
					</c:if>
		        	<c:forEach begin="${vo.pageStart}" end="${vo.pageEnd }" var="i">
		        		<c:choose>
		        			<c:when test="${ i ne param.page }">
		        				<a href="stay_popup?page=${i}&searchType=${searchType}&keyword=${keyword}">${i}</a>
		        			</c:when>
		        			<c:otherwise>
		        				<span>${i}</span>
		        			</c:otherwise>
		        		</c:choose>
		        	</c:forEach>
		        	<c:if test="${vo.page < vo.totPage}">
						<a href="stay_popup?page=${vo.page+1}&searchType=${param.searchType}&keyword=${param.keyword}"><i class="fa-solid fa-circle-chevron-right"></i></a>
						<a href="stay_popup?page=${vo.totPage }&searchType=${param.searchType}&keyword=${param.keyword}"><i class="fa-solid fa-angles-right"></i></a>
					</c:if>
	        	</div>
	        </c:if>
    	</form>
    	
    </div>
	
</body>
</html>