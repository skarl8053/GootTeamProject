<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script>var eventNo = ${event_page.event_no};</script>
	<script src="${pageContext.request.contextPath}/resources/layout/main_js/slide-js/slick-main.js"></script>
	<style>
		#content{
			height: auto;
		}
		@font-face {
			font-family: 'GmarketSansMedium';
			src:
				url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
				format('woff');
			font-weight: normal;
			font-style: normal;
		}
		* {
			font-family: 'GmarketSansMedium';
			text-align: center;
			align-items: center;
			font-size : 20px;
		}
		#content{
			height: auto;
		    margin: auto;
		    display: flex; 
		    flex-direction: column; 
		    justify-content: center;
		    align-items: center; 
		}
		* {
			text-align: center;
		}
		hr {
			width: 1200px;
		}
		.btn {
			margin : auto;
			background-color: rgb(1, 19, 67);
			color: rgb(235, 208, 28);
			font-size: 16px;
			cursor: pointer;
			padding: 10px 15px;
			border: none;
			border-radius: 5px;
			margin-bottom: 30px;
		}
		.event_title {
			text-align: left;
			margin-left: 30px;
		}
		.event_img {
			margin-top: 30px;
			margin-bottom: 30px;
			width :600px;
			height: 800px;
		}
		.event_main {
			font-size: 22px;
		}
		.event_content {
			text-align: center;
		}
		.event_benefits {
		  text-align: left; 
		  display: flex; 
		  flex-direction: column; 
		  justify-content: center; 
		  align-items: center;
		}
		.event_gift {
			text-align: center;
			margin-left: auto;
			font-size: 20px;
			font-weight: bold;
		}
		.event_notice {
		  display: flex; 
		  flex-direction: column; 
		  justify-content: center; 
		  align-items: center; 
		}
		.event_caution {
			font-size: 20px;
			font-weight: bold;
			color: red;
		}
		.list_btn, .moveTopBtn {
			background-color: rgb(1, 19, 67);
			color: rgb(235, 208, 28);
			font-size: 16px;
			cursor: pointer;
			padding: 10px 15px;
			border: none;
			border-radius: 5px;
			float: right;
			margin-left: 5px;
			margin-bottom : 10px;
		}
		.blue_text {
			color: blue;
			text-align : left;
		}
		textarea {
			border: none;
			font-size : 20px;
			resize: none;
		}
	</style>
	
	<script>	
		/* window.onload = function () {
			const eventNo = ${event_page.event_no};
			window.eventNo = eventNo;
		} */
	
	    // 폼 제출
	    function submitForm() {
	        document.getElementById("eventForm").submit();
	    }
	    
	    // 중복 참여 체크 후 메시지
	    function event_attend_confirm(check_event, msg) {
        if (check_event < 0) {
            alert(msg);
        } else {
            alert("이벤트 참여가 완료되었습니다.");
        }
    }
</script>
	
</head>
<body>
<h2 class="event_title">EVENT 게시판</h2>
<hr />
<form action="event_attend" method="POST" onsubmit="event_attend_confirm(${check_event}, '${msg}');">
<input type="hidden" name="event_no" id="event_no" value="${event_page.event_no }" />
	<p class="event_title">${event_page.event_name }</p>
	<p class="event_title">관리자 | ${event_page.event_startdate }</p>
	<hr>
	
	<img src="../admin/resources/upload_img/admin/event/${event_page.filename2 }" alt="이미지 없음" class="event_img"  /><br />
	
	<div class="event_content">
		<div class="event_main">가족사랑) 가족사진 무료촬영 + 제주도 여행권 이벤트(서울지역)</div><br>

		가족사랑 이용고객 30만 명 돌파 기념 감사 이벤트! <br>

		가족사진도 찍고 제주도 여행도 가자! <br><br>

		<div class="event_notice">
			<p><span class="blue_text">이벤트 내용 : </span>가족사진 무료촬영 + 제주도 무료 여행 티켓 제공 </p>
			
			<p><span class="blue_text">이벤트 기간 : </span>${event_page.event_startdate } ~ ${event_page.event_enddate }  </p>
			
			<p><span class="blue_text">참 여 대 상 : </span>${event_page.event_target } </p><br />
		</div>

		<div class="event_caution">주의사항</div><br>

		<textarea id="textarea" cols="50" rows="13" readonly>${event_page.event_caution }</textarea> <br />

		<div class="event_gift">
			1등 경품 : ${event_page.item_name } <br />
			2등 경품 : ${event_page.item_name_1 }<br />
			3등 경품 : ${event_page.item_name_2 }<br /><br>
		</div>

	</div>

	<input type="submit" class="btn" value="이벤트 참가하기" />
    <hr />
    <div class="moveTopBtn">맨 위로</div>
    <button type="button" class="list_btn" onclick="goToListPage()">목록</button>
</form>

<script>
	// 목록으로 이동
	function goToListPage() {
	    window.location.href = "http://localhost:8090/travel/user/event_notice";
	}
	
	const $topBtn = document.querySelector(".moveTopBtn");
	
    // 페이지 상단 이동
    $topBtn.onclick = () => {
    	event.preventDefault();
        window.scrollTo({ top: 0, behavior: "smooth" });
    }
    
	 // 내용이 변경될 때마다 높이를 조절합니다.
		textarea.addEventListener("input", function() {
		  if (this.scrollHeight > this.clientHeight) {
		    this.style.height = "auto"; // 스크롤 높이에 따라 높이를 설정합니다.
		  } else {
		    this.style.height = (this.scrollHeight) + "px"; // 축소할 때 높이를 조절합니다.
		  }
		});
</script>

</body>
</html>