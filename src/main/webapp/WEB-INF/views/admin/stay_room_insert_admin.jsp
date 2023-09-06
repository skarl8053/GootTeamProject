<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>숙소 등록</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/stay_insert_admin.css"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <!-- 개별 화면 content 크기를 조절하는 방법 -->
    <style>
        #content{
        	min-height : 800px;
            height: auto;
            width : 1200px;
            margin : auto;
        }
    </style>
    
    <script>
	    
		    function imagePreview(input) {
		        const imageIds = ['firstImage', 'secondImage', 'thirdImage'];
		        
		        if (input.files && input.files.length > 0) {
		            for (let i = 0; i < input.files.length; i++) {
		                if (i >= imageIds.length) {
		                    break; // 이미지 미리보기 개수를 초과하는 경우 종료
		                }
		                const reader = new FileReader();
		                reader.onload = (e) => {
		                    document.getElementById(imageIds[i]).src = e.target.result;
		                };
		                reader.readAsDataURL(input.files[i]);
		            }
		        }	
		    }
		
		    function onClickDeleteUpload(event) {
		    	event.preventDefault();
		        // 이미지 미리보기 삭제
		        const imageIds = ['firstImage', 'secondImage', 'thirdImage'];
		        for (const imageId of imageIds) {
		            document.getElementById(imageId).src = "";
		        }
		
		        // 파일 선택 값 초기화
		        const fileInput = document.querySelector('.real-upload');
		        fileInput.value = "";
		
		        // 파일 입력 필드 초기화 (input type="file"을 클릭해야 다시 파일을 선택할 수 있도록)
		        fileInput.type = 'text';
		        fileInput.type = 'file';
		    }
		    
		    // 등록 버튼 누를 때 모든 값 입력됐는지 확인
		    function onSubmitForm() {
		    	
		    	const stay_title = document.querySelector('#stay_title').value;
		    	const firstImage = document.querySelector('#firstImage').value;
		    	const stay_room_name = document.querySelector('#stay_room_name').value;
		    	const stay_room_price = document.querySelector('#stay_room_price').value;
		    	const stay_room_person = document.querySelector('#stay_room_person').value;
		    	const stay_room_detailinfo = document.querySelector('#stay_room_detailinfo').value;
		    	
		    	if (stay_title === "숙소명을 입력하세요." || stay_title === "" || stay_title === " ") {
		            alert("숙소명을 입력해주세요.");
		            document.querySelector('#stay_title').focus();
		            return false; 
		        }

		        if (firstImage === "" || firstImage === null) {
		            alert("객실 사진을 등록해주세요.");
		            document.querySelector('#firstImage').focus();
		            return false; 
		        }

		        if (stay_room_name === "객실번호를 입력하세요.") {
		            alert("객실 번호를 입력해주세요.");
		            document.querySelector('#stay_room_name').focus();
		            return false; 
		        }

		        if (stay_room_price === "가격을 입력하세요." || stay_room_price === "" || stay_room_price === " ") {
		            alert("객실 가격을 입력해주세요.");
		            document.querySelector('#stay_room_price').focus();
		            return false; 
		        }

		        if (stay_room_person === "인원 수") {
		            alert("인원 수를 입력해주세요.");
		            document.querySelector('#stay_room_person').focus();
		            return false; 
		        }

		        if (stay_room_detailinfo === "객실 상세정보를 입력하세요." || stay_room_detailinfo === "" || stay_room_detailinfo === " "
		        	 || stay_room_detailinfo.length < 10) {
		            alert("객실 상세정보를 입력해주세요.");
		            document.querySelector('#stay_room_detailinfo').focus();
		            return false; 
		        }

		        alert("숙소 객실이 등록되었습니다.");
		        return true; 
		    	
		    }
		    
		    function selectValue() {
		    	var s_no = document.getElementById("s_no").value;
		    	var stay_title = document.getElementById("stay_title").value;
		    	
		    	if (stay_title.length < 1) {
		    		alert("숙소명을 입력해주세요.")
		    		return false;
		    	}
		    }
    </script>
    
	<!-- setStayTitle 함수 추가 -->
	<script>
	function setStayTitle(selectedName) {
	    document.getElementById("stay_title").value = selectedName;
	   // closePopup();
	}
	
	function openNewWindow() {
	    const option = "width=600,height=720,left=500,top=120";
	    const popupWindow = window.open("stay_list_confirm", "숙소 등록 리스트 팝업", option);
	    
	    // 팝업 창의 iframe 로드 이벤트에 함수 할당
	    popupWindow.document.querySelector("#popup-iframe").onload = function() {
	        // 팝업 창에서 메인 창으로 콜백으로 전달하기 위한 함수 할당
	        popupWindow.setStayTitle = setStayTitle;
	    };
	}
	</script>
	
    <script>
 	// 객실 추가하기 버튼 동작
	let roomCounter = 1; // 객실 번호 카운터 초기값

    function addRoom() {
        roomCounter++; // 객실 번호 카운터 증가
        const roomSection = document.createElement("div");
        roomSection.innerHTML = `
            <p>숙소 객실 정보</p>
            <div class="image-container">
                <img src="" alt="이미지 없음" class="image" id="firstImage" />
                <img src="" alt="이미지 없음" class="image2" id="secondImage" />
                <img src="" alt="이미지 없음" class="image3" id="thirdImage" /><br />
                <div class="filebox" id="firstFileBox">
                    <input type="file" name="file" class="real-upload" accept="image/*" multiple onchange="imagePreview(this)">
                    <button class="button" id="deleteButton" onclick="onClickDeleteUpload();">파일 삭제</button>
                </div>
            </div>
            
            <p>메인 이미지</p>
            <span>숙소 객실번호</span>
            <input type="text" onfocus="this.value='';" id="stay_room_name" name="stay_room_name" value="객실번호를 입력하세요.">
            <span>인원 수</span>
            <select name="stay_room_person" id="stay_room_person">
                <option value=" " selected>인원 수</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
            </select><br>
            <span>가격</span>
            <input type="text" id="stay_room_price" name="stay_room_price" onfocus="this.value='';" value="가격을 입력하세요.">
            <p>객실 상세정보</p>
            <textarea name="stay_room_detailinfo" id="stay_room_detailinfo" cols="30" rows="10" onfocus="this.value='';">객실 상세정보를 입력하세요.</textarea><br>
            <span>침대</span> <br>
            <div class="bed">
                <span class="bed_text">싱글 베드 침대</span>
                <select name="stay_room_single_bed" >
                    <option value="Y">Y</option>
                    <option value="N">N</option>
                </select>
                <span class="bed_text">더블 베드 침대</span>
                <select name="stay_room_double_bed">
                    <option value="Y">Y</option>
                    <option value="N">N</option>
                </select>
                <span class="bed_text">퀸 베드 침대</span>
                <select name="stay_room_queen_bed">
                    <option value="Y">Y</option>
                    <option value="N">N</option>
                </select>
            </div> <br>
            <span>객실 편의시설</span>
            <div id="stay_room_facility">
                <input type="checkbox" value="1" name="stay_room_facility"> 노트북 작업공간
                <input type="checkbox" value="2" name="stay_room_facility"> 웰컴 드링크
                <input type="checkbox" value="3" name="stay_room_facility"> 어매니티 <br>
                <input type="checkbox" value="4" name="stay_room_facility"> 넷플릭스
                <input type="checkbox" value="5" name="stay_room_facility"> 조식 포함
                <input type="checkbox" value="6" name="stay_room_facility"> 무료 와이파이
            </div> <br />
            <input type="button" value="객실 추가하기" onclick="addRoom()" /> <br />
        `;

        // 객실 정보 섹션을 추가할 요소를 찾아서 추가
        const content = document.getElementById("content");
        content.appendChild(roomSection);

    }
    </script>
    
</head>
<body>
<form action="${pageContext.request.contextPath}/admin/stay_room_insert_service" method="post" enctype="multipart/form-data" onsubmit="return onSubmitForm();">
		
	        <p>숙소 객실 등록</p>
	        <hr />
	        <p>숙소명</p>
	            <input type="text" id="stay_title" name="stay_title" value="숙소명을 입력하세요." onclick="openNewWindow()" readonly>
	            <div class="popup-overlay" id="popup">
				    <div class="popup-content">
				        <button class="popup-close" onclick="closePopup()">창 닫기</button>
				        <iframe id="popup-iframe" src="팝업 내용의 URL" frameborder="0"></iframe>
				    </div>
				</div>

		    	<p>숙소 객실 정보</p>
	        <div class="image-container">
			    <img src="" alt="이미지 없음" class="image" id="firstImage" />
			    <img src="" alt="이미지 없음" class="image2" id="secondImage" />
			    <img src="" alt="이미지 없음" class="image3" id="thirdImage" /><br />
			    <div class="filebox" id="firstFileBox">
			        <input type="file" name="file" class="real-upload" accept="image/*" multiple onchange="imagePreview(this)">
			        <button class="button" id="deleteButton" onclick="onClickDeleteUpload();">파일 삭제</button>
			    </div>
			</div>
	        
	            <p>메인 이미지</p>
	            <span>숙소 객실번호</span>
	            <input type="text" onfocus="this.value='';" id="stay_room_name" name="stay_room_name" value="객실번호를 입력하세요.">
	            <span>인원 수</span>
	            <select name="stay_room_person" id="stay_room_person">
	                <option value=" " selected>인원 수</option>
	                <option value="2">2</option>
	                <option value="3">3</option>
	                <option value="4">4</option>
	                <option value="5">5</option>
	                <option value="6">6</option>
	            </select><br>
	            <span>가격</span>
	            <input type="text" id="stay_room_price" name="stay_room_price" onfocus="this.value='';" value="가격을 입력하세요.">
	            <p>객실 상세정보</p>
	            <textarea name="stay_room_detailinfo" id="stay_room_detailinfo" cols="30" rows="10" onfocus="this.value='';">객실 상세정보를 입력하세요.</textarea><br>
	            <span>침대</span> <br>
	            <div class="bed">
	                <span class="bed_text">싱글 베드 침대</span>
	                   	<select name="stay_room_single_bed" >
	                   		<option value="Y">Y</option>
	                   		<option value="N">N</option>
	                   	</select>
	                    <span class="bed_text">더블 베드 침대</span>
	                    <select name="stay_room_double_bed">
	                   		<option value="Y">Y</option>
	                   		<option value="N">N</option>
	                   	</select>
	                    <span class="bed_text">퀸 베드 침대</span>
	                    <select name="stay_room_queen_bed">
	                   		<option value="Y">Y</option>
	                   		<option value="N">N</option>
	                   	</select>
	            </div> <br>
	            <span>객실 편의시설</span>
	            <div id="stay_room_facility">
	                <input type="checkbox" value="1" name="stay_room_facility"> 노트북 작업공간
	                <input type="checkbox" value="2" name="stay_room_facility"> 웰컴 드링크
	                <input type="checkbox" value="3" name="stay_room_facility"> 어매니티 <br>
	                <input type="checkbox" value="4" name="stay_room_facility"> 넷플릭스
	                <input type="checkbox" value="5" name="stay_room_facility"> 조식 포함
	                <input type="checkbox" value="6" name="stay_room_facility"> 무료 와이파이
	            </div> <br />
	            
	            <input type="button" value="객실 추가하기" onclick="addRoom()" /> <br />
	        
	        <input type="submit" class="btn" value="등록하기">
	        <input type="button" class="btn" value="취소" onclick="goToMainPage()">
	        
	        <script>
		        function goToMainPage() {
		            window.location.href = '/travel/main';
		        }
	        </script>
	</form>
	
</body>
</html>