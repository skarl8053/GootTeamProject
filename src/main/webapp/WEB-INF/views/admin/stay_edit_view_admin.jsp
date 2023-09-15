<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>숙소 수정</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/stay_insert_admin.css"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- 개별 화면 content 크기를 조절하는 방법 -->
    <style>
        #content{
        	min-height : 1300px;
            height: auto;
            width : 1200px;
            margin : auto;
        }        
        #upload-name1,#upload-name2,#upload-name3{
        	width:244px;
        }
    </style>
    <script>
    		/* 변경된 사항이 있는지 체크 */
		    var valuechanged = false;
			
			function valueChanged(){
				
				// 처음 가져온 내용에서 변경된 것이 있는지 검색
				
				if( ! valuechanged )
				{
					valuechanged = true;
				}
			}
	
		    function imagePreview(event, input) {
		    	event.preventDefault();
		        const imageIds = ['firstImage', 'secondImage', 'thirdImage'];
		        
		        if(document.getElementById("file").files.length != 3){
            		return;
            	}
		        
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
		    
		    // 주소 검색 버튼 클릭 시 form 제출 막음
		    function preventFormSubmission(event) {
		        event.preventDefault();
		    }
		    
		    // 업데이트 항목 체크
		    function update_check() {
		    	const location = document.querySelector('.location').value;
		    	const category = document.querySelector('.category').value;
		    	const title = document.querySelector('.title').value;
		    	const firstImage = document.querySelector('#firstImage').value;
		    	const secondImage = document.querySelector('#secondImage').value;
		    	const thirdImage = document.querySelector('#thirdImage').value;
		    	const address = document.querySelector('#address').value;
		    	const addr_x = document.querySelector('#addr_x').value;
		    	const addr_y = document.querySelector('#addr_y').value;
		    	const stay_info = document.querySelector('.stay_info').value;
		    	const stay_room_name = document.querySelector('#stay_room_name').value;
		    	const stay_room_person = document.querySelector('#stay_room_person').value;
		    	const stay_room_price = document.querySelector('#stay_room_price').value;
		    	const stay_room_detailinfo = document.querySelector('#stay_room_detailinfo').value;
		    	
		    	if( ! valuechanged ){
		    		alert("변경된 내용이 없습니다.");
		    		return false;
		    	}
		    	
		    	if (location == "") {
		            alert("지역을 선택해주세요.");
		            document.querySelector('.location').focus();
		            return false; 
		        }

		        if (category == "") {
		            alert("카테고리를 선택해주세요.");
		            document.querySelector('.category').focus();
		            return false; 
		        }

		        if (firstImage == "") {
		            alert("첫번째 이미지를 등록해주세요.");
		            document.querySelector('#firstImage').focus();
		            return false; 
		        }
		        
		        if (secondImage == "") {
		            alert("두번째 이미지를 등록해주세요.");
		            document.querySelector('#secondImage').focus();
		            return false; 
		        }
		        
		        if (thirdImage == "") {
		            alert("세번째 이미지를 등록해주세요.");
		            document.querySelector('#thirdImage').focus();
		            return false; 
		        }
		        
		        if (title == "숙소명을 입력하세요." || title == "") {
		            alert("숙소명을 입력해주세요.");
		            document.querySelector('.title').focus();
		            return false; 
		        }

		        if (address == "") {
		            alert("주소를 입력해주세요.");
		            document.querySelector('#address').focus();
		            return false; 
		        }

		        if (addr_x == "") {
		            alert("위도를 입력해주세요.");
		            document.querySelector('#addr_x').focus();
		            return false; 
		        }

		        if (addr_y == "") {
		            alert("경도를 입력해주세요.");
		            document.querySelector('#addr_y').focus();
		            return false; 
		        }

		        if (stay_info == "" ) {
		            alert("숙소 정보 및 정책을 입력해주세요.");
		            document.querySelector('.stay_info').focus();
		            return false; 
		        }
		        
		        if (stay_info.length < 10) {
		        	alert("숙소 정보 및 정책을 10글자 이상 입력해주세요.");
		            document.querySelector('.stay_info').focus();
		            return false; 
		        }
		        
		        if (stay_room_name == "") {
		        	alert("객실번호를 입력해주세요.");
		            document.querySelector('#stay_room_name').focus();
		            return false; 
		        }
		        
		        if (stay_room_person == "") {
		        	alert("객실 인원 수를 선택해주세요.");
		            document.querySelector('#stay_room_person').focus();
		            return false; 
		        }
		        
		        if (stay_room_price == "") {
		        	alert("객실 가격을 입력해주세요.");
		            document.querySelector('#stay_room_price').focus();
		            return false; 
		        }
		        
		        if (stay_room_info == "") {
		        	alert("객실 정보를 입력해주세요.");
		            document.querySelector('#stay_room_info').focus();
		            return false; 
		        }
		        
		        if (stay_room_detailinfo == "") {
		        	alert("객실 정보 및 정책을 10글자 이상 입력해주세요.");
		            document.querySelector('#stay_room_detailinfo').focus();
		            return false; 
		        }
				
		        alert("숙소가 등록되었습니다.");
		        return true; 
		    }
		    
	        $(document).ready(function() {
	            $("#file").on("change", check_Upload_image_file);
	        });
	        
	        function check_Upload_image_file(e) {
	        	
	            // 숙소/객실 사진 첨부
	        	// 파일 첨부시 이미지 파일인지 체크
	        	
	            var files = e.target.files;
	            var filesArr = Array.prototype.slice.call(files);
	     
	            var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
	     
	            if(document.getElementById("file").files.length != 3){
            		alert("숙소 이미지를 3개 등록해주세요");
            		$("#file").val("");
            		return;
            	}
	            
	            filesArr.forEach(function(f) {
	                if (!f.type.match(reg)) {
	                    alert("확장자는 이미지 확장자만 가능합니다.");
	                    /* 
	                    document.getElementById("upload-name1").value = "";
	                    document.getElementById("upload-name2").value = "";
	                    document.getElementById("upload-name3").value = ""; */
	                    return;
	                }
	                else{
	                	
	                	for(var i = 0; i < 3; i++ ){
	                		var uploadFileName = document.getElementById("file").files[i].name;
		                	document.getElementById("upload-name" + (i+1)).value = uploadFileName;
	                	}
	                	
	                    
	                    /* var reader = new FileReader();
	                    reader.onload = (e) => {
	                        document.getElementById("firstImage").src = e.target.result[0];
	                        document.getElementById("secondImage").src = e.target.result[1];
	                        document.getElementById("thirdImage").src = e.target.result[2];
	                    } */
	                    /* reader.readAsDataURL(document.getElementById("file").files[0])
	                    reader.readAsDataURL(document.getElementById("file").files[1])
	                    reader.readAsDataURL(document.getElementById("file").files[2]) */
	                }
	            });
	        }
		    </script>
</head>
<body>
<form action="stay_modify" method="post" enctype="multipart/form-data" onsubmit="return validateForm();">
	<c:forEach items="${stay_view }" var="stay_view">
<input type="hidden" name="s_no" value="${stay_view.s_no }"/>
		<p>숙소 수정</p>
	    <hr>
	    <p>숙소 공통 정보</p>
	   
	    <div class="input-container">
			<select class="location" name="location" onchange="valueChanged()">
				<option value=" " selected>지역 선택</option>
				<option value="1" ${stay_view.s_loca == 1 ? 'selected' : ''}>서울</option>
				<option value="2" ${stay_view.s_loca == 2 ? 'selected' : ''}>경기</option>
				<option value="3" ${stay_view.s_loca == 3 ? 'selected' : ''}>인천</option>
				<option value="4" ${stay_view.s_loca == 4? 'selected' : ''}>제주</option>
				<option value="5" ${stay_view.s_loca == 5 ? 'selected' : ''}>전라</option>
				<option value="6" ${stay_view.s_loca == 6 ? 'selected' : ''}>경상</option>
				<option value="7" ${stay_view.s_loca == 7 ? 'selected' : ''}>충청</option>
				<option value="8" ${stay_view.s_loca == 8? 'selected' : ''}>강원</option>
			</select> <select class="category" name="category"  onchange="valueChanged()">
				<option value=" " selected>카테고리</option>
				<option value="1" ${stay_view.s_type == 1 ? 'selected' : ''}>호텔</option>
				<option value="2" ${stay_view.s_type == 2 ? 'selected' : ''}>모텔</option>
				<option value="3" ${stay_view.s_type == 3 ? 'selected' : ''}>펜션</option>
			</select> <br>

			<div id="textfield">
				<span id="title">제목</span>
				 <input type="text" name="stay_title" class="title" value="${stay_view.s_name }" onchange="valueChanged()">
			</div>
		</div>
	    
	    <p>숙소 공통 사진</p>
	        <div class="image-container">
			    <img src="resources/upload_img/admin/stay/${stay_view.s_img1 }" alt="이미지 없음" id="firstImage">
			    <img src="resources/upload_img/admin/stay/${stay_view.s_img2 }" alt="이미지 없음" id="secondImage" />
			    <img src="resources/upload_img/admin/stay/${stay_view.s_img3 }" alt="이미지 없음" id="thirdImage" /><br />
				<div class="filebox" id="firstFileBox">
				    <span><input id="upload-name1" value="${stay_view.s_img1 }" placeholder="첨부파일"  readonly autocomplete="off"></span>
				    <span><input id="upload-name2" value="${stay_view.s_img2 }" placeholder="첨부파일"  readonly autocomplete="off"></span>
				    <span><input id="upload-name3" value="${stay_view.s_img3}" placeholder="첨부파일"  readonly autocomplete="off"></span><br>
				<label for="file" >파일찾기</label> 
				    <input type="file" id="file" name="file" class="real-upload" accept="image/*"  multiple onchange="imagePreview(event, this)" onchange="valueChanged()">
			        <button class="button" id="deleteButton" onclick="onClickDeleteUpload(event);">파일 삭제</button>
			    </div>
			</div>
	    	
	        <input type="text" id="address" name="address" placeholder="" value="${stay_view.s_addr }" onchange="valueChanged()"/>
	    	<button id="searchButton" onclick="preventFormSubmission(event);">주소 검색</button>
	        <div class="xy">
		        <span>위도</span>
		        <input type="text" name="addr_x" id="addr_x" value="${stay_view.s_addr_x }" onchange="valueChanged()">
		        <span>경도</span>
		        <input type="text" name="addr_y" id="addr_y" value="${stay_view.s_addr_y }" onchange="valueChanged()">
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
	                <input type="checkbox" name="stay_facility" value="1" onchange="valueChanged()"> 1. 반려동물
	                <input type="checkbox" name="stay_facility" value="2" onchange="valueChanged()"> 2. 레스토랑
	                <input type="checkbox" name="stay_facility" value="3" onchange="valueChanged()"> 3. 주차시설 <br>
	                <input type="checkbox" name="stay_facility" value="4" onchange="valueChanged()"> 4. 물품보관
	                <input type="checkbox" name="stay_facility" value="5" onchange="valueChanged()"> 5. 수영장
	                <input type="checkbox" name="stay_facility" value="6" onchange="valueChanged()"> 6. 흡연구역 <br /><br />
	                
	                <p>등록된 숙소 편의시설</p> 
	                	
	            <span>
	                <c:choose>
	                	<c:when test="${stay_view.s_facility1 == 1 }"><button id="border-facility">반려동물</button></c:when>
	                	<c:when test="${stay_view.s_facility1 == 2 }"><button id="border-facility">레스토랑</button></c:when>
	                	<c:when test="${stay_view.s_facility1 == 3 }"><button id="border-facility">주차시설</button></c:when>
	                	<c:when test="${stay_view.s_facility1 == 4 }"><button id="border-facility">물품보관</button></c:when>
	                	<c:when test="${stay_view.s_facility1 == 5 }"><button id="border-facility">수영장</button></c:when>
	                	<c:when test="${stay_view.s_facility1 == 6 }"><button id="border-facility">흡연구역</button></c:when>
	                </c:choose>
	            </span>
	            <span>
	                <c:choose>
	                	<c:when test="${stay_view.s_facility2 == 2 }"><button id="border-facility">레스토랑</button></c:when>
	                	<c:when test="${stay_view.s_facility2 == 3 }"><button id="border-facility">주차시설</button></c:when>
	                	<c:when test="${stay_view.s_facility2 == 4 }"><button id="border-facility">물품보관</button></c:when>
	                	<c:when test="${stay_view.s_facility2 == 5 }"><button id="border-facility">수영장</button></c:when>
	                	<c:when test="${stay_view.s_facility2 == 6 }"><button id="border-facility">흡연구역</button></c:when>
	                </c:choose>
                </span>
                <span>
	                <c:choose>
	                	<c:when test="${stay_view.s_facility3 == 3 }"><button id="border-facility">주차시설</button></c:when>
	                	<c:when test="${stay_view.s_facility3 == 4 }"><button id="border-facility">물품보관</button></c:when>
	                	<c:when test="${stay_view.s_facility3 == 5 }"><button id="border-facility">수영장</button></c:when>
	                	<c:when test="${stay_view.s_facility3 == 6 }"><button id="border-facility">흡연구역</button></c:when>
	                </c:choose>
                </span>
                <span>
	                <c:choose>
	                	<c:when test="${stay_view.s_facility4 == 4 }"><button id="border-facility">물품보관</button></c:when>
	                	<c:when test="${stay_view.s_facility4 == 5 }"><button id="border-facility">수영장</button></c:when>
	                	<c:when test="${stay_view.s_facility4 == 6 }"><button id="border-facility">흡연구역</button></c:when>
	                </c:choose>
                </span>
                <span>
	                <c:choose>
	                	<c:when test="${stay_view.s_facility5 == 5 }"><button id="border-facility">수영장</button></c:when>
	                	<c:when test="${stay_view.s_facility5 == 6 }"><button id="border-facility">흡연구역</button></c:when>
	                </c:choose>
                </span>
                <span>
	                <c:choose>
	                	<c:when test="${stay_view.s_facility6 == 6 }"><button id="border-facility">흡연구역</button></c:when>
	                </c:choose>
	            </span>
	            
		        <br /><br />
	            
	        <p>숙소 정보 및 정책</p>
	        <textarea class="stay_info" name="stay_info" id="" cols="30" rows="10" onchange="valueChanged()">${stay_view.s_info }</textarea>
	        	
	        <p>해시태그</p>
	        <div id="hashtag">
	            <input type="checkbox" value="1" name="stay_hashtag" id="stay_hashtag" onchange="valueChanged()"> 1. 등산
	            <input type="checkbox" value="2" name="stay_hashtag" id="stay_hashtag" onchange="valueChanged()"> 2. 바다
	            <input type="checkbox" value="3" name="stay_hashtag" id="stay_hashtag" onchange="valueChanged()"> 3. 도시
	            <input type="checkbox" value="4" name="stay_hashtag" id="stay_hashtag" onchange="valueChanged()"> 4. 계곡 <br>
	            <input type="checkbox" value="5" name="stay_hashtag" id="stay_hashtag" onchange="valueChanged()"> 5. 레저
	            <input type="checkbox" value="6" name="stay_hashtag" id="stay_hashtag" onchange="valueChanged()"> 6. 문화
	            <input type="checkbox" value="7" name="stay_hashtag" id="stay_hashtag" onchange="valueChanged()"> 7. 맛집
	            <input type="checkbox" value="8" name="stay_hashtag" id="stay_hashtag" onchange="valueChanged()"> 8. 파티 <br /> <br />
	            
	            <div>등록된 해시태그</div> <br />
	            <c:choose>
		            	<c:when test="${stay_view.s_theme1 == 1}"><button id="border-facility">#등산</button></c:when>
		            	<c:when test="${stay_view.s_theme1 == 2}"><button id="border-facility">#바다</button></c:when>
		            	<c:when test="${stay_view.s_theme1 == 3}"><button id="border-facility">#도시</button></c:when>
		            	<c:when test="${stay_view.s_theme1 == 4}"><button id="border-facility">#계곡</button></c:when>
		            	<c:when test="${stay_view.s_theme1 == 5}"><button id="border-facility">#레저</button></c:when>
		            	<c:when test="${stay_view.s_theme1 == 6}"><button id="border-facility">#문화</button></c:when>
		            	<c:when test="${stay_view.s_theme1 == 7}"><button id="border-facility">#맛집</button></c:when>
		            	<c:when test="${stay_view.s_theme1 == 8}"><button id="border-facility">#파티</button></c:when>
		            </c:choose>
		            
		            <c:choose>
		            	<c:when test="${stay_view.s_theme2 == 2}"><button id="border-facility">#바다</button></c:when>
		            	<c:when test="${stay_view.s_theme2 == 3}"><button id="border-facility">#도시</button></c:when>
		            	<c:when test="${stay_view.s_theme2 == 4}"><button id="border-facility">#계곡</button></c:when>
		            	<c:when test="${stay_view.s_theme2 == 5}"><button id="border-facility">#레저</button></c:when>
		            	<c:when test="${stay_view.s_theme2 == 6}"><button id="border-facility">#문화</button></c:when>
		            	<c:when test="${stay_view.s_theme2 == 7}"><button id="border-facility">#맛집</button></c:when>
		            	<c:when test="${stay_view.s_theme2 == 8}"><button id="border-facility">#파티</button></c:when>
		            </c:choose>
		            <c:choose>
		            	<c:when test="${stay_view.s_theme3 == 3}"><button id="border-facility">#도시</button></c:when>
		            	<c:when test="${stay_view.s_theme3 == 4}"><button id="border-facility">#계곡</button></c:when>
		            	<c:when test="${stay_view.s_theme3 == 5}"><button id="border-facility">#레저</button></c:when>
		            	<c:when test="${stay_view.s_theme3 == 6}"><button id="border-facility">#문화</button></c:when>
		            	<c:when test="${stay_view.s_theme3 == 7}"><button id="border-facility">#맛집</button></c:when>
		            	<c:when test="${stay_view.s_theme3 == 8}"><button id="border-facility">#파티</button></c:when>
		            </c:choose>
		            <c:choose>
		            	<c:when test="${stay_view.s_theme4 == 4}"><button id="border-facility">#계곡</button></c:when>
		            	<c:when test="${stay_view.s_theme4 == 5}"><button id="border-facility">#레저</button></c:when>
		            	<c:when test="${stay_view.s_theme4 == 6}"><button id="border-facility">#문화</button></c:when>
		            	<c:when test="${stay_view.s_theme4 == 7}"><button id="border-facility">#맛집</button></c:when>
		            	<c:when test="${stay_view.s_theme4 == 8}"><button id="border-facility">#파티</button></c:when>
		            </c:choose> <br>
		            <c:choose>
		            	<c:when test="${stay_view.s_theme5 == 5}"><button id="border-facility">#레저</button></c:when>
		            	<c:when test="${stay_view.s_theme5 == 6}"><button id="border-facility">#문화</button></c:when>
		            	<c:when test="${stay_view.s_theme5 == 7}"><button id="border-facility">#맛집</button></c:when>
		            	<c:when test="${stay_view.s_theme5 == 8}"><button id="border-facility">#파티</button></c:when>
		            </c:choose>
		            <c:choose>
		            	<c:when test="${stay_view.s_theme6 == 6}"><button id="border-facility">#문화</button></c:when>
		            	<c:when test="${stay_view.s_theme6 == 7}"><button id="border-facility">#맛집</button></c:when>
		            	<c:when test="${stay_view.s_theme6 == 8}"><button id="border-facility">#파티</button></c:when>
		            </c:choose>
		            <c:choose>
		            	<c:when test="${stay_view.s_theme7 == 7}"><button id="border-facility">#맛집</button></c:when>
		            	<c:when test="${stay_view.s_theme7 == 8}"><button id="border-facility">#파티</button></c:when>
		            </c:choose>
		            <c:choose>
		            	<c:when test="${stay_view.s_theme8 == 8}"><button id="border-facility">#파티</button></c:when>
		            </c:choose>
	        </c:forEach> 
	        
	        <c:forEach items="${stay_room_view }" var="stay_room_view">
			    <div id="stay_room_info">
				    <p>숙소 객실 정보</p>
		        <div class="image-container">
				    <img src="resources/upload_img/admin/room/${stay_room_view.r_img1 }" alt="이미지 없음" class="image" id="room_firstImage">
				    <img src="resources/upload_img/admin/room/${stay_room_view.r_img2 }" alt="이미지 없음" class="image2" id="room_secondImage" />
				    <img src="resources/upload_img/admin/room/${stay_room_view.r_img3 }" alt="이미지 없음" class="image3" id="room_thirdImage" /><br />
						<span><input id="upload-name4" value="${stay_room_view.r_img1  }" placeholder="첨부파일"  readonly autocomplete="off"></span>
					    <span><input id="upload-name5" value="${stay_room_view.r_img2  }" placeholder="첨부파일"  readonly autocomplete="off"></span>
					    <span><input id="upload-name6" value="${stay_room_view.r_img3 }" placeholder="첨부파일"  readonly autocomplete="off"></span><br>
				    <div class="filebox" id="firstFileBox">
		    			<label for="file" >파일찾기</label> 
			  			<input type="file" id="file" name="file" class="real-upload" accept="image/*"  multiple onchange="imagePreview(event, this)" onchange="valueChanged()">
			  			<button class="button" id="deleteButton" onclick="onClickDeleteUpload(event);">파일 삭제</button>    
				    </div> 
				</div>
			        	
			            <p>메인 이미지</p>
			            <span>숙소 객실번호</span>
			            <input type="text" id="stay_room_name" name="stay_room_name" onchange="valueChanged()" value="${stay_room_view.r_name }">
			            <span>인원 수</span>
			            <select name="stay_room_person" id="stay_room_person">
			                <option value=" " selected>인원 수</option>
			                <option value="2" ${stay_room_view.r_person_cnt == 2 ? 'selected' : ''}>2</option>
			                <option value="3" ${stay_room_view.r_person_cnt == 3 ? 'selected' : ''}>3</option>
			                <option value="4" ${stay_room_view.r_person_cnt == 4 ? 'selected' : ''}>4</option>
			                <option value="5" ${stay_room_view.r_person_cnt == 5 ? 'selected' : ''}>5</option>
			                <option value="6" ${stay_room_view.r_person_cnt == 6 ? 'selected' : ''}>6</option>
			            </select><br>
			            <span>가격</span>
			            <input type="text" id="stay_room_price" name="stay_room_price" value="${stay_room_view.r_price }" onchange="valueChanged()">
			            <p>객실 상세정보</p>
			            <textarea name="stay_room_detailinfo" id="stay_room_detailinfo" cols="30" rows="10" onchange="valueChanged()">${stay_room_view.r_detail }</textarea><br>
			            <span>침대</span> <br>
			            <div class="bed">
			                <span class="bed_text">싱글 베드 침대</span>
			                   	<select name="stay_room_single_bed" onchange="valueChanged()">
				                   	<option value="Y" ${stay_room_view.r_single_bed_flag == "Y" ? 'selected' : ''}>Y</option>
				                   	<option value="N" ${stay_room_view.r_single_bed_flag == "N" ? 'selected' : ''}>N</option>
			                   	</select>
			                    <span class="bed_text">더블 베드 침대</span>
			                    <select name="stay_room_double_bed"  onchange="valueChanged()">
			                    	<option value="Y" ${stay_room_view.r_double_bed_flag == "Y" ? 'selected' : ''}>Y</option>
				                   	<option value="N" ${stay_room_view.r_double_bed_flag == "N" ? 'selected' : ''}>N</option>
			                   	</select>
			                    <span class="bed_text">퀸 베드 침대</span>
			                    <select name="stay_room_queen_bed"  onchange="valueChanged()">
			                   		<option value="Y" ${stay_room_view.r_queen_bed_flag == "Y" ? 'selected' : ''}>Y</option>
				                   	<option value="N" ${stay_room_view.r_queen_bed_flag == "N" ? 'selected' : ''}>N</option>
			                   	</select>
			            </div> <br>
			            <span>객실 편의시설</span>
			            <div id="stay_room_facility">
			            	
						    <input type="checkbox" value="1" name="stay_room_facility" id="stay_room_facility" onchange="valueChanged()"> 노트북 작업공간
						    <input type="checkbox" value="2" name="stay_room_facility" id="stay_room_facility" onchange="valueChanged()"> 웰컴 드링크
						    <input type="checkbox" value="3" name="stay_room_facility" id="stay_room_facility" onchange="valueChanged()"> 어매니티 <br>
						    <input type="checkbox" value="4" name="stay_room_facility" id="stay_room_facility"onchange="valueChanged()"> 넷플릭스
						    <input type="checkbox" value="5" name="stay_room_facility" id="stay_room_facility" onchange="valueChanged()"> 조식 포함
						    <input type="checkbox" value="6" name="stay_room_facility" id="stay_room_facility" onchange="valueChanged()"> 무료 와이파이 <br /><br />
						    
						   <div>등록된 객실 편의시설</div>  <br />
						    <c:choose>
									    <c:when test="${stay_room_view.r_facility1 == 1}"><button id="border-facility">노트북 작업공간</button></c:when> 
									    <c:when test="${stay_room_view.r_facility1 == 2}"><button id="border-facility">웰컴 드링크</button></c:when>
									    <c:when test="${stay_room_view.r_facility1 == 3}"><button id="border-facility">어매니티</button></c:when>
									    <c:when test="${stay_room_view.r_facility1 == 4}"><button id="border-facility">넷플릭스</button></c:when>
									    <c:when test="${stay_room_view.r_facility1 == 5}"><button id="border-facility">조식 포함</button></c:when>
									    <c:when test="${stay_room_view.r_facility1 == 6}"><button id="border-facility">무료 와이파이</button></c:when>
							</c:choose>
							<c:choose>
									    <c:when test="${stay_room_view.r_facility2 == 2}"><button id="border-facility">웰컴 드링크</button></c:when>
									    <c:when test="${stay_room_view.r_facility2 == 3}"><button id="border-facility">어매니티</button></c:when>
									    <c:when test="${stay_room_view.r_facility2 == 4}"><button id="border-facility">넷플릭스</button></c:when>
									    <c:when test="${stay_room_view.r_facility2 == 5}"><button id="border-facility">조식 포함</button></c:when>
									    <c:when test="${stay_room_view.r_facility2 == 6}"><button id="border-facility">무료 와이파이</button></c:when>
							</c:choose>
							<c:choose>       
									    <c:when test="${stay_room_view.r_facility3 == 3}"><button id="border-facility">어매니티</button></c:when>
									    <c:when test="${stay_room_view.r_facility3 == 4}"><button id="border-facility">넷플릭스</button></c:when>
									    <c:when test="${stay_room_view.r_facility3 == 5}"><button id="border-facility">조식 포함</button></c:when>
									    <c:when test="${stay_room_view.r_facility3 == 6}"><button id="border-facility">무료 와이파이</button></c:when>
							</c:choose>
									<br />
								
							<c:choose>       
									    <c:when test="${stay_room_view.r_facility4 == 4}"><button id="border-facility">넷플릭스</button></c:when>
									    <c:when test="${stay_room_view.r_facility4 == 5}"><button id="border-facility">조식 포함</button></c:when>
									    <c:when test="${stay_room_view.r_facility4 == 6}"><button id="border-facility">무료 와이파이</button></c:when>
							</c:choose>
									<c:choose>       
									    <c:when test="${stay_room_view.r_facility5 == 5}"><button id="border-facility">조식 포함</button></c:when>
									    <c:when test="${stay_room_view.r_facility5 == 6}"><button id="border-facility">무료 와이파이</button></c:when>
							</c:choose>
							<c:choose>       
									    <c:when test="${stay_room_view.r_facility6 == 6}"><button id="border-facility">무료 와이파이</button></c:when>
							</c:choose>
								 <br />
						</div>
			        </div>
	    </c:forEach> <br />
	      
	        <input type="submit" class="btn" value="수정하기">
	        <input type="button" class="btn" value="취소" onclick="goToListPage()">
</form>
	        
	        <script>
		        function goToListPage() {
		            window.location.href = '/travel/admin/stay_list';
		        }
	        </script>
	
</body>
</html>