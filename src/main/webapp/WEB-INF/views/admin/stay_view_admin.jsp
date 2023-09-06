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
    
</head>
<body>
<c:forEach items="${stay_view }" var="stay_view">
		<p>숙소 상세보기</p>
	    <hr>
	    <p>숙소 공통 정보</p>
	    <select class="location" name="location" onFocus='this.initialSelect = this.selectedIndex;'
			onChange='this.selectedIndex = this.initialSelect;'>
	        <option value=" " selected>지역 선택</option>
            <option value="1" ${stay_view.s_loca == 1 ? 'selected' : ''}>서울</option>
            <option value="2" ${stay_view.s_loca == 2 ? 'selected' : ''}>경기</option>
            <option value="3" ${stay_view.s_loca == 3 ? 'selected' : ''}>인천</option>
            <option value="4" ${stay_view.s_loca == 4? 'selected' : ''}>제주</option>
            <option value="5" ${stay_view.s_loca == 5 ? 'selected' : ''}>전라</option>
            <option value="6" ${stay_view.s_loca == 6 ? 'selected' : ''}>경상</option>
            <option value="7" ${stay_view.s_loca == 7 ? 'selected' : ''}>충청</option>
            <option value="8" ${stay_view.s_loca == 8? 'selected' : ''}>강원</option>
	    </select>
	    
	    <select class="category" name="category" onFocus='this.initialSelect = this.selectedIndex;'
			onChange='this.selectedIndex = this.initialSelect;'>
	        <option value=" " selected>카테고리</option>
	        <option value="1" ${stay_view.s_type == 1 ? 'selected' : ''}>호텔</option>
	        <option value="2" ${stay_view.s_type == 2 ? 'selected' : ''}>모텔</option>
	        <option value="3" ${stay_view.s_type == 3 ? 'selected' : ''}>펜션</option>
	    </select> <br>
	    
	    <div id="textfield">
		    <span id="title">제목</span>
		    <input type="text" name="stay_title" class="title" value="${stay_view.s_name }" readonly>
		    
	    </div>
	    <p>숙소 공통 사진</p>
	        <div class="image-container">
			    <%-- <img src="/Users/sjh/Downloads/TeamProject/GootTeamProject0831/GootTeamProject/src/main/webapp/resources/upload_img/admin/stay"${stay_view.s_img1 } alt="이미지 없음" class="image" id="firstImage" />${stay_view.s_img1 } --%>
			    <img src="resources/upload_img/admin/stay/${stay_view.s_img1 }" alt="이미지 없음" class="image" id="firstImage">
			    <img src="resources/upload_img/admin/stay/${stay_view.s_img2 }" alt="이미지 없음" class="image2" id="secondImage" />
			    <img src="resources/upload_img/admin/stay/${stay_view.s_img3 }" alt="이미지 없음" class="image3" id="thirdImage" /><br />
			    <div class="filebox" id="firstFileBox">
			    </div>
			</div><br />
	    	
	    	<span>주소</span>
	        <input type="text" id="address" name="address" placeholder="" value="${stay_view.s_addr }" readonly/>
	    	
	        <div class="xy">
		        <span>위도</span>
		        <input type="text" name="addr_x" id="addr_x" value="${stay_view.s_addr_x }" readonly>
		        <span>경도</span>
		        <input type="text" name="addr_y" id="addr_y" value="${stay_view.s_addr_y }" readonly>
	        </div>
	        <!-- <p>숙소 편의시설</p>
	            <div id="stay_facility">
	                <input type="checkbox" name="stay_facility" value="1" onclick="return false;"> 1. 반려동물
	                <input type="checkbox" name="stay_facility" value="2" onclick="return false;"> 2. 레스토랑
	                <input type="checkbox" name="stay_facility" value="3" onclick="return false;"> 3. 주차시설 <br>
	                <input type="checkbox" name="stay_facility" value="4" onclick="return false;"> 4. 물품보관
	                <input type="checkbox" name="stay_facility" value="5" onclick="return false;"> 5. 수영장
	                <input type="checkbox" name="stay_facility" value="6" onclick="return false;"> 6. 흡연구역 <br /><br /> -->
	                
	                <p>등록된 숙소 편의시설</p> 
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
	            
	            
	        <p>숙소 정보 및 정책</p>
	        <textarea name="stay_info" id="" cols="40" rows="10" readonly>${stay_view.s_info }</textarea>
	        	
	        <!-- <p>해시태그</p>
	        <div id="hashtag">
	            <input type="checkbox" value="1" name="stay_hashtag"  onclick="return false;"> 1. 등산
	            <input type="checkbox" value="2" name="stay_hashtag" onclick="return false;"> 2. 바다
	            <input type="checkbox" value="3" name="stay_hashtag" onclick="return false;"> 3. 도시
	            <input type="checkbox" value="4" name="stay_hashtag" onclick="return false;"> 4. 계곡 <br>
	            <input type="checkbox" value="5" name="stay_hashtag" onclick="return false;"> 5. 레저
	            <input type="checkbox" value="6" name="stay_hashtag" onclick="return false;"> 6. 문화
	            <input type="checkbox" value="7" name="stay_hashtag" onclick="return false;"> 7. 맛집
	            <input type="checkbox" value="8" name="stay_hashtag" onclick="return false;"> 8. 파티 <br /> <br /> -->
	            
	            <p>등록된 해시태그</p>
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
				       
				    </div> 
				</div>
			        	
			            <p>메인 이미지</p>
			            <span>숙소 객실번호</span>
			            <input type="text" id="stay_room_no" name="stay_room_no" value="${stay_room_view.r_name }" readonly>
			            
			            <span>인원 수 : </span> ${stay_room_view.r_person_cnt == 2 ? '2' : ''} <br />
			            <span>가격</span>
			            <input type="text" id="stay_room_price" name="stay_room_price" value="${stay_room_view.r_price }" readonly>
			            <p>객실 상세정보</p>
			            <textarea name="stay_room_detailinfo" id="stay_room_detailinfo" cols="30" rows="10" readonly>${stay_room_view.r_detail }</textarea><br>
			            <span>침대</span> <br>
			            <div class="bed">
			                <span class="bed_text">싱글 베드 침대</span>
			                   	<select name="stay_room_single_bed" onFocus='this.initialSelect = this.selectedIndex;'
									onChange='this.selectedIndex = this.initialSelect;'>
				                   	<option value="Y" ${stay_room_view.r_single_bed_flag == "Y" ? 'selected' : ''}>Y</option>
				                   	<option value="N" ${stay_room_view.r_single_bed_flag == "N" ? 'selected' : ''}>N</option>
			                   	</select>
			                    <span class="bed_text">더블 베드 침대</span>
			                    <select name="stay_room_double_bed" onFocus='this.initialSelect = this.selectedIndex;'
									onChange='this.selectedIndex = this.initialSelect;'>
			                    	<option value="Y" ${stay_room_view.r_double_bed_flag == "Y" ? 'selected' : ''}>Y</option>
				                   	<option value="N" ${stay_room_view.r_double_bed_flag == "N" ? 'selected' : ''}>N</option>
			                   	</select>
			                    <span class="bed_text">퀸 베드 침대</span>
			                    <select name="stay_room_queen_bed"	onFocus='this.initialSelect = this.selectedIndex;'
									onChange='this.selectedIndex = this.initialSelect;'>
			                   		<option value="Y" ${stay_room_view.r_queen_bed_flag == "Y" ? 'selected' : ''}>Y</option>
				                   	<option value="N" ${stay_room_view.r_queen_bed_flag == "N" ? 'selected' : ''}>N</option>
			                   	</select>
			            </div> <br>
			            <!-- <span>객실 편의시설</span>
			            <div id="stay_room_facility">
						    <input type="checkbox" value="1" name="stay_room_facility" onclick="return false;"> 노트북 작업공간
						    <input type="checkbox" value="2" name="stay_room_facility" onclick="return false;"> 웰컴 드링크
						    <input type="checkbox" value="3" name="stay_room_facility" onclick="return false;" > 어매니티 <br>
						    <input type="checkbox" value="4" name="stay_room_facility" onclick="return false;" > 넷플릭스
						    <input type="checkbox" value="5" name="stay_room_facility" onclick="return false;" > 조식 포함
						    <input type="checkbox" value="6" name="stay_room_facility" onclick="return false;" > 무료 와이파이 <br /><br /> -->
						    
						    <p>등록된 객실 편의시설<p> <br />
						    <c:choose>
							    <c:when test="${stay_room_view.r_facility1 == 1}">노트북 작업공간</c:when>
							    <c:when test="${stay_room_view.r_facility1 == 2}">웰컴 드링크</c:when>
							    <c:when test="${stay_room_view.r_facility1 == 3}">어매니티</c:when>
							    <c:when test="${stay_room_view.r_facility1 == 4}">넷플릭스</c:when>
							    <c:when test="${stay_room_view.r_facility1 == 5}">조식 포함</c:when>
							    <c:when test="${stay_room_view.r_facility1 == 6}">무료 와이파이</c:when>
							</c:choose>
							<c:choose>
							    <c:when test="${stay_room_view.r_facility2 == 2}">웰컴 드링크</c:when>
							    <c:when test="${stay_room_view.r_facility2 == 3}">어매니티</c:when>
							    <c:when test="${stay_room_view.r_facility2 == 4}">넷플릭스</c:when>
							    <c:when test="${stay_room_view.r_facility2 == 5}">조식 포함</c:when>
							    <c:when test="${stay_room_view.r_facility2 == 6}">무료 와이파이</c:when>
							</c:choose>
							<c:choose>       
							    <c:when test="${stay_room_view.r_facility3 == 3}">어매니티</c:when>
							    <c:when test="${stay_room_view.r_facility3 == 4}">넷플릭스</c:when>
							    <c:when test="${stay_room_view.r_facility3 == 5}">조식 포함</c:when>
							    <c:when test="${stay_room_view.r_facility3 == 6}">무료 와이파이</c:when>
							</c:choose>
							<c:choose>       
							    <c:when test="${stay_room_view.r_facility4 == 4}">넷플릭스</c:when>
							    <c:when test="${stay_room_view.r_facility4 == 5}">조식 포함</c:when>
							    <c:when test="${stay_room_view.r_facility4 == 6}">무료 와이파이</c:when>
							</c:choose>
							<c:choose>       
							    <c:when test="${stay_room_view.r_facility5 == 5}">조식 포함</c:when>
							    <c:when test="${stay_room_view.r_facility5 == 6}">무료 와이파이</c:when>
							</c:choose>
							<c:choose>       
							    <c:when test="${stay_room_view.r_facility6 == 6}">무료 와이파이</c:when>
							</c:choose> <br />
						</div>
	    </c:forEach>
	      	<br />
	        <input type="submit" class="btn" value="수정하기">
	        <input type="button" class="btn" value="취소" onclick="goToListPage()">
	        
	        <script>
		        function goToListPage() {
		            window.location.href = '/travel/admin/stay_list';
		        }
	        </script>
	
</body>
</html>