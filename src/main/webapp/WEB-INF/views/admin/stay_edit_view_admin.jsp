<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        	min-height : 1300px;
            height: auto;
            width : 1200px;
            margin : auto;
        }
    </style>
    <script>
		    function imagePreview(event, input) {
		    	event.preventDefault();
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
		    
		    // 주소 검색 버튼 클릭 시 form 제출 막음
		    function preventFormSubmission(event) {
		        event.preventDefault();
		    }
		    
		    // facility , room_facility 체크 되지 않을 때 alert창
		    function validateForm() {
		        const stay_facility = document.querySelectorAll('input[name="stay_facility"]:checked');
		        const stay_hashtag = document.querySelectorAll('input[name="stay_hashtag"]:checked');
		        /* const stay_room_facility = document.querySelectorAll('input[name="stay_room_facility"]:checked'); */
		         /* || stay_room_facility.length === 0 */
		        if (stay_facility.length === 0 || stay_hashtag.length === 0) {
		            alert('숙소 편의시설 / 해시태그 / 객실 편의시설은 필수 선택입니다. \n변경 사항이 없다면 이전과 같은 값을 체크해주세요.'); 
		            return false; 
		        }
		
		        return true;
		    }
		    </script>
</head>
<body>
<form action="stay_modify" method="post" enctype="multipart/form-data" onsubmit="return validateForm();">
	<c:forEach items="${stay_view }" var="stay_view">
<input type="hidden" name="s_no" value="${stay_view.s_no }"/>
		<p>숙소 등록</p>
	    <hr>
	    <p>숙소 공통 정보</p>
	   
	    <div class="input-container">
			<select class="location" name="location">
				<option value=" " selected>지역 선택</option>
				<option value="1" ${stay_view.s_loca == 1 ? 'selected' : ''}>서울</option>
				<option value="2" ${stay_view.s_loca == 2 ? 'selected' : ''}>경기</option>
				<option value="3" ${stay_view.s_loca == 3 ? 'selected' : ''}>인천</option>
				<option value="4" ${stay_view.s_loca == 4? 'selected' : ''}>제주</option>
				<option value="5" ${stay_view.s_loca == 5 ? 'selected' : ''}>전라</option>
				<option value="6" ${stay_view.s_loca == 6 ? 'selected' : ''}>경상</option>
				<option value="7" ${stay_view.s_loca == 7 ? 'selected' : ''}>충청</option>
				<option value="8" ${stay_view.s_loca == 8? 'selected' : ''}>강원</option>
			</select> <select class="category" name="category">
				<option value=" " selected>카테고리</option>
				<option value="1" ${stay_view.s_type == 1 ? 'selected' : ''}>호텔</option>
				<option value="2" ${stay_view.s_type == 2 ? 'selected' : ''}>모텔</option>
				<option value="3" ${stay_view.s_type == 3 ? 'selected' : ''}>펜션</option>
			</select> <br>

			<div id="textfield">
				<span id="title">제목</span> <input type="text" name="stay_title"
					class="title" value="${stay_view.s_name }">
			</div>
		</div>
	    
	    <p>숙소 공통 사진</p>
	        <div class="image-container">
			    <%-- <img src="/Users/sjh/Downloads/TeamProject/GootTeamProject0831/GootTeamProject/src/main/webapp/resources/upload_img/admin/stay"${stay_view.s_img1 } alt="이미지 없음" class="image" id="firstImage" />${stay_view.s_img1 } --%>
			    <img src="resources/upload_img/admin/stay/${stay_view.s_img1 }" alt="이미지 없음" class="image" id="firstImage">
			    <img src="resources/upload_img/admin/stay/${stay_view.s_img2 }" alt="이미지 없음" class="image2" id="secondImage" />
			    <img src="resources/upload_img/admin/stay/${stay_view.s_img3 }" alt="이미지 없음" class="image3" id="thirdImage" /><br />
			    <div class="filebox" id="firstFileBox">
			        <input type="file" name="file" class="real-upload" accept="image/*" multiple onchange="imagePreview(event, this)">
			        <button class="button" id="deleteButton" onclick="onClickDeleteUpload(event);">파일 삭제</button>
			    </div>
			</div>
	    	
	        <input type="text" id="address" name="address" placeholder="" value="${stay_view.s_addr }" />
	    	<button id="searchButton" onclick="preventFormSubmission(event);">주소 검색</button>
	        <div class="xy">
		        <span>위도</span>
		        <input type="text" name="addr_x" id="addr_x" value="${stay_view.s_addr_x }">
		        <span>경도</span>
		        <input type="text" name="addr_y" id="addr_y" value="${stay_view.s_addr_y }">
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
	                <input type="checkbox" name="stay_facility" value="1"> 1. 반려동물
	                <input type="checkbox" name="stay_facility" value="2"> 2. 레스토랑
	                <input type="checkbox" name="stay_facility" value="3"> 3. 주차시설 <br>
	                <input type="checkbox" name="stay_facility" value="4"> 4. 물품보관
	                <input type="checkbox" name="stay_facility" value="5"> 5. 수영장
	                <input type="checkbox" name="stay_facility" value="6"> 6. 흡연구역 <br /><br />
	                
	                <div class="register_text">등록된 숙소 편의시설</div> <br />
	                <c:choose>
	                	<c:when test="${stay_view.s_facility1 == 1 }">반려동물</c:when>
	                	<c:when test="${stay_view.s_facility1 == 2 }">레스토랑</c:when>
	                	<c:when test="${stay_view.s_facility1 == 3 }">주차시설</c:when>
	                	<c:when test="${stay_view.s_facility1 == 4 }">물품보관</c:when>
	                	<c:when test="${stay_view.s_facility1 == 5 }">수영장</c:when>
	                	<c:when test="${stay_view.s_facility1 == 6 }">흡연구역</c:when>
	                </c:choose>
	                <c:choose>
	                	<c:when test="${stay_view.s_facility2 == 2 }">레스토랑</c:when>
	                	<c:when test="${stay_view.s_facility2 == 3 }">주차시설</c:when>
	                	<c:when test="${stay_view.s_facility2 == 4 }">물품보관</c:when>
	                	<c:when test="${stay_view.s_facility2 == 5 }">수영장</c:when>
	                	<c:when test="${stay_view.s_facility2 == 6 }">흡연구역</c:when>
	                </c:choose>
	                <c:choose>
	                	<c:when test="${stay_view.s_facility3 == 3 }">주차시설</c:when>
	                	<c:when test="${stay_view.s_facility3 == 4 }">물품보관</c:when>
	                	<c:when test="${stay_view.s_facility3 == 5 }">수영장</c:when>
	                	<c:when test="${stay_view.s_facility3 == 6 }">흡연구역</c:when>
	                </c:choose>
	                <c:choose>
	                	<c:when test="${stay_view.s_facility4 == 4 }">물품보관</c:when>
	                	<c:when test="${stay_view.s_facility4 == 5 }">수영장</c:when>
	                	<c:when test="${stay_view.s_facility4 == 6 }">흡연구역</c:when>
	                </c:choose>
	                <c:choose>
	                	<c:when test="${stay_view.s_facility5 == 5 }">수영장</c:when>
	                	<c:when test="${stay_view.s_facility5 == 6 }">흡연구역</c:when>
	                </c:choose>
	                <c:choose>
	                	<c:when test="${stay_view.s_facility6 == 6 }">흡연구역</c:when>
	                </c:choose>
	            </div>
	            
	        <p>숙소 정보 및 정책</p>
	        <textarea name="stay_info" id="" cols="30" rows="10">${stay_view.s_info }</textarea>
	        	
	        <p>해시태그</p>
	        <div id="hashtag">
	            <input type="checkbox" value="1" name="stay_hashtag"> 1. 등산
	            <input type="checkbox" value="2" name="stay_hashtag"> 2. 바다
	            <input type="checkbox" value="3" name="stay_hashtag"> 3. 도시
	            <input type="checkbox" value="4" name="stay_hashtag"> 4. 계곡 <br>
	            <input type="checkbox" value="5" name="stay_hashtag"> 5. 레저
	            <input type="checkbox" value="6" name="stay_hashtag"> 6. 문화
	            <input type="checkbox" value="7" name="stay_hashtag"> 7. 맛집
	            <input type="checkbox" value="8" name="stay_hashtag"> 8. 파티 <br /> <br />
	            
	            <div class="register_text">등록된 해시태그</div> <br />
	            <c:choose>
	            	<c:when test="${stay_view.s_theme1 == 1}">등산</c:when>
	            	<c:when test="${stay_view.s_theme1 == 2}">바다</c:when>
	            	<c:when test="${stay_view.s_theme1 == 3}">도시</c:when>
	            	<c:when test="${stay_view.s_theme1 == 4}">계곡</c:when>
	            	<c:when test="${stay_view.s_theme1 == 5}">레저</c:when>
	            	<c:when test="${stay_view.s_theme1 == 6}">문화</c:when>
	            	<c:when test="${stay_view.s_theme1 == 7}">맛집</c:when>
	            	<c:when test="${stay_view.s_theme1 == 8}">파티</c:when>
	            </c:choose>
	            <c:choose>
	            	<c:when test="${stay_view.s_theme2 == 2}">바다</c:when>
	            	<c:when test="${stay_view.s_theme2 == 3}">도시</c:when>
	            	<c:when test="${stay_view.s_theme2 == 4}">계곡</c:when>
	            	<c:when test="${stay_view.s_theme2 == 5}">레저</c:when>
	            	<c:when test="${stay_view.s_theme2 == 6}">문화</c:when>
	            	<c:when test="${stay_view.s_theme2 == 7}">맛집</c:when>
	            	<c:when test="${stay_view.s_theme2 == 8}">파티</c:when>
	            </c:choose>
	            <c:choose>
	            	<c:when test="${stay_view.s_theme3 == 3}">도시</c:when>
	            	<c:when test="${stay_view.s_theme3 == 4}">계곡</c:when>
	            	<c:when test="${stay_view.s_theme3 == 5}">레저</c:when>
	            	<c:when test="${stay_view.s_theme3 == 6}">문화</c:when>
	            	<c:when test="${stay_view.s_theme3 == 7}">맛집</c:when>
	            	<c:when test="${stay_view.s_theme3 == 8}">파티</c:when>
	            </c:choose>
	            <c:choose>
	            	<c:when test="${stay_view.s_theme4 == 4}">계곡</c:when>
	            	<c:when test="${stay_view.s_theme4 == 5}">레저</c:when>
	            	<c:when test="${stay_view.s_theme4 == 6}">문화</c:when>
	            	<c:when test="${stay_view.s_theme4 == 7}">맛집</c:when>
	            	<c:when test="${stay_view.s_theme4 == 8}">파티</c:when>
	            </c:choose>
	            <c:choose>
	            	<c:when test="${stay_view.s_theme5 == 5}">레저</c:when>
	            	<c:when test="${stay_view.s_theme5 == 6}">문화</c:when>
	            	<c:when test="${stay_view.s_theme5 == 7}">맛집</c:when>
	            	<c:when test="${stay_view.s_theme5 == 8}">파티</c:when>
	            </c:choose>
	            <c:choose>
	            	<c:when test="${stay_view.s_theme6 == 6}">문화</c:when>
	            	<c:when test="${stay_view.s_theme6 == 7}">맛집</c:when>
	            	<c:when test="${stay_view.s_theme6 == 8}">파티</c:when>
	            </c:choose>
	            <c:choose>
	            	<c:when test="${stay_view.s_theme7 == 7}">맛집</c:when>
	            	<c:when test="${stay_view.s_theme7 == 8}">파티</c:when>
	            </c:choose>
	            <c:choose>
	            	<c:when test="${stay_view.s_theme8 == 8}">파티</c:when>
	            </c:choose>
	        </c:forEach> 
	        
	        <c:forEach items="${stay_room_view }" var="stay_room_view">
			    <div id="stay_room_info">
				    <p>숙소 객실 정보</p>
			        <div class="image-container">
					    <img src="resources/upload_img/admin/stay/${stay_room_view.r_img1 }" alt="이미지 없음" class="image" id="firstImage" width="250px;" height="250px;">
					    <img src="resources/upload_img/admin/stay/${stay_room_view.r_img2 }" alt="이미지 없음" class="image2" id="secondImage" />
					    <img src="resources/upload_img/admin/stay/${stay_room_view.r_img3 }" alt="이미지 없음" class="image3" id="thirdImage" /><br />
				    <div class="filebox" id="firstFileBox">
				        <input type="file" name="room_file" class="real-upload" accept="image/*" multiple onchange="imagePreview(event, this) onclick="preventFormSubmission(event);">
				        <button class="button" id="deleteButton" onclick="onClickDeleteUpload();" >파일 삭제</button>
				    </div> 
				</div>
			        	
			            <p>메인 이미지</p>
			            <span>숙소 객실번호</span>
			            <input type="text" id="stay_room_name" name="stay_room_name" value="${stay_room_view.r_name }">
			            <span>인원 수</span>
			            <select name="stay_room_person">
			                <option value=" " selected>인원 수</option>
			                <option value="2" ${stay_room_view.r_person_cnt == 2 ? 'selected' : ''}>2</option>
			                <option value="3" ${stay_room_view.r_person_cnt == 3 ? 'selected' : ''}>3</option>
			                <option value="4" ${stay_room_view.r_person_cnt == 4 ? 'selected' : ''}>4</option>
			                <option value="5" ${stay_room_view.r_person_cnt == 5 ? 'selected' : ''}>5</option>
			                <option value="6" ${stay_room_view.r_person_cnt == 6 ? 'selected' : ''}>6</option>
			            </select><br>
			            <span>가격</span>
			            <input type="text" id="stay_room_price" name="stay_room_price" value="${stay_room_view.r_price }">
			            <p>객실 상세정보</p>
			            <textarea name="stay_room_detailinfo" id="stay_room_detailinfo" cols="30" rows="10">${stay_room_view.r_detail }</textarea><br>
			            <span>침대</span> <br>
			            <div class="bed">
			                <span class="bed_text">싱글 베드 침대</span>
			                   	<select name="stay_room_single_bed">
				                   	<option value="Y" ${stay_room_view.r_single_bed_flag == "Y" ? 'selected' : ''}>Y</option>
				                   	<option value="N" ${stay_room_view.r_single_bed_flag == "N" ? 'selected' : ''}>N</option>
			                   	</select>
			                    <span class="bed_text">더블 베드 침대</span>
			                    <select name="stay_room_double_bed">
			                    	<option value="Y" ${stay_room_view.r_double_bed_flag == "Y" ? 'selected' : ''}>Y</option>
				                   	<option value="N" ${stay_room_view.r_double_bed_flag == "N" ? 'selected' : ''}>N</option>
			                   	</select>
			                    <span class="bed_text">퀸 베드 침대</span>
			                    <select name="stay_room_queen_bed">
			                   		<option value="Y" ${stay_room_view.r_queen_bed_flag == "Y" ? 'selected' : ''}>Y</option>
				                   	<option value="N" ${stay_room_view.r_queen_bed_flag == "N" ? 'selected' : ''}>N</option>
			                   	</select>
			            </div> <br>
			            <span>객실 편의시설</span>
			            <div id="stay_room_facility">
			            	
						    <input type="checkbox" value="1" name="stay_room_facility"> 노트북 작업공간
						    <input type="checkbox" value="2" name="stay_room_facility"> 웰컴 드링크
						    <input type="checkbox" value="3" name="stay_room_facility"> 어매니티 <br>
						    <input type="checkbox" value="4" name="stay_room_facility"> 넷플릭스
						    <input type="checkbox" value="5" name="stay_room_facility"> 조식 포함
						    <input type="checkbox" value="6" name="stay_room_facility"> 무료 와이파이 <br /><br />
						    
						   <div class="register_text">등록된 객실 편의시설</div>  <br />
						    <c:choose>
							    <c:when test="${stay_room_view.r_facility1 == 1}"><span>노트북 작업공간</span></c:when>
							    <c:when test="${stay_room_view.r_facility1 == 2}"><span>웰컴 드링크</span></c:when>
							    <c:when test="${stay_room_view.r_facility1 == 3}"><span>어매니티</span></c:when>
							    <c:when test="${stay_room_view.r_facility1 == 4}"><span>넷플릭스</span></c:when>
							    <c:when test="${stay_room_view.r_facility1 == 5}"><span>조식 포함</span></c:when>
							    <c:when test="${stay_room_view.r_facility1 == 6}"><span>무료 와이파이</span></c:when>
							</c:choose>
							<c:choose>
							    <c:when test="${stay_room_view.r_facility2 == 2}"><span>웰컴 드링크</span></c:when>
							    <c:when test="${stay_room_view.r_facility2 == 3}"><span>어매니티</span></c:when>
							    <c:when test="${stay_room_view.r_facility2 == 4}"><span>넷플릭스</span></c:when>
							    <c:when test="${stay_room_view.r_facility2 == 5}"><span>조식 포함</span></c:when>
							    <c:when test="${stay_room_view.r_facility2 == 6}"><span>무료 와이파이</span></c:when>
							</c:choose>
							<c:choose>       
							    <c:when test="${stay_room_view.r_facility3 == 3}"><span>어매니티</span></c:when>
							    <c:when test="${stay_room_view.r_facility3 == 4}"><span>넷플릭스</span></c:when>
							    <c:when test="${stay_room_view.r_facility3 == 5}"><span>조식 포함</span></c:when>
							    <c:when test="${stay_room_view.r_facility3 == 6}"><span>무료 와이파이</span></c:when>
							</c:choose>
							<c:choose>       
							    <c:when test="${stay_room_view.r_facility4 == 4}"><span>넷플릭스</span></c:when>
							    <c:when test="${stay_room_view.r_facility4 == 5}"><span>조식 포함</span></c:when>
							    <c:when test="${stay_room_view.r_facility4 == 6}"><span>무료 와이파이</span></c:when>
							</c:choose>
							<c:choose>       
							    <c:when test="${stay_room_view.r_facility5 == 5}"><span>조식 포함</span></c:when>
							    <c:when test="${stay_room_view.r_facility5 == 6}"><span>무료 와이파이</span></c:when>
							</c:choose>
							<c:choose>       
							    <c:when test="${stay_room_view.r_facility6 == 6}"><span>무료 와이파이</span></c:when>
							</c:choose>
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