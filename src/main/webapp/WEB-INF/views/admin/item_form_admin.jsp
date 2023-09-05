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
			height: 1700px;
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
		
        
        ul{
            list-style: none;
            padding-left: 0;
        }
        li{
            padding: 0 0 20px 0;
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
        .input_name{
            padding: 10px 0 10px 20px;
        }
        #firstitem_name, #seconditem_name, #thirditem_name, 
        #firstitem_desc, #seconditem_desc, #thirditem_desc{
            width: 615px;
            resize: none;
        }
        .image{
            width: 300px;
            height: 300px;
            margin: 0 auto;
            display: none;

        }
        #firstDeleteButton, #secondDeleteButton, #thirdDeleteButton{
            display: none;
        }
		#paging{
			width: 1200px;
			text-align: center;
			
		}
        .winner_button{
           width: 98%; 
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
        .filebox label {
        display: inline-block;
        padding: .5em .75em;
        color: white;
        font-size: inherit;
        line-height: normal;
        vertical-align: middle;
        background-color: blue;  /* 버튼 색상 변경 */
        cursor: pointer;
        border: 1px solid #ebebeb;
        border-bottom-color: #e2e2e2;
        border-radius: .25em;
        }

        .filebox input[type="file"] {  /* 파일 필드 숨기기 */
            position: absolute;
            width: 1px;
            height: 1px;
            padding: 0;
            margin: -1px;
            overflow: hidden;
            clip:rect(0,0,0,0);
            border: 0;
        }

    </style>

    <script>

        function imagePreview(input, image_index){

            // 이미지 미리보기
            var reader = new FileReader();

            reader.onload = (e) => {
                document.getElementById(image_index + "Image").src = e.target.result;
            };
            reader.readAsDataURL(input.files[0]);

            // 불러오기 버튼은 숨김
            document.getElementById(image_index + 'FileBox').style.display = "none";
            // 이미지 보여주고, 삭제버튼도 같이 보여주도록
            document.getElementById(image_index + "Image").style.display = "inline";
            document.getElementById(image_index + 'DeleteButton').style.display = "inline";
        }

        function onClickDeleteUpload(image_index){

            // 이미지 미리보기 삭제

            // 이미지 경로 제거
            document.getElementById(image_index + "Image").src = "";
            document.getElementById(image_index + "File").value = "";

            // 불러오기 버튼은 보여줌
            document.getElementById(image_index + 'FileBox').style.display = "inline";

            // 이미지 숨기고, 삭제버튼도 안보이게
            document.getElementById(image_index + "Image").style.display = "none";
            document.getElementById(image_index + 'DeleteButton').style.display = "none";
            
            return false; // 새로고침 되는 것을 막기 위함 (삭제하면 안됨)
        }

        function checkItem(){

            // 파일 명, 설명 문자 수 검사

            var str = new Array('first','second','third');
            var strKor = new Array('1등 당첨경품 : ', '2등 당첨경품 :', '3등 당첨경품 :');
            for(var i = 0; i<3 ;i++)
            {
                var item_name = document.getElementById(str[i] + "item_name").value;
                var item_desc = document.getElementById(str[i] + "item_desc").value;

                if(item_name.length < 1){
                	alert(strKor[i] + ' : 제품 이름을 입력해주세요');
                    return false;
                }
                if(item_name.length >= 100){
                    alert(strKor[i] + ' : 제품 이름은 100자를 넘길 수 없습니다');
                    return false;
                }
                if(item_desc.length >= 1000){
                    alert(strKor[i] + ' : 제품 설명은 1000자를 넘길 수 없습니다');
                    return false;
                }
            }
        }

    </script>

	



    <!-- 메인 -->
    <h1>경품 관리</h1>
    
    <form action="iteminsert" onsubmit="return checkItem()" method="post" enctype="multipart/form-data">
    
    	<input type="hidden" name="event_no" value="${event_no}" />
		<input type="hidden" name="event_name" value="${event_name}" />
        <div>
            <div>
                <br />
                <div>
                	<p>
                		<span>이벤트 번호 : </span>
                    	<span>${event_no}</span>
                	</p>
                </div>
                <div>
                	<p>
                		<span>이벤트 이름 : </span>
                        <span>${event_name}</span>
                	</p>
                </div>
            </div>
            <br><br>
            <div>
                <table>
                    <tr>
                        <th width="10%">등수</th>
                        <th width="35%">사진</th>
                        <th width="52%">제품 / 설명</th>
                    </tr>
                    <tr>
                        <td id="first_col">1등 당첨 경품</td>
                        <td id="second_col">
                            <div>
                                    <img src="" alt="이미지 없음" class="image" id="firstImage">  <!-- 맨 처음에는 이미지가 없음-->
                            </div>
                            <div class="filebox" id="firstFileBox">
                                <label for="firstFile">파일 불러오기</label>
                                <input type="file" class="file" id="firstFile" name="first_file" onchange="imagePreview(this, 'first')"> 
                            </div>
                            <div>
                                <button class="button" id="firstDeleteButton" onclick="return onClickDeleteUpload('first');">파일 삭제</button>
                            </div>
                        </td>
                        <td id="third_col">
                            <div class="input_name">
                           			제품 이름 : <br>
                                    <input type="text" id="firstitem_name" name="firstitem_name"><br>
                            </div>
                            <div class="input_name">
                                    제품 설명 : <br>
                                    <textarea id="firstitem_desc" name="firstitem_desc" rows="15"></textarea>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td id="first_col">2등 당첨 경품</td>
                        <td id="second_col">
                            <div>   
                                    <img src="" alt="이미지 없음" class="image" id="secondImage">  <!-- 맨 처음에는 이미지가 없음-->
                            </div>
                            <div class="filebox" id="secondFileBox">
                                <label for="secondFile">파일 불러오기</label>
                                <input type="file" class="file" id="secondFile" name="second_file" onchange="imagePreview(this, 'second')"> 
                            </div>
                            <div>
                                <button class="button" id="secondDeleteButton" onclick="return onClickDeleteUpload('second');">파일 삭제</button>
                            </div>
                        </td>
                        <td id="third_col">
                            <div class="input_name">
                                    제품 이름 : <br>
                                    <input type="text" id="seconditem_name" name="seconditem_name"><br>
                            </div>
                            <div class="input_name">
                                    제품 설명 : <br>
                                    <textarea id="seconditem_desc" name="seconditem_desc" rows="15"></textarea>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td id="first_col">3등 당첨 경품</td>
                        <td id="second_col">
                            <div>
                                    <img src="" alt="이미지 없음" class="image" id="thirdImage">  <!-- 맨 처음에는 이미지가 없음-->
                            </div>
                            <div class="filebox" id="thirdFileBox">
                                <label for="thirdFile">파일 불러오기</label>
                                <input type="file" class="file" id="thirdFile" name="third_file" onchange="imagePreview(this, 'third')"> 
                            </div>
                            <div>
                                <button class="button" id="thirdDeleteButton" onclick="return onClickDeleteUpload('third');">파일 삭제</button>
                            </div>
                        </td>
                        <td id="third_col">
                            <div class="input_name">
                                    제품 이름 : <br>
                                    <input type="text" id="thirditem_name" name="thirditem_name"><br>
                            </div>
                            <div class="input_name">
                                    제품 설명 : <br>
                                    <textarea id="thirditem_desc" name="thirditem_desc" rows="15"></textarea>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <br /><br />
            <div>
              	<input type="submit" class="button" value="경품 추가">
               	<input type="button" class="button" value="뒤로 가기" onclick="location.replace('item?page=1&event_no=${event_no}&event_name=${event_name }')">
            </div>
        </div>
    </form>
    
</body>
</html>