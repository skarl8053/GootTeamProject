<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/report_admin.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
    
    <title>어디갈래? - 신고 내역 조회</title>
    
    <!-- 개별 화면 content 크기를 조절하는 방법 -->
	<style>
		#content{
			height: 800px;
		}
	</style>
    
</head>
<body>
    
    <style>
    	
		/* 
		
			이름 : 남기문
			작업 : 신고관리 내역 조회
			
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
		     width: 200px;
		     height: 29px;
		 }
		 .button{
		     background-color: #011343;
		     color: #EBD01C;
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
		 table thead tr td{
		     border-bottom: 1px solid black;
		 }
		#paging{
			width: 1200px;
			text-align: center;
			
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
		 /* 스위치 디자인 */
		
		 .wrapper {
			 width: 50px;
			 height: 50px;
			 text-align: center;
			 margin: 50px auto;
		 }
		
		 #switch {
			 position: absolute;
			 /* hidden */
			 appearance: none;
			 -webkit-appearance: none;
			 -moz-appearance: none;
		 }
		
		 .switch_label {
			 position: relative;
			 cursor: pointer;
			 display: inline-block;
			 width: 58px;
			 height: 28px;
			 background: #fff;
			 border: 2px solid #daa;
			 border-radius: 20px;
			 transition: 0.2s;
		 }
		 .switch_label:hover {
		 	background: #efefef;
		 }
		 .onf_btn {
			 position: absolute;
			 top: 4px;
			 left: 3px;
			 display: inline-block;
			 width: 20px;
			 height: 20px;
			 border-radius: 20px;
			 background: #daa;
			 transition: 0.2s;
		 }
		
		 /* checking style */
		 #switch:checked+.switch_label {
			 background: #c44;
			 border: 2px solid #c44;
		 }
		
		 #switch:checked+.switch_label:hover {
		 	background: #e55;
		 }
		
		 /* move */
		 #switch:checked+.switch_label .onf_btn {
			 left: 34px;
			 background-color: #fff;
			 box-shadow: 1px 2px 3px #00000020;
		 }
 
    	
    </style>
    
    <h1>신고 내역 조회 / 설정 변경</h1>
    
    
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

            var param1 = document.getElementById("param1").value;
            var keyword = document.getElementById("keyword").value;
            
           /*  alert(param1 + param2 + keyword); */
            
            // 검색 결과 조회
            location.replace("report?page=1&param1=" + param1 + "&keyword="+ keyword);
        }

        function blockCommit(){

            // 선택한 내용들 index를 담음
            // Set은 중복값을 제거한다.
            var arr = new Set();

            // 선택한 내용들 차단 승인 처리
            var rows = document.getElementById("searchData").getElementsByTagName("tr");

            for (var i = 0; i < rows.length; i++) {
                var cells = rows[i].getElementsByTagName("td")[0].getElementsByTagName("span")[0].
            							getElementsByTagName("input")[0];

                if(cells.checked == true){
                    // 체크된 내용의 순번들을 Array에 집어넣는다.
                    // 6번째 고객 ID를 넣어준다.
                    arr.add(rows[i].getElementsByTagName("td")[6].getElementsByTagName("span")[0].innerHTML);
                }
                else{
                    continue;
                }
            }
            
            // DB에서 차단 승인 처리
            // 중복값 제거 후 Set을 Array로 변환
            
            const uniqueArr = [...arr];

			if(uniqueArr.length< 1){
            	
            	alert('차단할 내용을 체크해주세요');
            	return false;
            }
            
      		location.replace("report/blockall?m_email=" + uniqueArr + "&is_block=Y");

        }

        function blockRollback(){
            
        	// 선택한 내용들 index를 담음
            // Set은 중복값을 제거한다.
            var arr = new Set();

            // 선택한 내용들 차단 해제 처리
            var rows = document.getElementById("searchData").getElementsByTagName("tr");

            for (var i = 0; i < rows.length; i++) {
                var cells = rows[i].getElementsByTagName("td")[0].getElementsByTagName("span")[0].
            							getElementsByTagName("input")[0];

                if(cells.checked == true){
                    // 체크된 내용의 순번들을 Array에 집어넣는다.
                    // 6번째 고객 ID를 넣어준다.
                    arr.add(rows[i].getElementsByTagName("td")[6].getElementsByTagName("span")[0].innerHTML);
                }
                else{
                    continue;
                }
            }

			// DB에서 차단 승인 처리
            // 중복값 제거 후 Set을 Array로 변환
            
            const uniqueArr = [...arr];
			
			if(uniqueArr.length< 1){
            	
            	alert('차단할 내용을 체크해주세요');
            	return false;
            }
      		location.replace("report/blockall?m_email=" + uniqueArr + "&is_block=N");
        }

        /* 스위치 토글 */
        function switch_toggle(m_no)
        {
            var s = document.getElementById('switch').checked;
			
            var toggle = "";
            if(s == true){
                // 체크를 한 경우 차단리스트 등록
                
                toggle = "Y";
            }
            else{
                // 체크를 하지 않은 경우 차단리스트 해제
            	toggle = "N";
            }

            location.replace("report/blockone?is_block=" + toggle + "&m_no=" + m_no);
        }

        
    </script>


	<!-- 메세지 -->
	<c:if test="${msg != ''}">
			
		<script>
			alert("${msg}");
			location.replace("report?page=1");
		</script>
		
	</c:if>

    <form action="">
        
        <input type="hidden" name="page" value="1" />
        
        <div>
        	<br />
            <span>
                <!-- 여기 value, id, name 수정할 것!! -->
                <select class="searchbox" id ="param1" name="param1" >
                	<c:if test="${empty param1 || param1 eq 1}">
	                    <option value="1" selected>전체 조회</option>
	                    <option value="2">차단된 내용만 조회</option>
	                    <option value="3">차단되지 않은 내용만 조회</option>
                    </c:if>
                    <c:if test="${param1 eq 2}">
	                    <option value="1">전체 조회</option>
	                    <option value="2" selected>차단된 내용만 조회</option>
	                    <option value="3">차단되지 않은 내용만 조회</option>
                    </c:if>
                    <c:if test="${param1 eq 3}">
	                    <option value="1">전체 조회</option>
	                    <option value="2">차단된 내용만 조회</option>
	                    <option value="3" selected>차단되지 않은 내용만 조회</option>
                    </c:if>
                </select>
            </span>
            <span>
            	<c:if test="${empty keyword || keyword eq ''}">
            		<input type="text" id="keyword" name="keyword" placeholder="검색할 ID를 입력해주세요" autocomplete="off">
            	</c:if>
                <c:if test="${keyword != ''}">
            		<input type="text" id="keyword" name="keyword" value="${keyword}" autocomplete="off">
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
                        <td width="2%"><input type="checkbox" id="header_checkbox"></td>
	                    <td width="5%">순번</td>
	                    <td width="20%">신고 일자</td>
	                    <td width="65%">댓글 내용</td>
	                    <td width="23%">블랙리스트 차단 여부</td>
                    </tr>
                </thead>
                <tbody id="searchData">
                
                 	<c:forEach items="${list}"  var="li"> 
                	
                		<tr>
	                        <td><span><input type="checkbox" name="chk"/></span></td>
	                        <td><span>${li.review_no }</span></td>
	                        <td><span>${li.report_date }</span></td>
	                        <td><span><a href="reportdetail?report_no=${li.review_no}">${li.review_content }</a></span></td>
	                        <td> <!--스위치-->
	                        
	                        	<c:if test="${li.restrict_flag == 'Y'}">
	                        	
	                        		<input type="checkbox" id="switch" onclick="switch_toggle(${li.m_no})" checked>
		                            <label for="switch" class="switch_label">
		                            <span class="onf_btn"></span>
	                        	
	                        	</c:if>
	                        	<c:if test="${li.restrict_flag == 'N'}">
	                        	
	                        		<input type="checkbox" id="switch" onclick="switch_toggle(${li.m_no})">
		                            <label for="switch" class="switch_label">
		                            <span class="onf_btn"></span>
	                        	
	                        	</c:if>
	                        </td>
                    	</tr>
                    	
                	</c:forEach>
                	
                </tbody>
            </table>
            
            <br /><br />
        </div>
        <div>
        	<br />
        	<c:if test="${empty param.param1 && empty param.keyword && empty list}">
		    	 <div id="warning_content" >
		    	 		<img id="warning_img" src="resources/img/No_Search.jpeg" alt="이미지 없음"/>
		    	 		<br />
			    	 	<span id="warning_text">신고된 내역이 없습니다.</span>
			    	 	<br /><br /><br />
		    	 </div>
		    </c:if>
		    <c:if test="${(not empty param.param1 || not empty param.keyword) && empty list}">
		    	 <div id="warning_content" >
		    	 		<img id="warning_img" src="resources/img/No_Search.jpeg" alt="이미지 없음"/>
		    	 		<br />
			    	 	<span id="warning_text">검색된 신고 내역이 없습니다.</span>
			    	 	<br /><br /><br />
		    	 </div>
		    </c:if>
		    <c:if test="${not empty list}">
		    		<div id="paging">
		        		<c:if test="${vo.page>1}">
							<a href="report?page=1&param1=${param.param1}&keyword=${param.keyword}"><i class="fa-solid fa-angles-left"></i></a>
							<a href="report?page=${vo.page-1 }&param1=${param.param1}&keyword=${param.keyword}"><i class="fa-solid fa-circle-chevron-left"></i></a>
						</c:if>
			        	<c:forEach begin="${vo.pageStart}" end="${vo.pageEnd }" var="i">
			        		
			        		<c:choose>
			        			<c:when test="${ i ne param.page }">
			        				<a href="report?page=${i}&param1=${param1}&keyword=${keyword}">${i}</a>
			        			</c:when>
			        			<c:otherwise>
			        				<span>${i}</span>
			        			</c:otherwise>
			        		</c:choose>
			        		
			        	</c:forEach>
			        	<c:if test="${vo.page < vo.totPage}">
							<a href="report?page=${vo.page+1 }&param1=${param.param1}&keyword=${param.keyword}"><i class="fa-solid fa-circle-chevron-right"></i></a>
							<a href="report?page=${vo.totPage }&param1=${param.param1}&keyword=${param.keyword}"><i class="fa-solid fa-angles-right"></i></a>
						</c:if>
		        	</div>
		    </c:if>
        </div>
        <div>
        	<br />
            <span><input type="button" class="button" value="차단 승인" onclick="return blockCommit()"></span>
            <span><input type="button" class="button" value="차단 해제" onclick="return blockRollback()"></span>
        </div>
        
    </form>

</body>
</html>
