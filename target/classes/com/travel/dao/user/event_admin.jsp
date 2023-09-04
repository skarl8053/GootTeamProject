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

    	/* 상단 체크 클릭 시 전체 클릭됨. */
    	
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

            var searchType = document.getElementById("searchType").value;
            var keyword = document.getElementById("keyword").value;
            
            // 검색 결과 조회
            location.replace("event?page=1&searchType=" + searchType + "&keyword="+ keyword);
            
        }
        
        function eventInsert()
        {
        	// 이벤트 등록
        	
        	location.replace("eventinsertform");
        }
        
        function check_date(event_no, check)
        {
            
        	if(check == 'N')
       		{
       			alert('이벤트 종료 이후에 당첨자 지정을 할 수 있습니다.');
       			return false;
       		}
        		
        	location.replace('event_winner?event_no=' + event_no)
        }
        
        function eventDelete()
        {
        	// 이벤트 삭제
        	
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
           		alert("삭제할 이벤트를 선택해주세요");
           		return false;
           	}
            
            var result = confirm("삭제한 이벤트는 복구할 수 없습니다. 계속 진행하시겠습니까?")
            
            if(result)
           	{
            	location.replace("event/delete?event_no="+ arr)
           	}
            else
            {
            	return false;	
            }
            
        	
        }

    </script>

	<!-- 메세지 -->
	<c:if test="${msg != ''}">
			
		<script>
			alert("${msg}");
			/* location.replace("event?page=1"); */
		</script>
		
	</c:if>



    <!-- 메인 -->
    <h1>이벤트 관리</h1>

    <form action="">
    
    	<input type="hidden" name="page" value="1" />
    	
    	<div>
    		<br />
    		<span>
    		
    			<select class="searchbox" id ="searchType" name="searchType" >
		           	<c:if test="${empty searchType || searchType eq 1}">
		                <option value="1" selected>전체 조회</option>
		                <option value="2">이벤트 시작 전</option>
		                <option value="3">이벤트 진행 중</option>
		                <option value="4">이벤트 종료</option>
		            </c:if>
		            <c:if test="${searchType eq 2}">
		                <option value="1">전체 조회</option>
		                <option value="2" selected>이벤트 시작 전</option>
		                <option value="3">이벤트 진행 중</option>
		                <option value="4">이벤트 종료</option>
		            </c:if>
		            <c:if test="${searchType eq 3}">
		                <option value="1">전체 조회</option>
		                <option value="2">이벤트 시작 전</option>
		                <option value="3" selected>이벤트 진행 중</option>
		                <option value="4">이벤트 종료</option>
		            </c:if>
		            <c:if test="${searchType eq 4}">
		                <option value="1">전체 조회</option>
		                <option value="2">이벤트 시작 전</option>
		                <option value="3">이벤트 진행 중</option>
		                <option value="4" selected>이벤트 종료</option>
		            </c:if>
		        </select>
		        
    		</span>
    		<span>
    		
    			<c:if test="${empty keyword || keyword eq ''}">
            		<input type="text" id="keyword" name="keyword" placeholder="검색할 이벤트 이름을 입력해주세요">
            	</c:if>
                <c:if test="${keyword != ''}">
            		<input type="text" id="keyword" name="keyword" value="${keyword}">
            	</c:if>
            	
    		</span>
    		<span>
    		
    			<input type="button" class="button" value="검색" onclick="searchExecute();">
    			
    		</span>
    	</div>
    	<br><br>
    	<div>
    		
    		<table>
	            <thead>
                    <tr>
                    
                    	<td width="3%"><input type="checkbox" id="header_checkbox"></td>
		                <td width="10%">이벤트 번호</td>
		                <td width="32%">이벤트 명</td>
		                <td width="15%">이벤트 진행 상태</td>
		                <td width="20%">이벤트 기간</td>
		                <td width="20%">당첨자 지정 / 조회</td>
		                
                    </tr>
                </thead>
                <tbody id="searchData">
                
                	<c:forEach items="${list}" var="li">
		            	<tr>
			                <td><input type="checkbox" name="chk"></td>
			                <td>${li.event_no}</td>
			                <td><a href="eventdetail?event_no=${li.event_no}">${li.event_name }</a></td>
			                <td>
			                		<c:if test="${li.event_flag_num eq 1 }">
			                			<span>이벤트 시작 전</span>
			                		</c:if>
			                		<c:if test="${li.event_flag_num eq 2 }">
			                			<span>이벤트 진행중</span>
			                		</c:if>
			                		<c:if test="${li.event_flag_num eq 3 }">
			                			<span>이벤트 종료</span>
			                		</c:if>
			                </td>
			                <td><span>${li.event_startdate} </span>~<span> ${li.event_enddate}</span></td>
			                <td>
			                	<button type="button" class="winner_button" onclick="return check_date('${li.event_no}', '${li.check_winner_date}');">당첨자 지정</button>
			                	<!-- <input type="hidden" id="check_winner_date" value=""> -->
			                </td>
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
					<a href="event?page=1&searchType=${param.searchType}&keyword=${param.keyword}"><i class="fa-solid fa-angles-left"></i></a>
					<a href="event?page=${vo.page-1 }&searchType=${param.searchType}&keyword=${param.keyword}"><i class="fa-solid fa-circle-chevron-left"></i></a>
				</c:if>
	        	<c:forEach begin="${vo.pageStart}" end="${vo.pageEnd }" var="i">
	        	
	        		<c:choose>
	        			<c:when test="${ i ne param.page }">
	        				<a href="event?page=${i}&searchType=${searchType}&keyword=${keyword}">${i}</a>
	        			</c:when>
	        			<c:otherwise>
	        				<span>${i}</span>
	        			</c:otherwise>
	        		</c:choose>
	        		
	        	</c:forEach>
	        	<c:if test="${vo.page < vo.totPage}">
					<a href="event?page=${vo.page+1 }&searchType=${param.searchType}&keyword=${param.keyword}"><i class="fa-solid fa-circle-chevron-right"></i></a>
					<a href="event?page=${vo.totPage }&searchType=${param.searchType}&keyword=${param.keyword}"><i class="fa-solid fa-angles-right"></i></a>
				</c:if>
        	</div>
        </div>
    	<div>
    	 	<br />
    	 	<span><input type="button" class="button" value="이벤트 등록" onclick="return eventInsert()"></span>
            <span><input type="button" class="button" value="이벤트 삭제" onclick="eventDelete()"></span>
    	</div>
    </form>
    
</body>
</html>