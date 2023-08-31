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
            height: 1200px;
            width : 1200px;
            margin : 0 auto;
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
		
		    function onClickDeleteUpload() {
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
		    	
		    	const location = document.querySelector('.location').value;
		    	const category = document.querySelector('.category').value;
		    	const title = document.querySelector('.title').value;
		    	const firstImage = document.querySelector('#firstImage').value;
		    	const address = document.querySelector('#address').value;
		    	const addr_x = document.querySelector('#addr_x').value;
		    	const addr_y = document.querySelector('#addr_y').value;
		    	const stay_info = document.querySelector('.stay_info').value;
		    	
		    	if (location === " ") {
		            alert("지역을 선택해주세요.");
		            document.querySelector('.location').focus();
		            return false; 
		        }

		        if (category === " ") {
		            alert("카테고리를 선택해주세요.");
		            document.querySelector('.category').focus();
		            return false; 
		        }

		        if (firstImage === " ") {
		            alert("이미지를 등록해주세요.");
		            document.querySelector('#firstImage').focus();
		            return false; 
		        }
		        
		        if (title === "숙소명을 입력하세요." || title === " " || title === "") {
		            alert("숙소명을 입력해주세요.");
		            document.querySelector('.title').focus();
		            return false; 
		        }

		        if (address === "") {
		            alert("주소를 입력해주세요.");
		            document.querySelector('#address').focus();
		            return false; 
		        }

		        if (addr_x === "") {
		            alert("위도를 입력해주세요.");
		            document.querySelector('#addr_x').focus();
		            return false; 
		        }

		        if (addr_y === "") {
		            alert("경도를 입력해주세요.");
		            document.querySelector('#addr_y').focus();
		            return false; 
		        }

		        if (stay_info === "") {
		            alert("숙소 정보 및 정책을 입력해주세요.");
		            document.querySelector('.stay_info').focus();
		            return false; 
		        }

		        alert("숙소가 등록되었습니다.");
		        return true; 
		    	
		    }
    </script>
    
    
</head>
<body>
<form action="${pageContext.request.contextPath}/admin/stay_insert_service" method="post" enctype="multipart/form-data" onsubmit="return onSubmitForm();">
		<p class="stay_registration_text">숙소 등록</p>
	    <hr>
	    <p>숙소 공통 정보</p>
	    <select class="location" name="location">
	        <option value=" " selected>지역 선택</option>
	        <option value="1">서울</option>
	        <option value="2">경기</option>
	        <option value="3">인천</option>
	        <option value="4">제주</option>
	        <option value="5">전라</option>
	        <option value="6">경상</option>
	        <option value="7">충청</option>
	        <option value="8">강원</option>
	    </select>
	    <select class="category" name="category">
	        <option value=" " selected>카테고리</option>
	        <option value="1">호텔</option>
	        <option value="2">모텔</option>
	        <option value="3">펜션</option>
	    </select> <br>
	    <div id="textfield">
		    <span id="title">숙소명</span>
		    <input type="text" onfocus="this.value='';" name="stay_title" class="title" value="숙소명을 입력하세요.">
	    </div>
	    <p>숙소 공통 사진</p>
	       	<div class="image-container">
			    <img src="" alt="이미지 없음" class="image" id="firstImage" />
			    <img src="" alt="이미지 없음" class="image2" id="secondImage" />
			    <img src="" alt="이미지 없음" class="image3" id="thirdImage" /><br />
			    <div class="filebox" id="firstFileBox">
			        <input type="file" name="file" class="real-upload" accept="image/*" multiple onchange="imagePreview(this)">
			        <button class="button" id="deleteButton" onclick="onClickDeleteUpload();">파일 삭제</button>
			    </div>
			</div>
	    	<input type="text" id="address" name="address" placeholder="주소를 입력해주세요." />
	    	<button id="searchButton">주소 검색</button>
	        <div class="xy">
		        <span>위도</span>
		        <input type="text" onfocus="this.value='';" name="addr_x" id="addr_x" value="위도를 입력해주세요.">
		        <span>경도</span>
		        <input type="text" onfocus="this.value='';" name="addr_y" id="addr_y" value="경도를 입력해주세요.">
	        </div>
	        
	         <!-- 주소 검색 및 위도 경도 구하기 -->
	            <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
			    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9bdfa0d98e7c6b1949b387b6e48e0de3&libraries=services"></script>
			    <script type="application/javascript">
			        const addressField = document.getElementById("address");
			        const addr_xField = document.getElementById("addr_x");
			        const addr_yField = document.getElementById("addr_y");
			        const searchButton = document.getElementById("searchButton");
			
			        searchButton.addEventListener("click", function(event) {
			        	event.preventDefault();
			        	
			            new daum.Postcode({
			                oncomplete: function(data) {
			                    addressField.value = data.address;
			
			                    const geocoder = new daum.maps.services.Geocoder();
			                    geocoder.addressSearch(data.address, function(result, status) {
			                        if (status === daum.maps.services.Status.OK) {
			                            const { x, y } = result[0];
			                            addr_xField.value = y;
			                            addr_yField.value = x;
			                        }
			                    });
			                   this.autoClose();
			                },
			                width: "100%",
			                height: window.innerHeight,
			            }).open();
			        });
			    </script>
			    
	        <p>숙소 편의시설</p>
	            <div id="stay_facility">
	                <input type="checkbox" name="stay_facility" value="1"> 반려동물
	                <input type="checkbox" name="stay_facility" value="2"> 레스토랑
	                <input type="checkbox" name="stay_facility" value="3"> 주차시설 <br>
	                <input type="checkbox" name="stay_facility" value="4"> 물품보관
	                <input type="checkbox" name="stay_facility" value="5"> 수영장
	                <input type="checkbox" name="stay_facility" value="6"> 흡연구역
	            </div>
	        <p>숙소 정보 및 정책</p>
	        <textarea name="stay_info" class="stay_info" onfocus="this.value='';" id="" cols="30" rows="10">숙소 공통 정보 및 정책을 입력해주세요.</textarea>
	        <p>해시태그</p>
	        <div id="hashtag">
	            <input type="checkbox" value="1" name="stay_hashtag"> 등산
	            <input type="checkbox" value="2" name="stay_hashtag"> 바다
	            <input type="checkbox" value="3" name="stay_hashtag"> 도시
	            <input type="checkbox" value="4" name="stay_hashtag"> 계곡 <br>
	            <input type="checkbox" value="5" name="stay_hashtag"> 레저
	            <input type="checkbox" value="6" name="stay_hashtag"> 문화
	            <input type="checkbox" value="7" name="stay_hashtag"> 맛집
	            <input type="checkbox" value="8" name="stay_hashtag"> 파티
	        </div>
	        
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