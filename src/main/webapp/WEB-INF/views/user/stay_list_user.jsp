<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
<link rel="stylesheet" href="resources/css/user/stay_list_user.css">
<script src="resources/js/user/scriptjsp_user.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- 평점에 맞춰 색변화 -->
<script>
	function callrating(sNo, rate) {
		/* alert("review_rate : " + rate); */
		var starElement = document.getElementById("star2_" + sNo);
		starElement.style.width = rate * 20 + "%";
	}
</script>
</head>
<body>

		<div class="total_d">

		<div class="top_b">

			<div class="tb2">
			    <c:if test="${s_loca eq '1' }">
					<div style="float: left; font-size: 40px; width: 600px; padding: 15px;">서울</div>
				</c:if>
				<c:if test="${s_loca eq 2 }">
					<div style="float: left; font-size: 40px; width: 600px; padding: 15px;">경기</div>
				</c:if>
				<c:if test="${s_loca eq 3 }">
					<div style="float: left; font-size: 40px; width: 600px; padding: 15px;">인천</div>
				</c:if>
				<c:if test="${s_loca eq 4 }">
					<div style="float: left; font-size: 40px; width: 600px; padding: 15px;">제주</div>
				</c:if>
				<c:if test="${s_loca eq 5 }">
					<div style="float: left; font-size: 40px; width: 600px; padding: 15px;">전라</div>
				</c:if>
				<c:if test="${s_loca eq 6 }">
					<div style="float: left; font-size: 40px; width: 600px; padding: 15px;">경상</div>
				</c:if>
				<c:if test="${s_loca eq 7 }">
					<div style="float: left; font-size: 40px; width: 600px; padding: 15px;">충청</div>
				</c:if>
				<c:if test="${s_loca eq 8 }">
					<div style="float: left; font-size: 40px; width: 600px; padding: 15px;">강원</div>
				</c:if>
				<c:if test="${s_loca eq null || s_loca eq '' }">
					<div style="float: left; font-size: 40px; width: 600px; padding: 15px;">전국</div>
				</c:if>
				
				<div
					style="float: right; text-align: right; font-size: 20px; width: 600px;">
				<!-- 	<a href="/k002test0808/">홈</a>>지역>지역 -->
					
				</div>
			</div>
			
			<!-- 검색 value값 나오는 곳 --> 
			<div class="tb3">
  			상품  <span class="tbnum">${SLtotalRCont }</span>개
  					<span id='result'><span id="selectedValues"></span>
 				</span>
			</div>
		</div>

		<div class="left_b">

			<div class="lb2">

			</div>


			<!-- 아코디언 -->
			<div class="lb3">

			<section id="wrapper">
				<div class="containerAcco">
   					<ul class="accordion">
				<form class="form" action="stay_list_search_user" method="post">
      					<li class="item">
       					  <h2 class="accordionTitle">숙소종류 <span class="accIcon"></span></h2>
       						  <div class="text">
									<input type="radio" name="s_typeT1" id="hotel" value="호텔" onclick="getCheckboxValue()"> 

									<label for="hotel">호텔</label>
									<input type="radio" name="s_typeT1" id="motel" value="모텔" onclick="getCheckboxValue()"> 
									<label for="motel">모텔</label>
									<input type="radio" name="s_typeT1" id="pension" value="펜션" onclick="getCheckboxValue()">
									<label for="pension">펜션</label>
								</div>
							</li>
							<li class="item">
								<h2 class="accordionTitle">
									투숙객 평점 <span class="accIcon"></span>
								</h2>
								<div class="text">
									<input type="radio" name="starnum" id="1star" value="1star" onclick="getCheckboxValue()"> 
									<label for="1star"><i class="fa-solid fa-star" style="color: #f4d210;"></i></label> <br> 
									<input type="radio" name="starnum" id="2star" value="2star" onclick="getCheckboxValue()"> 
									<label for="2star"><i class="fa-solid fa-star" style="color: #f4d210;"></i><i class="fa-solid fa-star" style="color: #f4d210;"></i></label> <br> 
									<input type="radio" name="starnum" id="3star" value="3star" onclick="getCheckboxValue()"> 
									<label for="3star"><i class="fa-solid fa-star" style="color: #f4d210;"></i><i class="fa-solid fa-star" style="color: #f4d210;"></i>
										<i class="fa-solid fa-star" style="color: #f4d210;"></i></label> <br> 
									<input type="radio" name="starnum" id="4star" value="4star" onclick="getCheckboxValue()"> 
									<label for="4star"><i class="fa-solid fa-star" style="color: #f4d210;"></i><i class="fa-solid fa-star" style="color: #f4d210;"></i>
										<i class="fa-solid fa-star" style="color: #f4d210;"></i><i class="fa-solid fa-star" style="color: #f4d210;"></i></label> <br> 
									<input type="radio" name="starnum" id="5star" value="5star" onclick="getCheckboxValue()"> 
									<label for="5star"><i class="fa-solid fa-star" style="color: #f4d210;"></i><i class="fa-solid fa-star" style="color: #f4d210;"></i>
										<i class="fa-solid fa-star" style="color: #f4d210;"></i><i class="fa-solid fa-star" style="color: #f4d210;"></i>
										<i class="fa-solid fa-star" style="color: #f4d210;"></i></label> <br> 
								</div>
							</li>
					
							<li class="item">
								<h2 class="accordionTitle">
									숙소 시설 <span class="accIcon"></span>
								</h2>
								<div class="text">
									<input type="radio" name="accommofacil" id="pet" value="반려동물" onclick="getCheckboxValue()">
									<label for="pet">반려동물</label>
									<input type="radio" name="accommofacil" id="restaurantA" value="레스토랑" onclick="getCheckboxValue()">
									<label for="restaurantA">레스토랑</label> <br />
									<input type="radio" name="accommofacil" id="parking" value="주차시설" onclick="getCheckboxValue()">
									<label for="parking">주차시설</label> 
									<input type="radio" name="accommofacil" id="baggage" value="물품보관" onclick="getCheckboxValue()">
									<label for="baggage">물품보관</label> <br />
									<input type="radio" name="accommofacil" id="pool" value="수영장" onclick="getCheckboxValue()">
									<label for="pool">수영장</label> 
									<input type="radio" name="accommofacil" id="smoking" value="흡연구역" onclick="getCheckboxValue()">
									<label for="smoking">흡연구역</label> 
									
							
									
								</div>
							</li>
							<li class="item">
								<h2 class="accordionTitle">
									테마별 <span class="accIcon"></span>
								</h2>
								<div class="text">
									<input type="radio" name="theme" id="mountin" value="등산" onclick="getCheckboxValue()">
									<label for="mountin">등산</label> 
									<input type="radio" name="theme" id="sea" value="바다" onclick="getCheckboxValue()">
									<label for="sea">바다</label>
									<input type="radio" name="theme" id="city" value="도시" onclick="getCheckboxValue()">
									<label for="city">도시</label> <br />
									<input type="radio" name="theme" id="valley" value="계곡" onclick="getCheckboxValue()">
									<label for="valley">계곡</label> 
									<input type="radio" name="theme" id="leisure" value="레저" onclick="getCheckboxValue()">
									<label for="leisure">레저</label> 
									<input type="radio" name="theme" id="art" value="문화" onclick="getCheckboxValue()">
									<label for="art">문화</label> <br />
									<input type="radio" name="theme" id="restaurantT" value="맛집" onclick="getCheckboxValue()">
									<label for="restaurantT">맛집</label> 
									<input type="radio" name="theme" id="party" value="파티" onclick="getCheckboxValue()">
									<label for="party">파티</label> <br />
								</div>
							</li>
							<submit type="hidden" name="s_loca" value="${s_loca ne null }"></submit>
					<!-- <button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button> -->
					<button type="submit">&nbsp&nbsp&nbsp<i class="fa-solid fa-magnifying-glass"></i>&nbsp&nbsp&nbsp</button>
				</form>
						</ul>
					</div>
				</section>
				<!-- partial -->
				<script src="resources/js/user/accordion_user.js"></script>

			
			</div>

		</div>


		<div class="right_b">
			<div class="rb1"><a href="stay_list_link_user?scTop=rP&s_loca=${s_loca }&m_no=${m_no}">낮은가격순</a> | <a href="stay_list_link_user?scTop=hP&s_loca=${s_loca }&m_no=${m_no}">높은가격순</a> | <a href="stay_list_link_user?scTop=hR&s_loca=${s_loca }&m_no=${m_no}">고객평점순</a></div>


			<!-- list -->
			<c:forEach items="${listS }" var="list">
				<div class="rb2">

					<div class="rbp">
					
					<a href="stay_detail_user?s_no=${list.s_no }">
						<img src="resources/upload_img/admin/stay/${list.s_img1 }" alt="호텔대표이미지">
					</a>	
					</div>
					<div class="rbn">
						<div class="rbn_l"> 
								<c:if test="${empty checkInDate || checkInDate eq null }">
							<a href="stay_detail_user?s_no=${list.s_no }&m_no=${m_no}"></c:if> 
							 <c:if test="${not empty checkInDate }">
							<a href="stay_detail_user?s_no=${list.s_no }&m_no=${m_no}&checkInDate=${checkInDate }&checkOutDate=${checkOutDate }&personCount=${personCount }"></c:if> 
							${list.s_name }  
						    <br /><br />
                            <span class="star"> <i class="fa-solid fa-star" ></i><i class="fa-solid fa-star" ></i><i class="fa-solid fa-star" ></i><i class="fa-solid fa-star" ></i><i class="fa-solid fa-star" ></i>
                                
                                <span id="star2_${list.s_no}" style="width: ${list.s_rate * 20}%;">
                                    <i class="fa-solid fa-star" ></i><i class="fa-solid fa-star" ></i><i class="fa-solid fa-star" ></i><i class="fa-solid fa-star" ></i><i class="fa-solid fa-star" ></i></span> 
                            <input type="range"  value="${list.s_rate}" step="1" min="1" max="5" oninput="callrating('${list.s_no}', this.value);">
                             </span></a>
                             
                             
                             
                             
                             
                             
                            
                              </div>
						
						<div class="rbn_r">${list.r_price } 원~</div>
					</div>
					<div class="rb_price"></div>
						

				</div>
			</c:forEach>
		</div>

	</div>

</body>
</html>