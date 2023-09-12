<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

	<!-- 개별 화면 content 크기를 조절하는 방법 -->
	<style>
		#content{
			height: 100%;
		}
	</style>

</head>
<body>

	<style>
		
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

        #event_name, #datepicker_startdate, #datepicker_enddate{
            height: 30px;
        }

        #event_name{
            width:800px;
        }
        
        #datepicker_startdate, #datepicker_enddate{
        	text-align: center;
        }

		 .event_textarea{
            resize: none;
        }
        
        .item_name{
            width: 500px;
            height: 30px;
        }

        #updatebutton, #deletebutton, #backbutton{
            background-color: #011343;
            color: #EBD01C;
            font-weight: bold;
            border-radius: 3px;
            width: 100px;
            height: 32px;
            cursor: pointer;
        }

        /***************** 첨부파일 컨트롤 ********************/

        #filebox #upload-name, #filebox #upload-name2 {
            display: inline-block;
            height: 40px;
            padding: 0 10px;
            vertical-align: middle;
            border: 1px solid #dddddd;
            width: 300px;
            color: #999999;
        }
        #filebox label {
            margin: 5px 0;
            display: inline-block;
            padding: 10px 20px;
            background-color: #011343;
            color: #EBD01C;
            vertical-align: middle;
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
        .img_standard{
            color: lightblue;
        }
        #event_banner_img{
            width: 600px;
            height: 300px;
        }
        #event_banner_img2{
            width: 600px;
            height: 800px;
        }
    </style>

    <script>

		var valuechanged = false;
    	
		function valueChanged(){
			
			// 처음 가져온 내용에서 변경된 것이 있는지 검색
			
			if( ! valuechanged )
			{
				valuechanged = true;
			}
		}
		
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
	            /* minDate: 0,     */                             						// 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
	            onClose: function( selectedDate ) {    
                // 시작일(fromDate) datepicker가 닫힐때
                // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
	                $("#datepicker_enddate").datepicker( "option", "minDate", selectedDate );
	
                	// 맨 처음 조회할 때는 selectedDate가 없는 상태임..
                
                	if(selected_StartDate == null){
                		selected_StartDate = document.getElementById("datepicker_startdate").value;
                	}
                	else{
                		selected_StartDate = selectedDate;
                	}
                	
                	if(selected_EndDate == null){
                		selected_EndDate = document.getElementById("datepicker_enddate").value;
                	}
                	
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
	 
	                if(selected_StartDate == null){
                		selected_StartDate = document.getElementById("datepicker_startdate").value;
                	}
	                
	                if(selected_EndDate == null){
                		selected_EndDate = document.getElementById("datepicker_enddate").value;
                	}
	                else{
	                	selected_EndDate = selectedDate;
	                }
	                
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
	
	    function event_check(){
	
	    	// 이벤트 등록 전에 내용 다 입력했는지 확인
	        var updated_event_name = document.getElementById("event_name").value;
	        var updated_event_startdate = document.getElementById("datepicker_startdate").value;
	        var updated_event_enddate = document.getElementById("datepicker_enddate").value;
	        var updated_event_file = document.getElementById("upload-name").value;
	        var updated_event_file2 = document.getElementById("upload-name2").value;
            var event_intro = document.getElementById("event_intro").value;
            var event_content = document.getElementById("event_content").value;
	        var event_target = document.getElementById("event_target").value;
			var event_caution = document.getElementById("event_caution").value;
	        
			if( ! valuechanged ){
	    		alert("변경된 내용이 없습니다.");
	    		return false;
	    	}
			
	        if(updated_event_name.length < 1){
	            alert("이벤트 명을 입력해주세요");
	            return false;
	        }
	
	        if(updated_event_startdate.length < 1 || updated_event_enddate.length < 1)
	        {
	            alert("이벤트 시작 / 종료 날짜를 입력해주세요");
	            return false;
	        }
        
            if(event_intro.length < 1)
			{
				alert("이벤트 소개글을 입력해주세요");
				return false;
			}

            if(event_intro.length > 1000)
			{
				alert("이벤트 소개글은 1000자까지만 입력하실 수 있습니다.");
				return false;
			}

            if(event_content.length < 1)
			{
				alert("이벤트 내용을 입력해주세요");
				return false;
			}

            if(event_content.length > 1000)
			{
				alert("이벤트 내용은 1000자까지만 입력하실 수 있습니다.");
				return false;
			}

	        if(event_target.length < 1)
			{
				alert("이벤트 참여대상을 입력해주세요");
				return false;
			}

            if(event_target.length > 1000)
			{
				alert("이벤트 참여대상은 1000자까지만 입력하실 수 있습니다.");
				return false;
			}
            
            if(event_caution.length < 1){
            	alert("이벤트 주의사항을 입력해주세요");
				return false;
            }
			
            if(event_caution.length > 1000)
			{
				alert("이벤트 주의사항은 1000자까지만 입력하실 수 있습니다.");
				return false;
			}
            if(updated_event_file.length < 1)
			{
				alert("이벤트 배너 사진을 등록해주세요");
				return false;
			}

			if(updated_event_file2.length < 1)
			{
				alert("이벤트 상세 사진을 등록해주세요");
				return false;
			}
	        
	    	return true;
	    } 
	    
	    function eventdelete(event_no){
	    	
	    	
    		const truefalse = confirm("이벤트를 삭제하시면 복구 불가능합니다.");
    	    if (truefalse){
    	    	location.replace("event/delete?event_no=" + event_no);
    	    }
	    		
	    	
	    }
        
	 	// 첨부파일 관련(업로드 파일 경로를 올바르게 보여줌...)
		
        $("#file").on('change',function(){
            var fileName = $("#file").val().split('/').pop().split('\\').pop();
            $("#upload-name").val(fileName);
        });

        $("#file2").on('change',function(){
            var fileName = $("#file").val().split('/').pop().split('\\').pop();
            $("#upload-name2").val(fileName);
        });
	    
        $(document).ready(function() {
            $("#file").on("change", check_Upload_image_file);
            $("#file2").on("change", check_Upload_image_file2);
        });
     
        function check_Upload_image_file(e) {
        	
            // 이벤트 배너 사진 첨부
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
                    
                    var reader = new FileReader();
                    reader.onload = (e) => {
                        document.getElementById("event_banner_img").src = e.target.result;
                    }
                    reader.readAsDataURL(document.getElementById("file").files[0])
                }
            });
        }

        function check_Upload_image_file2(e) {
        	
            // 이벤트 상세 사진 첨부
        	// 파일 첨부시 이미지 파일인지 체크
        	
            var files = e.target.files;
            var filesArr = Array.prototype.slice.call(files);
     
            var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
     
            filesArr.forEach(function(f) {
                if (!f.type.match(reg)) {
                    alert("확장자는 이미지 확장자만 가능합니다.");
                    
                    document.getElementById("upload-name2").value = "";
                    return;
                }
                else{
                	
                	var uploadFileName = document.getElementById("file2").files[0].name;
                	document.getElementById("upload-name2").value = uploadFileName;
                    
                    var reader = new FileReader();
                    reader.onload = (e) => {
                        document.getElementById("event_banner_img2").src = e.target.result;
                    }
                    reader.readAsDataURL(document.getElementById("file2").files[0])

                }
            });
        }
    </script>

    <h1>이벤트 상세 조회 및 변경</h1>

    <div id="insertform">

        <form action="event/update" onsubmit="return event_check()" method="post" enctype="multipart/form-data">
			
			<input type="hidden" id="event_no" name="event_no" value="${param.event_no}" />
			
			<table>
				<tr>
					<td width="20%">이벤트명</td>
					<td>
						<input type="text" id="event_name" name="event_name" autocomplete="off" value="${ list.event_name}" onchange="valueChanged()">
					</td>
				</tr>
                <tr>
                    <td><br><br></td>
                    <td><br><br></td>
                </tr>
				<tr>
					<td>이벤트 진행 여부</td>
					<td>
						
							<c:choose>
								<c:when test="${list.event_flag eq 1}">
									
											<span id="event_status" style="color: red;">이벤트 시작 전</span>
											<input type="hidden" id="event_flag" name="event_flag" value="1" />
									
								</c:when>
								<c:when test="${list.event_flag eq 2 }">
									
											<span id="event_status" style="color: green;">이벤트 진행중</span>
											<input type="hidden" id="event_flag" name="event_flag" value="2" />
									
								</c:when>
								<c:when test="${list.event_flag eq 3 }">
									
										<span id="event_status" style="color: blue;">이벤트 종료</span>
										<input type="hidden" id="event_flag" name="event_flag" value="3" />
									
								</c:when>
							</c:choose>
						
					</td>
				</tr>
                <tr>
                    <td><br><br></td>
                    <td><br><br></td>
                </tr>
				<tr>
					<td>이벤트 기간</td>
					<td>
						<ul class="eventlist">
							<li class="value">
							   
									<input type="text" id="datepicker_startdate" name="event_startdate" value="${list.event_startdate }" onchange="valueChanged()" autocomplete="off" readonly >
									  <span> ~ </span>
									<input type="text" id="datepicker_enddate" name="event_enddate" value="${list.event_enddate }" onchange="valueChanged()" autocomplete="off" readonly>
								
							</li>
						</ul>
					</td>
				</tr>
                <tr>
                    <td><br><br></td>
                    <td><br><br></td>
                </tr>
                <tr>
					<td>이벤트 소개</td>
					<td>
						<ul class="eventlist">
							<li>
                                <textarea name="event_intro" id="event_intro" class="event_textarea" cols="92" rows="5" onchange="valueChanged()">${list.event_intro}</textarea>
                            </li>
						</ul>
					</td>
				</tr>
                <tr>
                    <td><br><br></td>
                    <td><br><br></td>
                </tr>
                <tr>
					<td>이벤트 내용</td>
					<td>
						<ul class="eventlist">
							<li>
                                <textarea name="event_content" id="event_content" class="event_textarea" cols="92" rows="5" onchange="valueChanged()">${list.event_content}</textarea>
                            </li>
						</ul>
					</td>
				</tr>
                <tr>
                    <td><br><br></td>
                    <td><br><br></td>
                </tr>
                <tr>
					<td>이벤트 참여 대상</td>
					<td>
						<ul class="eventlist">
							<li>
                                <textarea name="event_target" id="event_target" class="event_textarea" cols="92" rows="5" onchange="valueChanged()">${list.event_target}</textarea>
                            </li>
						</ul>
					</td>
				</tr>
                <tr>
                    <td><br><br></td>
                    <td><br><br></td>
                </tr>
                <tr>
					<td>이벤트 주의사항</td>
					<td>
						<ul class="eventlist">
							<li>
                                <textarea name="event_caution" id="event_caution"  class="event_textarea" cols="92" rows="5" onchange="valueChanged()">${list.event_caution}</textarea>
                            </li>
						</ul>
					</td>
				</tr>
                <tr>
                    <td><br><br></td>
                    <td><br><br></td>
                </tr>
				<tr>
					<td>
                        <span>이벤트 배너 사진 첨부</span>
                        <br>
                        <span class="img_standard">최소 : 400px * 300px</span>
                    </td>
					<td>
						<ul class="eventlist">
							<li class="value" id="filebox">
									<input id="upload-name" value="${list.filename }" placeholder="첨부파일"  readonly autocomplete="off">
									<label for="file" >파일찾기</label> 
									<input type="file" id="file" name="file" accept="image/*" onchange="valueChanged()">
							</li>
						</ul>
					</td>
				</tr>
                <tr>
                    <td></td>
                    <td><img id="event_banner_img" src="resources/upload_img/admin/event/${list.filename}" ></td>
                </tr>
                <tr>
                    <td><br><br></td>
                    <td><br><br></td>
                </tr>
                <tr>
					<td><span>이벤트 상세 사진 첨부</span>
                        <br>
                        <span class="img_standard">최소 : 600px * 800px</span>
                    </td>
					<td>
						<ul class="eventlist">
							<li class="value" id="filebox">
									<input id="upload-name2" value="${list.filename2}" placeholder="첨부파일"  readonly autocomplete="off">
									<label for="file2">파일찾기</label> 
									<input type="file" id="file2" name="file2" accept="image/*" onchange="valueChanged()">
							</li>
						</ul>
					</td>
				</tr>
                <tr>
                    <td></td>
                    <td><img id="event_banner_img2" src="resources/upload_img/admin/event/detail/${list.filename2}"></td>
                </tr>
                <tr>
                    <td><br><br></td>
                    <td><br><br></td>
                </tr>
				<tr>
					<td>1등 당첨 경품</td>
					<td><input type="text" class="item_name" value="미등록" readonly ></td>
				</tr>
				<tr>
					<td>2등 당첨 경품</td>
					<td><input type="text" class="item_name" value="미등록" readonly></td>
				</tr>
				<tr>
					<td>3등 당첨 경품</td>
					<td><input type="text" class="item_name" value="미등록" readonly></td>
				</tr>
			</table>
			<br><br>
			<div>
				<input type="submit" id="updatebutton" value="이벤트 변경">
	            <input type="button" id="deletebutton" value="이벤트 삭제" onclick="eventdelete('${param.event_no}');">
	            <input type="button" id="backbutton" value="뒤로가기" onclick="location.replace('event')">
			</div>
            
        </form>
    </div>
	
</body>
</html>