<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        #form{
            width: 1200px;
        }
        .eventlist{
            padding-left: 0;
            padding-top: 5px;
        }
        .eventlist li{
            list-style: none;
            float: left;
            padding: 0 100px 0 0;
        }
        .key{
            width: 100px;
            font-size: 20px;
        }
        .event_info{
            height: 30px;
            width: 800px;
        }
        .event_winner{
            height: 30px;
            width: 400px;
        }
        .item_delivery_no{
        	height: 30px;
        	width: 100px;
        }

        button, #submit{
            background-color: #011343;
            color: #EBD01C;
            border-radius: 3px;
            width: 100px;
            height: 32px;
            cursor: pointer;
        }
    </style>


	<%-- <c:if test="${empty list.event_member_flag}">
		
		<script>
			alert('해당 이벤트 정보가 없습니다.');
			location.replace("event?page=1");
		</script>
	
	</c:if> --%>

    <script>
        function selectIdButton(event_no, m_no_gubun, m_email_gubun, isInserted){

            if(isInserted == 'Y'){
                alert("당첨자를 이미 등록하였습니다.")
                return false;
            }
            else{
            	
            	var opensite = "memberpopup?event_no=" + event_no + "&m_no_gubun=" + m_no_gubun + "&m_email_gubun=" + m_email_gubun;
            	
                window.open(opensite, 'window', 'width=700px, height=830px');
            }
        }

        function direct_to_item(event_no, event_name)
        {
        	location.replace("item?event_no=" + event_no + "&event_name=" + event_name);
        }
        
        function insertEventWinner(event_no){
        	
        	var first_item = document.getElementById("first_item").value;
        	var second_item = document.getElementById("second_item").value;
        	var third_item = document.getElementById("third_item").value;
        	
            var first_mno = document.getElementById("first_mno").value;
            var second_mno = document.getElementById("second_mno").value;
            var third_mno = document.getElementById("third_mno").value;
			
            if(first_item.length < 1 && second_item.length < 1 && third_item.length < 1){

                alert("해당 이벤트 경품이 없으므로, 당첨자를 저장할 수 없습니다.");
                return false;

            }

            if(first_mno.length < 1){

                alert("1등 당첨자를 등록해주세요")
                return false;

            }
            if(second_mno.length < 1){

                alert("2등 당첨자를 등록해주세요")
                return false;

            }
            if(third_mno.length < 1){
                
                alert("3등 당첨자를 등록해주세요")
                return false;

            }
            
            if(first_mno == second_mno || second_mno == third_mno || first_mno == third_mno){
            	alert("같은 사람이 중복으로 당첨될 수 없습니다.")
            	return false;
            }
            
            var check = confirm("당첨자를 등록하면 수정할 수 없으며, 배송정보도 같이 등록됩니다. 등록하시겠습니까?");
            
            if(check == false){
            	return false;
            }
            
        }

    </script>

    <h1>이벤트 당첨자 지정</h1>
	
    <div id="form">
        <form action="event_winner/insert" onsubmit="return insertEventWinner('${param.event_no}')">

            <input type="hidden" class="event_info" name="event_no" value="${param.event_no}">

            <div>
                <ul class="eventlist">
                    <li class="key">이벤트 명</li>
                    <li>
                        <input type="text" class="event_info"  id="event_name" value="${list.event_name}" readonly>
                    </li>
                </ul>
            </div>
            <br><br><br><br>
            <div>
                <ul class="eventlist">
                    <li class="key">1등 경품</li>
                    <li>
                        <!-- name="first_item" -->
                        <input type="text" class="event_info"  id="first_item" value="${list.first_item}" placeholder="1등 경품을 등록해주세요" readonly>  
                    </li>
                </ul>
                <br>
                <ul class="eventlist">
                    <li class="key">2등 경품</li>
                    <li>
                        <!-- name="second_item" -->
                        <input type="text" class="event_info"  id="second_item"  value="${list.second_item}" placeholder="2등 경품을 등록해주세요"  readonly>
                    </li>
                </ul>
                <br>
                <ul class="eventlist">
                    <li class="key">3등 경품</li>
                    <li>
                        <!-- name="third_item" -->
                        <input type="text" class="event_info"  id="third_item"  value="${list.third_item}"  placeholder="3등 경품을 등록해주세요" readonly>
                    </li>
                </ul>
                <br /><br />
                <c:if test="${empty list.first_item && empty list.second_item && empty list.third_item}">
                	<button type="button" class="button" onclick="direct_to_item('${param.event_no}', '${param.event_name }')">경품정보 등록</button>
                </c:if>
                 <c:if test="${not empty list.first_item && not empty list.second_item && not empty list.third_item}">
                	<button type="button" class="button" onclick="direct_to_item('${param.event_no}','${param.event_name }')">경품정보 확인</button>
                </c:if>
            </div>
            <br><br><br><br>
            <div>
                <ul class="eventlist">
                    <li class="key">1등 당첨자</li>
                    <li>
                        <input type="text" class="event_winner" id="first_mid" value="${list.first_member}" placeholder="1등 당첨자를 등록해주세요" readonly>
                        <input type="hidden" id="first_mno" name="first_mno" value="" />
                    </li>
                    <c:if test="${list.event_member_flag == 'N'}">
	                    <li>
	                            <button type="button" class="button" onclick="return selectIdButton('${param.event_no}', 'first_mno', 'first_mid', 'N')">아이디 선택</button>
	                    </li>
                    </c:if>
                    <c:if test="${list.event_member_flag == 'Y'}">
	                    <li class="key">배송번호</li>
	                    <li>
	                    	<input type="text" class="item_delivery_no"value="${list.first_delivery_no}" readonly/>
	                    </li>
                    </c:if>
                </ul>
                <br>
                <ul class="eventlist">
                    <li class="key">2등 당첨자</li>
                    <li>
                        <input type="text" class="event_winner" id="second_mid" value="${list.second_member}" placeholder="2등 당첨자를 등록해주세요" readonly>
                        <input type="hidden" id="second_mno" name="second_mno" value="" />
                    </li>
                    <c:if test="${list.event_member_flag == 'N'}">
	                    <li>
	                        <button type="button" class="button" onclick="return selectIdButton('${param.event_no}','second_mno','second_mid', 'N')">아이디 선택</button>
	                    </li>
                    </c:if>
                    <c:if test="${list.event_member_flag == 'Y'}">
	                    <li class="key">배송번호</li>
	                    <li>
	                    	<input type="text" class="item_delivery_no"value="${list.second_delivery_no}" readonly/>
	                    </li>
                    </c:if>
                </ul>
                <br>
                <ul class="eventlist">
                    <li class="key">3등 당첨자</li>
                    <li>
                        <input type="text" class="event_winner" id="third_mid"  value="${list.third_member}" placeholder="3등 당첨자를 등록해주세요" readonly>
                        <input type="hidden" id="third_mno" name="third_mno" value="" />
                    </li>
                    <c:if test="${list.event_member_flag == 'N'}">
	                    <li>
	                            <button type="button" class="button" onclick="return selectIdButton('${param.event_no}','third_mno','third_mid', 'N')">아이디 선택</button>
	                    </li>
                    </c:if>
                    <c:if test="${list.event_member_flag == 'Y'}">
	                    <li class="key">배송번호</li>
	                    <li>
	                    	<input type="text" class="item_delivery_no"value="${list.third_delivery_no}" readonly/>
	                    </li>
                    </c:if>
                </ul>
            </div>
            <br><br>
            <div>
           		<c:if test="${list.event_member_flag == 'N' }">
           				<input type="submit" id="submit" value="당첨자 저장">
           		</c:if>
                <button type="button" onclick="location.replace('event')">뒤로 가기</button>
            </div>
        </form>
    </div>
	
</body>
</html>