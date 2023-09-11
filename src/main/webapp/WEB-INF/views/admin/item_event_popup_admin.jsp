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
		#content{
			height: 100%;
		}
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
            background-color: #011343;
            color: #EBD01C;
            font-weight: bold;
            border-radius: 3px;
            width: 100px;
            height: 32px;
            cursor: pointer;
        }
    </style>
    
    <h1>이벤트 검색</h1>

    <script>
		
    	function selectItem(event_no, event_name){
    		
    		// 부모 폼에 데이터를 뿌려준다.
    		opener.document.getElementById("event_no").value = event_no;
			opener.document.getElementById("event_name").value = event_name;
			
			window.close();
		 }

    </script>

    <div id="form">
    
    	<form action="eventpopup">
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
	                    <th width="10%">이벤트 번호</th>
	                    <th width="34%">이벤트 이름</th>
	                    <th width="20%">이벤트 상태</th>
	                    <th width="20%">이벤트 기간</th>
	                    <th width="10%">선택</th>
	                </colgroup>
	                <c:if test="${not empty list}">
	                
	                	<c:forEach items="${list}" var="li">
			                <tr>
			                    <td>${li.event_no }</td>
			                    <td>${li.event_name }</td>
			                    <td>${li.event_flag }</td>
			                    <td>${li.event_date }</td>
			                    <td><button type="button" onclick="selectItem('${li.event_no}','${li.event_name}')">선택</button></td>
			                </tr>
	                	</c:forEach>
	                
	                </c:if>
	                
	            </table> 
	        </div>
	        <br>
	        <c:if test="${not empty list}">
	        
	        	<div id="paging">
	        		<c:if test="${vo.page>1}">
						<a href="eventpopup?page=1&searchType=${param.searchType}&keyword=${param.keyword}"><i class="fa-solid fa-angles-left"></i></a>
						<a href="eventpopup?page=${vo.page-1 }&searchType=${param.searchType}&keyword=${param.keyword}"><i class="fa-solid fa-circle-chevron-left"></i></a>
					</c:if>
		        	<c:forEach begin="${vo.pageStart}" end="${vo.pageEnd }" var="i">
		        		<c:choose>
		        			<c:when test="${ i ne param.page }">
		        				<a href="eventpopup?page=${i}&searchType=${searchType}&keyword=${keyword}">${i}</a>
		        			</c:when>
		        			<c:otherwise>
		        				<span>${i}</span>
		        			</c:otherwise>
		        		</c:choose>
		        	</c:forEach>
		        	<c:if test="${vo.page < vo.totPage}">
						<a href="eventpopup?page=${vo.page+1 }&searchType=${param.searchType}&keyword=${param.keyword}"><i class="fa-solid fa-circle-chevron-right"></i></a>
						<a href="eventpopup?page=${vo.totPage }&searchType=${param.searchType}&keyword=${param.keyword}"><i class="fa-solid fa-angles-right"></i></a>
					</c:if>
	        	</div>
	        </c:if>
    	</form>
    	
    </div>
	
</body>
</html>