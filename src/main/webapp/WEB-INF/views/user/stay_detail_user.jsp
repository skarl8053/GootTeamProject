<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="stylesheet" href="resources/css/user/stay_detail_user.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
<script src="resources/js/user/stay_detail_use.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>

function noticefunc() { 
	$('#myModal').show();
	
	
}
</script>

<title>Document</title>
</head>
<body>
	<style>
/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 30%; /* Could be more or less, depending on screen size */
}
</style>
	<!-- The Modal -->
	<div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<p style="text-align: center;">
				<span style="font-size: 14pt;"><b><span
						style="font-size: 14pt;"><i
							class="fa-solid fa-cart-shopping" style="color: #011343;"></i></span></b></span>
			</p>
			<p style="text-align: center;">
				<span style="font-size: 10pt;"><b><span
						style="font-size: 10pt;">[선택하신 상품이 장바구니에 담겼습니다]</span></b></span>
			</p>

			<div
				style="cursor: pointer; background-color: #DDDDDD; text-align: center; padding-bottom: 10px; padding-top: 10px;"
				onClick="close_pop();">
				<span class="pop_bt" style="font-size: 13pt;"> 닫기 </span>
			</div>
		</div>

	</div>
	<!--End Modal-->
	<script type="text/javascript">
		jQuery(document).ready(function() {
			//$('#myModal').show();
		});
		//팝업 Close 기능
		function close_pop(flag) {
			$('#myModal').hide();
		};
	</script>

	<div class="total">
		<c:forEach items="${listS }" var="list1">
			<div class="top1">
				<p class="accommodationName">${list1.s_name }</p>
				<p>주소 : ${list1.s_addr }</p>
			</div>
			<div class="bo1">
				<div class="bo1_1">
					<img src="resources/upload/stay/${list1.s_img1 }" alt="img"
						class="image image1" />
				</div>
				<div class="bo2">
					<div class="bo1_2">
						<img src="resources/upload/stay/${list1.s_img2 }" alt="img"
							class="image image2" />
					</div>
					<div class="bo1_3">
						<img src="resources/upload/stay/${list1.s_img3 }" alt="img"
							class="image image3" />
					</div>
				</div>
			</div>
			<div class="links">
				<div class="aa">
					<a href="#">객실</a>
				</div>
				<div class="aa">
					<a href="stay_detail_info_user?s_no=${list1.s_no }">숙소정보</a>
				</div>
				<div class="aa">
					<a href="review_list_user?s_no=${list1.s_no }">후기</a>
				</div>
			</div>
		</c:forEach>
		<div class="bbb">
			<details >
				<summary>
					<div class="bo3">
						<div class="room1">

							<img src="resources/upload/room/${listSDR[0].r_img1 }" alt="img"
								class="image image4" />
						</div>
						<div class="room1TopR">
							<p class="accommodationName">객실명 : ${listSDR[0].r_name }</p>
							<p class="accommodationBl">
								가격: ${listSDR[0].r_price } 원 &nbsp&nbsp&nbsp&nbsp&nbsp<span>
								
								<button	class="button-24" role="button" onclick="noticefunc();">장바구니</button>
								<a href="payment?m_no=1&s_no=${listS[0].s_no }&r_no=${listSDR[0].r_no }&checkindate=2023-05-05&checkoutdate=2023-05-08"><button	class="button-24" role="button">예약하기</button></a></span>
							</p>
							<!-- 예약버튼 만들시에 보낼 파람값 -->
							<!-- <a href="http://localhost:8090/travel/user/payment?m_no=1&s_no=1&r_no=1_2_3&checkindate=2023-05-05&checkoutdate=2023-05-08"><button>예약</button></a> -->
							<!-- <a href="http://localhost:8090/travel/user/payment?m_no=1&s_no=1&r_no=1_2_3"><button>예약</button></a> -->
						</div>
					</div>
				</summary>

				<div class="fo">
					<p id="cf">객실 정보 /&nbsp&nbsp&nbsp&nbsp&nbsp ${listSDR[0].r_detail }
					</p>
					<p id="cf">최대 인원/&nbsp&nbsp&nbsp&nbsp&nbsp ${listSDR[0].r_person_cnt
						} 명</p>
					<p id="cf">침대 타입 / &nbsp&nbsp&nbsp&nbsp&nbsp싱글 :
						${listSDR[0].r_single_bed_flag } 더블 : ${listSDR[0].r_double_bed_flag } 퀸 :
						${listSDR[0].r_queen_bed_flag }</p>
					<p></p>

					<p id="cf">객실 시설</p>
					<div class="icons">
						<c:if test="${listSDR[0].r_facility1  ne 0  }">
							<img
								src="resources/img/user/roomFacility/roomFacilityIcon${listSDR[0].r_facility1 }.png"
								alt="노트북작업공간">
						</c:if>
						<c:if test="${listSDR[0].r_facility2  ne 0  }">
							<img
								src="resources/img/user/roomFacility/roomFacilityIcon${listSDR[0].r_facility2 }.png"
								alt="웰컴드링크">
						</c:if>
						<c:if test="${listSDR[0].r_facility3  ne 0  }">
							<img
								src="resources/img/user/roomFacility/roomFacilityIcon${listSDR[0].r_facility3 }.png"
								alt="어매니티">
						</c:if>
						<c:if test="${listSDR[0].r_facility4  ne 0  }">
							<img
								src="resources/img/user/roomFacility/roomFacilityIcon${listSDR[0].r_facility4 }.png"
								alt="넷플릭스">
						</c:if>
						<c:if test="${listSDR[0].r_facility5  ne 0  }">
							<img
								src="resources/img/user/roomFacility/roomFacilityIcon${listSDR[0].r_facility5 }.png"
								alt="조식포함">
						</c:if>
						<c:if test="${listSDR[0].r_facility6  ne 0  }">
							<img
								src="resources/img/user/roomFacility/roomFacilityIcon${listSDR[0].r_facility6 }.png"
								alt="무료와이파이">
						</c:if>
					</div>
				</div>
				<div class="fo11">
					<div class="slideshow-container">

						<!-- Full-width images with number and caption text -->
						<div class="mySlides fade">
							<div class="numbertext">1 / 3</div>
							<img src="resources/upload/room/${listSDR[0].r_img1 }"
								style="width: 100%">

						</div>

						<div class="mySlides fade">
							<div class="numbertext">2 / 3</div>
							<img src="resources/upload/room/${listSDR[0].r_img2 }"
								style="width: 100%">

						</div>

						<div class="mySlides fade">
							<div class="numbertext">3 / 3</div>
							<img src="resources/upload/room/${listSDR[0].r_img3 }"
								style="width: 100%">

						</div>


						<!-- Next and previous buttons -->
						<a class="prev" onclick="moveSlides(-1)">&#10094;</a> <a
							class="next" onclick="moveSlides(1)">&#10095;</a>
					</div>
					<br />

					<!-- The dots/circles -->
					<div style="text-align: center">
						<span class="dot" onclick="currentSlide(0)"></span> <span
							class="dot" onclick="currentSlide(1)"></span> <span class="dot"
							onclick="currentSlide(2)"></span>

					</div>
				</div>
			</details>
			<details>
				<summary>
					<div class="bo3">
						<div class="room1">

							<img src="resources/upload/room/${listSDR[1].r_img1 }" alt="img"
								class="image image4" />
						</div>
						<div class="room1TopR">
							<p class="accommodationName">객실명 : ${listSDR[1].r_name }</p>
							<p class="accommodationBl">
								가격: ${listSDR[1].r_price } 원 &nbsp&nbsp&nbsp&nbsp&nbsp <span>
								<a href="cartInsert?m_no=1&s_no=${listS[0].s_no }&r_no=${listSDR[1].r_no }"><button	class="button-24" role="button onclick="noticefunc();">장바구니</button></a>
									<a href="payment?m_no=1&s_no=${listS[0].s_no }&r_no=${listSDR[1].r_no }&checkindate=2023-05-05&checkoutdate=2023-05-08"><button	class="button-24" role="button">예약하기</button></a></span>
							</p>
							<!-- 예약버튼 만들시에 보낼 파람값 -->
							<!-- <a href="http://localhost:8090/travel/user/payment?m_no=1&s_no=1&r_no=1_2_3&checkindate=2023-05-05&checkoutdate=2023-05-08"><button>예약</button></a> -->
							<!-- <a href="http://localhost:8090/travel/user/payment?m_no=1&s_no=1&r_no=1_2_3"><button>예약</button></a> -->
						</div>
					</div>
				</summary>

				<div class="fo">
					<p id="cf">객실 정보 /&nbsp&nbsp&nbsp&nbsp&nbsp ${listSDR[1].r_detail }
					</p>
					<p id="cf">최대 인원/&nbsp&nbsp&nbsp&nbsp&nbsp ${listSDR[1].r_person_cnt
						} 명</p>
					<p id="cf">침대 타입 / &nbsp&nbsp&nbsp&nbsp&nbsp싱글 :
						${listSDR[1].r_single_bed_flag } 더블 : ${listSDR[1].r_double_bed_flag } 퀸 :
						${listSDR[1].r_queen_bed_flag }</p>
					<p></p>

					<p id="cf">객실 시설</p>
					<div class="icons">
						<c:if test="${listSDR[1].r_facility1  ne 0  }">
							<img
								src="resources/img/user/roomFacility/roomFacilityIcon${listSDR[1].r_facility1 }.png"
								alt="노트북작업공간">
						</c:if>
						<c:if test="${listSDR[1].r_facility2  ne 0  }">
							<img
								src="resources/img/user/roomFacility/roomFacilityIcon${listSDR[1].r_facility2 }.png"
								alt="웰컴드링크">
						</c:if>
						<c:if test="${listSDR[1].r_facility3  ne 0  }">
							<img
								src="resources/img/user/roomFacility/roomFacilityIcon${listSDR[1].r_facility3 }.png"
								alt="어매니티">
						</c:if>
						<c:if test="${listSDR[1].r_facility4  ne 0  }">
							<img
								src="resources/img/user/roomFacility/roomFacilityIcon${listSDR[1].r_facility4 }.png"
								alt="넷플릭스">
						</c:if>
						<c:if test="${listSDR[1].r_facility5  ne 0  }">
							<img
								src="resources/img/user/roomFacility/roomFacilityIcon${listSDR[1].r_facility5 }.png"
								alt="조식포함">
						</c:if>
						<c:if test="${listSDR[1].r_facility6  ne 0  }">
							<img
								src="resources/img/user/roomFacility/roomFacilityIcon${listSDR[1].r_facility6 }.png"
								alt="무료와이파이">
						</c:if>
					</div>
				</div>
				<div class="fo11">
					<div class="slideshow-container12">
						<div class="mySlides12 fade1">
							<div class="numbertext">1 / 3</div>
							<img src="resources/upload/room/${listSDR[1].r_img1 }"
								style="width: 100%">
						</div>

						<div class="mySlides12 fade1">
							<div class="numbertext">2 / 3</div>
							<img src="resources/upload/room/${listSDR[1].r_img2 }"
								style="width: 100%">
						</div>

						<div class="mySlides12 fade1">
							<div class="numbertext">3 / 3</div>
							<img src="resources/upload/room/${listSDR[1].r_img3 }"
								style="width: 100%">
						</div>




						<a class="prev1" onclick="moveSlides1(-1)">&#10094;</a> <a
							class="next1" onclick="moveSlides1(1)">&#10095;</a>
					</div>
					<br />


					<div style="text-align: center">
						<span class="dot1" onclick="currentSlide1(0)"></span> <span
							class="dot1" onclick="currentSlide1(1)"></span> <span
							class="dot1" onclick="currentSlide1(2)"></span>

					</div>


				</div>
			</details>
			<details>
				<summary>
					<div class="bo3">
						<div class="room1">

							<img src="resources/upload/room/${listSDR[2].r_img1 }" alt="img"
								class="image image4" />
						</div>
						<div class="room1TopR">
							<p class="accommodationName">객실명 : ${listSDR[2].r_name }</p>
							<p class="accommodationBl">
								가격: ${listSDR[2].r_price } 원 &nbsp&nbsp&nbsp&nbsp&nbsp <span>
								<a href="cartInsert?m_no=1&s_no=${listS[0].s_no }&r_no=${listSDR[2].r_no }"><button	class="button-24" role="button onclick="noticefunc();">장바구니</button></a>
									<a href="payment?m_no=1&s_no=${listS[0].s_no }&r_no=${listSDR[2].r_no }&checkindate=2023-05-05&checkoutdate=2023-05-08"><button	class="button-24" role="button">예약하기</button></a></span>
							</p>
							<!-- 예약버튼 만들시에 보낼 파람값 -->
							<!-- <a href="http://localhost:8090/travel/user/payment?m_no=1&s_no=1&r_no=1_2_3&checkindate=2023-05-05&checkoutdate=2023-05-08"><button>예약</button></a> -->
							<!-- <a href="http://localhost:8090/travel/user/payment?m_no=1&s_no=1&r_no=1_2_3"><button>예약</button></a> -->
						</div>
					</div>
				</summary>

				<div class="fo">
					<p id="cf">객실 정보 /&nbsp&nbsp&nbsp&nbsp&nbsp ${listSDR[2].r_detail }
					</p>
					<p id="cf">최대 인원/&nbsp&nbsp&nbsp&nbsp&nbsp ${listSDR[2].r_person_cnt
						} 명</p>
					<p id="cf">침대 타입 / &nbsp&nbsp&nbsp&nbsp&nbsp싱글 :
						${listSDR[2].r_single_bed_flag } 더블 : ${listSDR[2].r_double_bed_flag } 퀸 :
						${listSDR[2].r_queen_bed_flag }</p>
					<p></p>

					<p id="cf">객실 시설</p>
					<div class="icons">
						<c:if test="${listSDR[2].r_facility1  ne 0  }">
							<img
								src="resources/img/user/roomFacility/roomFacilityIcon${listSDR[2].r_facility1 }.png"
								alt="노트북작업공간">
						</c:if>
						<c:if test="${listSDR[2].r_facility2  ne 0  }">
							<img
								src="resources/img/user/roomFacility/roomFacilityIcon${listSDR[2].r_facility2 }.png"
								alt="웰컴드링크">
						</c:if>
						<c:if test="${listSDR[2].r_facility3  ne 0  }">
							<img
								src="resources/img/user/roomFacility/roomFacilityIcon${listSDR[2].r_facility3 }.png"
								alt="어매니티">
						</c:if>
						<c:if test="${listSDR[2].r_facility4  ne 0  }">
							<img
								src="resources/img/user/roomFacility/roomFacilityIcon${listSDR[2].r_facility4 }.png"
								alt="넷플릭스">
						</c:if>
						<c:if test="${listSDR[2].r_facility5  ne 0  }">
							<img
								src="resources/img/user/roomFacility/roomFacilityIcon${listSDR[2].r_facility5 }.png"
								alt="조식포함">
						</c:if>
						<c:if test="${listSDR[2].r_facility6  ne 0  }">
							<img
								src="resources/img/user/roomFacility/roomFacilityIcon${listSDR[2].r_facility6 }.png"
								alt="무료와이파이">
						</c:if>
					</div>
				</div>
				<div class="fo11">
					<div class="slideshow-container23">
						<div class="mySlides23 fade">
							<div class="numbertext">1 / 3</div>
							<img src="resources/upload/room/${listSDR[2].r_img1 }"
								style="width: 100%">
						</div>

						<div class="mySlides23 fade">
							<div class="numbertext">2 / 3</div>
							<img src="resources/upload/room/${listSDR[2].r_img2 }"
								style="width: 100%">
						</div>

						<div class="mySlides23 fade">
							<div class="numbertext">3 / 3</div>
							<img src="resources/upload/room/${listSDR[2].r_img3 }"
								style="width: 100%">
						</div>




						<a class="prev1" onclick="moveSlides2(-1)">&#10094;</a> <a
							class="next1" onclick="moveSlides2(1)">&#10095;</a>
					</div>
					<br />


					<div style="text-align: center">
						<span class="dot1" onclick="currentSlide2(0)"></span> <span
							class="dot1" onclick="currentSlide2(1)"></span> <span class="dot1"
							onclick="currentSlide2(2)"></span>

					</div>


				</div>
			</details>
		</div>
	</div>
</body>
</html>