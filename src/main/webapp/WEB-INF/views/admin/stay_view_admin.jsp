<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>숙소 등록</title>
    <%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/stay_insert_admin.css"/> --%>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- 개별 화면 content 크기를 조절하는 방법 -->
    <style>
       #content{
        	height: 100%;
        } 
    </style>
    
    <style>
    	/* 

	신재환
	
	- 숙소 등록, 객실 등록, 숙소 상세보기
	
 */

/* 화면 디자인 */
@font-face {
	font-family: 'GmarketSansMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

#form{
	width: 1200px;
}
/* 스타일링을 위한 기본 스타일 */
select {
    padding: 5px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
    outline: none;
}

/* 선택된 옵션 스타일 */
select:focus {
    border-color: #007BFF;
    box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
}

/* 옵션 스타일 */
option {
    font-size: 14px;
}

/* 선택된 옵션 스타일 */
option:checked {
    background-color: #007BFF;
    color: #fff;
}
* {
	font-family: 'GmarketSansMedium';
	/* align-items: center; */
}

p {
	font-size: 20px;
    text-align: left;
	color: rgb(1, 19, 67);
    margin-bottom: 10px;
}

#title {
    margin-right: 10px;
    font-size: 20px;
}

span {
	font-size: 20px;
}

input[type="text"], textarea {
    font-size: 16px;
    margin-right: 10px;
}

input[type="file"] {
    margin-bottom: 10px;
}

textarea{
	resize: none;
}

#stay_room_price {
	margin-top: 10px;
}

#hashtag, #stay_facility {
	margin-bottom: 10px;
    padding-left: 5px;
    padding-right: 5px;
}

#hashtag {
	margin-top : 10px;
}

.btn {
	margin-top: 10px;
	background-color: rgb(1, 19, 67);
	color: rgb(235, 208, 28);
	font-size: 14px;
	cursor: pointer;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
}

.location, .category {
	width: 200px;
    margin-bottom: 10px;
	font-size : 16px;
}

.title {
	margin-top: 10px;
	width: 300px;
}

.xy {
	margin-top: 10px;
}

.bed {
	display: inline-flex;
}

#stayinfo, #staypolicy, #detailroominfo {
	text-align: center;
	margin: 20px auto; /* 수평 가운데 정렬 */
}

#stay_room_facility {
	margin-bottom: 5px;
}

#stayinfotext {
	display: flexbox;
}

#searchButton {
	background-color: rgb(1, 19, 67);
	color: rgb(235, 208, 28);
	cursor: pointer;
	padding: 5px 10px;
	border: none;
	border-radius: 5px;
}

#firstImage, #secondImage, #thirdImage {
	width: 250px;
	height: 250px;
}

/* 팝업창 디자인 */
.popup-overlay {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	z-index: 9999;
}

.popup-content {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 400px;
	height: 800px;
	transform: translate(-50%, -50%);
	background-color: white;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
	overflow: hidden;
}
#popup-iframe {
	width: 100%;
	height: 100%;
	border: none;
}
p {
	font-size : 20px;	
}
#stay_room_info {
	margin-top: 20px;
	align-items: center;
	margin: 60px 0; /* 수평 가운데 정렬 */
	border: 1px solid grey;
/* 	border-radius: 30px; */
	padding: 20px 20px;
	width: 800px;
}
.bed_text {
	margin-right: 5px;
}
#address {
	margin-left: 5px;
}
#addr_x, #addr_y {
	width : 200px;
	margin-left: 5px;
}
#room_img_table img{
	width: 260px;
	height: 250px;
}
#border-facility{
	width: 180px;
	height: 40px;
	background-color: #011343;
	color: #EBD01C;
	font-size: 20px;
	margin: 5px 10px;
	border-radius: 15px;
}
    </style>
    
</head>
<body>

	<h1>숙소 상세보기</h1>

	<div id="form">
			<c:forEach items="${stay_view }" var="stay_view">
			
			    <hr>
			    <p>숙소 공통 정보</p>
			    <select class="location" name="location" onFocus='this.initialSelect = this.selectedIndex;'
					onChange='this.selectedIndex = this.initialSelect;' disabled >
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
					onChange='this.selectedIndex = this.initialSelect;' disabled>
			        <option value=" " selected>카테고리</option>
			        <option value="1" ${stay_view.s_type == 1 ? 'selected' : ''}>호텔</option>
			        <option value="2" ${stay_view.s_type == 2 ? 'selected' : ''}>모텔</option>
			        <option value="3" ${stay_view.s_type == 3 ? 'selected' : ''}>펜션</option>
			    </select> <br><br />
			    
			    <div id="textfield">
				    <span id="title">숙소 이름</span>
				    <input type="text" name="stay_title" class="title" value="${stay_view.s_name }" readonly>
			    </div>
			    <br />
			    
			    <p>숙소 공통 사진</p>
			    
		        <div class="image-container">
					    	<tr>
					            <td>
					                <img src="resources/upload_img/admin/stay/${stay_view.s_img1 }" alt="이미지 없음" class="image" id="firstImage" />
					            </td>
					            <td>
					                <img src="resources/upload_img/admin/stay/${stay_view.s_img2 }" alt="이미지 없음" class="image2" id="secondImage" />
					            </td>
					            <td>
					                <img src="resources/upload_img/admin/stay/${stay_view.s_img3 }" alt="이미지 없음" class="image3" id="thirdImage" />
					            </td>
					        </tr>
				</div><br /><br />
		    	
		    	<span>주소</span>
		        <input type="text" id="address" name="address" placeholder="" value="${stay_view.s_addr }" style="width: 800px;" readonly/>
		    	
		        <div class="xy">
			        <span>위도</span>
			        <input type="text" name="addr_x" id="addr_x" value="${stay_view.s_addr_x }" readonly>
		        </div>
		        <div class="xy">
			        <span>경도</span>
			        <input type="text" name="addr_y" id="addr_y" value="${stay_view.s_addr_y }" readonly>
		        </div>
		        
		        <br />
		       
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
	                </c:choose> <br>
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
		        <textarea name="stay_info" id="" cols="40" rows="10" readonly>${stay_view.s_info }</textarea>
		        <br /><br />	
		        
		            <p>등록된 해시태그</p>
		            
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
		        
		        <br /><br /><br /><br /><br /><br />
		       
		       <c:if test="${not empty stay_room_view }">
		       
			        <h1>객실 상세보기</h1>
			         <hr />
			         
			        <c:forEach items="${stay_room_view }" var="stay_room_view">
					    <div id="stay_room_info">
						    <h2>숙소 객실 정보</h2>
						    <br />
						    <p>메인 이미지</p>
					        <div class="image-container">
					        	<table id="room_img_table">
							    	<tr>
							            <td>
							                <img src="resources/upload_img/admin/room/${stay_room_view.r_img1 }" alt="이미지 없음" class="image" id="firstImage" />
							            </td>
							            <td>
							                <img src="resources/upload_img/admin/room/${stay_room_view.r_img2 }" alt="이미지 없음" class="image2" id="secondImage" />
							            </td>
							            <td>
							                <img src="resources/upload_img/admin/room/${stay_room_view.r_img3 }" alt="이미지 없음" class="image3" id="thirdImage" />
							            </td>
							        </tr>
					        	</table>
							    <br />
						    <div class="filebox" id="firstFileBox">
						       
						    </div>
						</div>
					        	<table>
					        		<tr>
					        			<td style="width: 200px"><span>객실 이름</span></td>
					        			<td><span>${stay_room_view.r_name }</span></td>
					        		</tr>
					        		<tr>
					        			<td style="width: 200px"><span>인원 수</span></td>
					        			<td><span>${stay_room_view.r_person_cnt}</span></td>
					        		</tr>
					        		<tr>
					        			<td style="width: 200px" ><span>가격</span></td>
					        			<td><span>${stay_room_view.r_price }원</span></td>
					        		</tr>
					        	</table>
					        
					            <p>객실 상세정보</p>
					            <textarea name="stay_room_detailinfo" id="stay_room_detailinfo" cols="76" rows="10" readonly>${stay_room_view.r_detail }</textarea><br>
					            
					            <br />
					            <span>침대</span> <br />
					            <div class="bed">
					                <span class="bed_text">싱글 베드</span>
					                   	<select name="stay_room_single_bed" onFocus='this.initialSelect = this.selectedIndex;'
											onChange='this.selectedIndex = this.initialSelect;'>
						                   	<option value="Y" ${stay_room_view.r_single_bed_flag == "Y" ? 'selected' : ''}>Y</option>
						                   	<option value="N" ${stay_room_view.r_single_bed_flag == "N" ? 'selected' : ''}>N</option>
					                   	</select> &nbsp; &nbsp;&nbsp;
					                   	<br />
					                    <span class="bed_text">더블 베드</span>
					                    <select name="stay_room_double_bed" onFocus='this.initialSelect = this.selectedIndex;'
											onChange='this.selectedIndex = this.initialSelect;'>
					                    	<option value="Y" ${stay_room_view.r_double_bed_flag == "Y" ? 'selected' : ''}>Y</option>
						                   	<option value="N" ${stay_room_view.r_double_bed_flag == "N" ? 'selected' : ''}>N</option>
					                   	</select> &nbsp; &nbsp;&nbsp;
					                   	<br />
					                    <span class="bed_text">퀸 베드</span>
					                    <select name="stay_room_queen_bed"	onFocus='this.initialSelect = this.selectedIndex;'
											onChange='this.selectedIndex = this.initialSelect;'>
					                   		<option value="Y" ${stay_room_view.r_queen_bed_flag == "Y" ? 'selected' : ''}>Y</option>
						                   	<option value="N" ${stay_room_view.r_queen_bed_flag == "N" ? 'selected' : ''}>N</option>
					                   	</select> &nbsp; &nbsp;&nbsp;
					            </div> <br><br />
					           
								    <p>등록된 객실 편의시설<p> <br />
								    
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
			    </c:forEach>
		    </c:if>
	</div>

      <button type="button" class="btn" onclick="goToListPage()">돌아가기</button>
	        
	        <script>
		        function goToListPage() {
		            window.location.href = '/travel/admin/stay_list';
		        }
	        </script>
	
</body>
</html>