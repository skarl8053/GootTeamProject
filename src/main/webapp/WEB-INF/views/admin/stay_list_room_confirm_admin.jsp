<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/stay_list_confirm_admin.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
	<script>
	
		function stayDelete(s_no) {
	        if (confirm("이 객실을 삭제하시겠습니까?")) {
	            var form = document.getElementById("stayDeleteForm");
	            var input = document.createElement("input");
	            input.type = "hidden";
	            input.name = "s_no_stay";
	            input.value = s_no;
	            form.appendChild(input);
	            form.submit();
	            
	            alert("숙소가 삭제되었습니다.")
	            window.close();
	        }
	    }
			
		function deleteRoom(r_no) {
	        if (confirm("이 객실을 삭제하시겠습니까?")) {
	            var form = document.getElementById("roomDeleteForm");
	            var input = document.createElement("input");
	            input.type = "hidden";
	            input.name = "r_no_room";
	            input.value = r_no;
	            form.appendChild(input);
	            form.submit();
	            
	            alert("객실이 삭제되었습니다.")
	        }
	    }
	</script>
	<style>
		body {
			height : auto;
		}
		table {
			width: 700px;
			border : 1px solid black;
		}
		.btn {
			height : 30px;
			width: 100px;  
		    font-size: 16px; 
		    padding: 10px 20px; 
		    background-color: rgb(1, 19, 67); 
		    color: rgb(235, 208, 28); 
		    border: none; 
		    border-radius: 8px;
		    cursor: pointer;
		    vertical-align: top;
		    text-align: center;
		    line-height: 15px;
			box-sizing: border-box;
		}
	</style>
</head>
<body>
<h2>숙소 / 객실 리스트</h2>
	<form action="stay_delete" method="post" id="stayDeleteForm">
		<table>
		<tr>
			<td width="15%">숙소번호</td>
			<td width="25%">숙소명</td>
			<td width="45%">숙소이미지</td>
			<td>삭제하기</td>
		</tr>
			<c:forEach items="${stay_list }" var="stay_list">
				<input type="hidden" name="s_no_stay" id="sNoStay" value="${stay_list.s_no }" />
				<tr>
					<td>${stay_list.s_no }</td>
					<td>${stay_list.s_name }</td>
					<td><img src="resources/upload_img/admin/stay/${stay_list.s_img1 }" alt="이미지 없음" width="250px;" height="250px;"/></td>
					<td><input type="button" value="삭제" class="btn" onclick="stayDelete(${stay_list.r_no})" /></td>
				</tr>
			</c:forEach>
		</table><br />
	</form>
	
	<form action="stay_room_delete" method="post" id="roomDeleteForm">
		<table>
		<tr>
			<td width="15%">숙소번호</td>
			<td width="25%">객실명</td>
			<td width="45%">객실이미지</td>
			<td>삭제하기</td>
		</tr>
		<c:forEach items="${room_list }" var="room_list">
			<input type="hidden" name="r_no_room" id="rNoRoom" value="${room_list.r_no }" />
			<input type="hidden" name="s_no" value="${room_list.s_no }" />
			<tr>
				<td>${room_list.s_no }</td>
				<td>${room_list.r_name }</td>
				<td><img src="resources/upload_img/admin/stay/${room_list.r_img1 }" alt="이미지 없음" width="250px;" height="250px;"/></td>
				<td><input type="button" value="삭제" class="btn" onclick="deleteRoom(${room_list.r_no})"/></td>
			</tr>
		</c:forEach>
	</table>
	</form>

</body>
</html>