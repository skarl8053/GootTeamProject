<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<!-- 개별 화면 content 크기를 조절하는 방법 -->
	<style>
		#content{
			height: 1300px;
		}
	</style>
	
</head>
<body>

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
        #event_name{
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
            width: 1200px;
            border-collapse: collapse;
        }
       	th, td{
            border: 1px solid black;
       	}
        table tbody tr td{
        	height: 40px;
        }
        table thead tr td{
            border-bottom: 1px solid black;
        }
        #header_checkbox{
        	text-align: center;
        	width: 5%;
        	height: 300px;
        }
        #first_col{
        	text-align: center;
            width: 10%;
            height: 300px;
        }
        #second_col{
        	text-align: center;
            width: 25%;
            height: 300px;
        }
        #third_col{
            width: 55%;
            height: 300px;
        }
        .item_name, .item_desc{
        	width: 615px;
            resize: none;
            border-style: none;
        }
		#paging{
			width: 1200px;
			text-align: center;
			
		}
        .winner_button{
           width: 98%; 
        }

    </style>

    <script>

        function searchEvent(){

            // 이벤트 조회화면 팝업으로 띄워줌

            var opensite = "eventpopup?&page=1";
            	
            window.open(opensite, 'window', 'width=700px, height=830px');
            
        }
        
        function searchItem(){

        	var event_no = document.getElementById("event_no").value;
        	var event_name = document.getElementById("event_name").value;
        	
           if(event_no.length < 1 || event_name.length <1){
        	   alert("경품 조회할 이벤트를 선택해주세요");
        	   return false;
           }
           
        }
        
        function insertItem(event_no, event_name){
        	location.replace("itemform?event_no=" + event_no + "&event_name=" + event_name + "&gubun=insert")
        }
        
		function deleteItem(event_no){
			
			var check = confirm("제품 전체가 삭제됩니다. 계속 진행하시겠습니까?");
			
			if(check == false){
				return false;
			}
			else{
				location.replace("itemdelete?event_no=" + event_no);
			}
        }
        
    </script>

	<!-- 메세지 -->

	<c:if test="${not empty msg }">
	
		<script>
			alert("${msg}");
			location.replace("item?page=1&event_no=${event_no}&event_name=${event_name}");
		</script>
		
	</c:if>

	<!-- 메세지 -->
	<c:if test="${msg != ''}">
			
		<script>
			alert("${msg}");
			location.replace("item");
		</script>
		
	</c:if>

    <!-- 메인 -->
    <h1>경품 관리</h1>

    <form action="item?event_no=${param.event_no}" onsubmit="return searchItem()">
    
    	<input type="hidden" name="page" value="1" />
    	<input type="hidden" id="event_no" name="event_no" value="${event_no }"/>
    
    	<div>
    			<input type="button" class="button" value="이벤트 조회" onclick="searchEvent();">
    	</div>
    	<div>
    		<br />
    		<span>
                <input type="text" id="event_name" name="event_name" value="${event_name}" readonly>
    		</span>
    		<span>
    			<input type="submit" class="button" value="검색" >
    		</span>
    	</div>
    	<br><br>
    	<div>
            <table>
                <tr>
                    <th width="10%">등수</th>
                    <th width="38%">사진</th>
                    <th width="52%">제품 / 설명</th>
                </tr>
                <c:forEach items="${list}" var="li">
                    <tr>
                        <td id="first_col">${li.item_no}</td>
                        <td id="second_col">
	                        <img src="resources/upload_img/admin/item/${li.filename}" alt="이미지 없음" />
                        </td><!-- 이미지로 수정할 것 -->
                        <td id="third_col">
                        	제품 이름 : <br>
                            <input type="text" class="item_name" value="${li.item_name}" readonly><br>
                        	제품 설명 : <br>
                        	<textarea rows="15" class="item_desc" readonly>${li.item_desc}</textarea>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <br /><br />
        <div>
        	<c:if test="${not empty param.event_no && not empty param.event_name }">
        		<c:if test="${not empty list}">
	        		<input type="button" class="button" value="경품 삭제" onclick="return deleteItem('${param.event_no}');">
	        	</c:if>
	        	<c:if test="${empty list}">
	        		<input type="button" class="button" value="경품 등록" onclick="insertItem('${param.event_no}','${param.event_name }');">
	        	</c:if>
        	</c:if>
        </div>
    </form>
	
</body>
</html>