<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body>

	<style>

        #insertform{
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
            width: 170px;
            font-size: 20px;
        }

        #event_name, #datepicker_startdate, #datepicker_enddate{
            height: 30px;
        }

        #event_name{
            width:800px;
        }
        
        #datepicker_startdate, #datepicker_enddate{
        	text-align: center;
        }

        .item_name{
            width: 500px;
            height: 30px;
        }

        #submit, #backbutton{
            background-color: blue;
            color: white;
            font-weight: bold;
            border-radius: 3px;
            width: 100px;
            height: 32px;
            cursor: pointer;
        }

        /***************** 첨부파일 컨트롤 ********************/

        #filebox #upload-name {
            display: inline-block;
            height: 40px;
            padding: 0 10px;
            vertical-align: middle;
            border: 1px solid #dddddd;
            width: 78%;
            color: #999999;
        }
        #filebox label {
            margin: 5px 0;
            display: inline-block;
            padding: 10px 20px;
            color: #fff;
            vertical-align: middle;
            background-color: #999999;
            cursor: pointer;
            height: 20px;
        }
        #filebox input[type="file"] {
            position: absolute;
            width: 0;
            height: 0;
            padding: 0;
            overflow: hidden;
            border: 0;
        }
        /* 첨부파일 컨트롤 끝 */

        
        
    </style>

    <script>

	    $(function(){
	
	        var selected_StartDate = null;
	        var selected_EndDate = null;
	
	     	// datePicker 이벤트 시작일
	
	        $('#datepicker_startdate').datepicker({
	            showOn: "both",                             						// 달력을 표시할 타이밍 (both: focus or button)
	            buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",     	// 버튼 이미지
	            buttonImageOnly : true,                     					// 버튼 이미지만 표시할지 여부
	            buttonText: "날짜선택",                     					// 버튼의 대체 텍스트
	            dateFormat: "yy-mm-dd",                     					// 날짜의 형식
	            changeMonth: true,                          					// 월을 이동하기 위한 선택상자 표시여부
	            minDate: 0,                                 						// 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
	            onClose: function( selectedDate ) {    
                // 시작일(fromDate) datepicker가 닫힐때
                // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
	                $("#datepicker_enddate").datepicker( "option", "minDate", selectedDate );
	
	                selected_StartDate = selectedDate;
	                
	                eventStatus_Check(selected_StartDate, selected_EndDate);
	
	            }                
	        });
	
	     	// datePicker 이벤트 종료일
	        $('#datepicker_enddate').datepicker({
	            showOn: "both", 
	            buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif", 
	            buttonImageOnly : true,
	            buttonText: "날짜선택",
	            dateFormat: "yy-mm-dd",
	            changeMonth: true,
	            minDate: 0, 
	            onClose: function( selectedDate ) {
	                // 종료일(toDate) datepicker가 닫힐때
	                // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
	                $("#datepicker_startdate").datepicker( "option", "maxDate", selectedDate );
	
	                selected_EndDate = selectedDate;
	
	                eventStatus_Check(selected_StartDate, selected_EndDate);
	            }                
	        });
	    })
	         
	    // datePicker 한글적용을 위해 추가
	    $.datepicker.setDefaults({
	        dateFormat: 'yy.mm.dd',
	        prevText: '이전 달',
	        nextText: '다음 달',
	        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	        showMonthAfterYear: true,
	        yearSuffix: '년'
	    });
	    
	    function eventStatus_Check(selected_StartDate, selected_EndDate){
	
	    	// 이벤트 상태 체크
	    	// 시작날짜, 종료날짜 두개 모두 입력하면 이벤트 상태가 바뀐다.
	    	
	        if(selected_StartDate != null && selected_EndDate != null){
	                    
	            var today = new Date();
	
	            var year = today.getFullYear();
	            var month = ('0' + (today.getMonth() + 1)).slice(-2);
	            var day = ('0' + today.getDate()).slice(-2);
	
	            var dateString = year + '-' + month  + '-' + day;
	            
	            if(dateString < selected_StartDate){
	                document.getElementById("event_status").innerHTML = "이벤트 시작 전";
	                document.getElementById("event_status").style.color = "red";
	                document.getElementById("event_flag").value = "1";
	                
	            }
	            else if(dateString > selected_EndDate){
	                document.getElementById("event_status").innerHTML = "이벤트 종료";
	                document.getElementById("event_status").style.color = "blue";
	                document.getElementById("event_flag").value = "3";
	            }
	            else{
	                // 이벤트 기간 사이
	                document.getElementById("event_status").innerHTML = "이벤트 진행중";
	                document.getElementById("event_status").style.color = "green";
	                document.getElementById("event_flag").value = "2";
	            }
	        }
	        else{
	            document.getElementById("event_status").innerHTML = "이벤트 기간을 설정해주세요";
	        }
	    }
	
	    function eventInsert(){
	
	    	// 이벤트 등록 전에 내용 다 입력했는지 확인
	        var event_name = document.getElementById("event_name").value;
	        var event_startdate = document.getElementById("datepicker_startdate").value;
	        var event_enddate = document.getElementById("datepicker_enddate").value;
	        var event_file = document.getElementById("upload-name").value;
	
	        if(event_name.length < 1){
	            alert("이벤트 명을 입력해주세요");
	            return false;
	        }
	
	        if(event_startdate.length < 1 || event_enddate.length < 1)
	        {
	            alert("이벤트 시작 / 종료 날짜를 입력해주세요");
	            return false;
	        }
	
	        if(event_file.length < 1)
	        {
	            alert("사진을 등록해주세요");
	            return false;
	        }
	    }    
        
	 	// 첨부파일 관련(업로드 파일 경로를 올바르게 보여줌...)
		
        $("#file").on('change',function(){
            var fileName = $("#file").val().split('/').pop().split('\\').pop();
            $("#upload-name").val(fileName);
        });
	    
        $(document).ready(function() {
            $("#file").on("change", check_Upload_image_file);
        });
     
        function check_Upload_image_file(e) {
        	
        	// 파일 첨부시 이미지 파일인지 체크
        	
            var files = e.target.files;
            var filesArr = Array.prototype.slice.call(files);
     
            var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
     
            filesArr.forEach(function(f) {
                if (!f.type.match(reg)) {
                    alert("확장자는 이미지 확장자만 가능합니다.");
                    
                    document.getElementById("upload-name").value = "";
                    return;
                }
                else{
                	
                	var uploadFileName = document.getElementById("file").files[0].name;
                	document.getElementById("upload-name").value = uploadFileName;
                	
                }
            });
        }

    </script>

    <h1>이벤트 등록</h1>

    <div id="insertform">

        <form action="event/insert" onsubmit="return eventInsert()" method="post" enctype="multipart/form-data">
			
			<input type="hidden" id="event_flag" name="event_flag" value="" />
			
            <ul class="eventlist">
                <li class="key">이벤트 명</li>
                <li><input type="text" id="event_name" name="event_name" autocomplete="off"></li>
            </ul>
            <br>
            <ul class="eventlist">
                <li class="key">이벤트 진행여부</li>
                <li><span id="event_status">이벤트 기간을 설정해주세요</span></li>
            </ul>
            <br>
            <ul class="eventlist">
                <li class="key">이벤트 기간</li>
                <li class="value">
                   
                        <input type="text" id="datepicker_startdate" name="event_startdate" autocomplete="off" readonly>
                      	<span> ~ </span>
                        <input type="text" id="datepicker_enddate" name="event_enddate" autocomplete="off" readonly>
                    
                </li>
            </ul>
            <br>
            <ul class="eventlist">
                <li class="key">이벤트 사진 첨부</li>
                <li class="value" id="filebox">
                        <input id="upload-name" value="" placeholder="첨부파일" readonly autocomplete="off">
                        <label for="file" >파일찾기</label> 
                        <input type="file" id="file" name="file" accept="image/*" >
                </li>
            </ul>
            <br><br><br><br>
            <ul class="eventlist">
                <li class="key">경품</li>
            </ul>
            <br>
            <ul class="eventlist">
                <li class="key">1등 당첨 경품</li>
                <li>
                    <span>
                        <input type="text" class="item_name" value="미등록" readonly >
                    </span>
                </li>
            </ul>
            <br>
            <ul class="eventlist">
                <li class="key">2등 당첨 경품</li>
                <li>
                    <span>
                        <input type="text" class="item_name" value="미등록" readonly>
                    </span>
                </li>
            </ul>
            <br>
            <ul class="eventlist">
                <li class="key">3등 당첨 경품</li>
                <li>
                    <span>
                        <input type="text" class="item_name" value="미등록" readonly>
                    </span>
                </li>
            </ul>
            <br><br>
            <input type="submit" id="submit" value="이벤트 등록">
            <button type="button" id="backbutton" onclick="location.replace('event')">뒤로가기</button>
        </form>
    </div>
	
</body>
</html>