<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/user/join_user.css" />
</head>

<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<body>
	<p class="join">회원정보 수정</p>
	<hr>
	<br>
	<form action="modifing">
		<div class="join-wrapper">
			<table class="member">
				<tr>
					<td><label>이메일</label></td>
					<td><input type="email" class="enter" name="m_email" value="${m_email }"
						id="disabled_email" disabled /></td>
				</tr>
				<tr>
					<td><label>비밀번호</label></td>
					<td><input type="password" class="enter" name="m_pw" id="m_pw"
						placeholder="비밀번호를 입력해주세요." required /> &nbsp; <span
						id="StrengthDisp" class="badge displayBadge my-3"></span></td>
				</tr>
				<tr>
					<td><label>비밀번호확인</label></td>
					<td><input type="password" class="enter" name="m_pw2"
						id="m_pw2" placeholder="비밀번호를 한번 더 입력해주세요." required /></td>
				</tr>
				<tr>
					<td><label>이름</label></td> 
					<td><input type="text" class="enter" name="m_name" value="${m_name }"
						id="disabled_name" disabled /></td>
				</tr>
				<tr>
					<td><label>휴대폰</label></td>
					<td><input type="text" oninput="inputNumberOnly(this)" class="enter" name="m_tel" maxlength="11" value="${m_tel }"
						placeholder="숫자만 입력해주세요." required /></td>
				</tr>
				<tr>
					<td><label>주소</label></td>
					<td><input type="text" class="enter" id="sample4_roadAddress"
						name="m_roadAddress" placeholder="도로명주소"></td>
					<td><input type="button" class="certi"
						onclick="sample4_execDaumPostcode()" value="주소찾기"></td>
				</tr>
				<tr>
					<td><label></label></td>
					<td><input type="text" class="add_enter" id="sample4_postcode"
						placeholder="우편번호"> <input type="text" class="add_enter"
						id="sample4_jibunAddress" placeholder="지번주소"></td>
					<span id="guide" style="color: #999; display: none"></span>
				</tr>
				<tr>
					<td><label></label></td>
					<td><input type="text" class="add_enter"
						name="m_detailAddress" id="sample4_detailAddress"
						placeholder="상세주소"> <input type="text" class="add_enter"
						id="sample4_extraAddress" placeholder="참고항목"></td>
				</tr>
			</table>
		</div>
		<br>
		<br>
		<hr>
		<br>
		<div class="select-wrapper">
			<table class="select">
				<tr>
					<td><label class="tema" id="tema">테마</label></td>
					<td><button type="button" class="${m_theme1==1 || m_theme2==1 || m_theme3==1 ? 'btn1 clicked_btn1' : 'btn1' }" 
								name="tema_1" value="1">#등산</button>
						<button type="button" class="${m_theme1==2 || m_theme2==2 || m_theme3==2 ? 'btn1 clicked_btn1' : 'btn1' }" 
								name="tema_2" value="2">#바다</button>
						<button type="button" class="${m_theme1==3 || m_theme2==3 || m_theme3==3 ? 'btn1 clicked_btn1' : 'btn1' }" 
								name="tema_3" value="3">#도시</button>
						<button type="button" class="${m_theme1==4 || m_theme2==4 || m_theme3==4 ? 'btn1 clicked_btn1' : 'btn1' }" 
								name="tema_4" value="4">#계곡</button></td>
				</tr>
				<tr>
					<td><label></label></td>
					<td><button type="button" class="${m_theme1==5 || m_theme2==5 || m_theme3==5 ? 'btn1 clicked_btn1' : 'btn1' }" 
								name="tema_5" value="5">#레저</button>
						<button type="button" class="${m_theme1==6 || m_theme2==6 || m_theme3==6 ? 'btn1 clicked_btn1' : 'btn1' }" 
								name="tema_6" value="6">#문화</button>
						<button type="button" class="${m_theme1==7 || m_theme2==7 || m_theme3==7 ? 'btn1 clicked_btn1' : 'btn1' }" 
								name="tema_7" value="7">#맛집</button>
						<button type="button" class="${m_theme1==8 || m_theme2==8 || m_theme3==8 ? 'btn1 clicked_btn1' : 'btn1' }" 
								name="tema_8" value="8">#파티</button></td>
				</tr>
				<tr>
					<td><label class="tema" id="area">선호지역</label></td>
					<td><button type="button" class="${m_area1==1 || m_area2==1 || m_area3==1 ? 'btn2 clicked_btn2' : 'btn2' }" 
								name="area_1" value="1">#서울</button>
						<button type="button" class="${m_area1==2 || m_area2==2 || m_area3==2 ? 'btn2 clicked_btn2' : 'btn2' }" 
								name="area_2" value="2">#경기</button>
						<button type="button" class="${m_area1==3 || m_area2==3 || m_area3==3 ? 'btn2 clicked_btn2' : 'btn2' }" 
								name="area_3" value="3">#인천</button>
						<button type="button" class="${m_area1==4 || m_area2==4 || m_area3==4 ? 'btn2 clicked_btn2' : 'btn2' }" 
								name="area_4" value="4">#충청</button></td>
				</tr>
				<tr>
					<td><label></label></td>
					<td><button type="button" class="${m_area1==5 || m_area2==5 || m_area3==5 ? 'btn2 clicked_btn2' : 'btn2' }" 
								name="area_5" value="5">#강원</button>
						<button type="button" class="${m_area1==6 || m_area2==6 || m_area3==6 ? 'btn2 clicked_btn2' : 'btn2' }" 
								name="area_6" value="6">#경상</button>
						<button type="button" class="${m_area1==7 || m_area2==7 || m_area3==7 ? 'btn2 clicked_btn2' : 'btn2' }" 
								name="area_7" value="7">#전라</button>
						<button type="button" class="${m_area1==8 || m_area2==8 || m_area3==8 ? 'btn2 clicked_btn2' : 'btn2' }" 
								name="area_8" value="8">#제주</button></td>
				</tr>
				<tr>
					<td><label></label></td>
				</tr>


				<tr>
					<td colspan="2"><span class="tema_area">※ 테마 및 선호지역은 각각
							<b>최대 3개</b>까지 선택하실 수 있습니다.
					</span></td>
				</tr>

			</table>
		</div>
		<br />
		<br />
		<hr>
		<br />
		<table class="agree">
			<tr>
				<td id="agree_label"><label>이용약관동의</label></td>
				<td>
					<li class="terms__box">
						<div class="input__check">
							<input type="checkbox" name="agreement" id="allowPromotions" ${m_marketing == 'Y' ? 'checked' : ''}
								class="chk" value="1" /> <label for="allowPromotions"
								id="label_font">이벤트 정보 수신 동의 <b>(선택)</b></label>
						</div>
				</li>
				</td>
			</tr>

		</table>
		<br />
		<hr>
		<br />
		<br />

		<div class="join_cancel">
			<button type="submit" value="정보 수정" class="modify_button"
				id="modify_button">정보 수정</button>
			<a href="${pageContext.request.contextPath }/main" id="cancel_button">취소</a>
		</div>
		<br>
		<br>
	</form>
</body>

	
	<script>

	// 비밀번호 정규식

	let timeout;
	let password = document.getElementById('m_pw')
	let strengthBadge = document.getElementById('StrengthDisp')
	let strongPassword = new RegExp('(?=.*[a-z])(?=.*[0-9])(?=.*[^A-Za-z0-9])(?=.{8,})')

	function StrengthChecker(PasswordParameter) {
	  if (strongPassword.test(PasswordParameter)) {
	    strengthBadge.style.color = "green"
	    strengthBadge.textContent = '올바른 형식입니다.'
	  } else{
	    strengthBadge.style.color = "red"
	    strengthBadge.textContent = '영문 소문자, 숫자, 특수문자 1개 이상 포함 8자 이상 '
	  }
	}

	password.addEventListener("input", () => {
	  strengthBadge.style.display = 'block'

	  clearTimeout(timeout);

	  timeout = setTimeout(() => StrengthChecker(password.value), 100);

	  if (password.value.length !== 0) {
	    strengthBadge.style.display != 'block'
	  } else {
	    strengthBadge.style.display = 'none'
	  }
	});

	//비밀번호 일치 여부

	function test() {
	    var p1 = document.getElementById('m_pw').value;
	    var p2 = document.getElementById('m_pw2').value;
	     
	        if( p1 != p2 ) {
	          alert("비밀번호 불일치");
	          return false;
	        } else{
	          return true;
	        }
	  }
	
	// 전화번호 숫자만 입력
	function inputNumberOnly(el) {
	    el.value = el.value.replace(/[^0-9]/g, '');
	  }
	

	// 테마 및 지역 선택

	$(document).ready(
			function() {
				var count1 = 0;
				var count2 = 0;
				$('.btn1').each(function(index) {
					$(this).attr('btn1-index', index);
				}).click(
						function() {
							var index = $(this).attr('btn1-index');
							$('.btn1[btn1-index=' + index + ']').toggleClass(
									'clicked_btn1');
							count1++;
							if (count1 > 3) {
								alert('테마 및 선호 지역은 각각 최대 3개까지만 선택이 가능합니다.');
								$('.btn1[bt1-index!=' + index + ']')
										.toggleClass('clicked_btn1');
								$('.btn1[bt1-index!=' + (index + 1) + ']')
										.toggleClass('clicked_btn1');
								$('.btn1[bt1-index!=' + index + ']')
										.removeClass('clicked_btn1');
								count1 = 0;
							}
						});
				$('.btn2').each(function(index) {
					$(this).attr('btn2-index', index);
				}).click(
						function() {
							var index = $(this).attr('btn2-index');
							$('.btn2[btn2-index=' + index + ']').toggleClass(
									'clicked_btn2');
							count2++;
							if (count2 > 3) {
								alert('테마 및 선호 지역은 각각 최대 3개까지만 선택이 가능합니다.');
								$('.btn2[bt2-index!=' + index + ']')
										.toggleClass('clicked_btn2');
								$('.btn2[bt2-index!=' + (index + 1) + ']')
										.toggleClass('clicked_btn2');
								$('.btn2[bt2-index!=' + index + ']')
										.removeClass('clicked_btn2');
								count2 = 0;
							}
						});
			});
	
	
	// 주소 찾기

	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample4_execDaumPostcode() {
	  new daum.Postcode({
	    oncomplete: function (data) {
	      // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	      // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	      // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	      var roadAddr = data.roadAddress; // 도로명 주소 변수
	      var extraRoadAddr = ""; // 참고 항목 변수

	      // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	      // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	      if (data.bname !== "" && /[동|로|가]$/g.test(data.bname)) {
	        extraRoadAddr += data.bname;
	      }
	      // 건물명이 있고, 공동주택일 경우 추가한다.
	      if (data.buildingName !== "" && data.apartment === "Y") {
	        extraRoadAddr +=
	          extraRoadAddr !== "" ? ", " + data.buildingName : data.buildingName;
	      }
	      // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	      if (extraRoadAddr !== "") {
	        extraRoadAddr = " (" + extraRoadAddr + ")";
	      }

	      // 우편번호와 주소 정보를 해당 필드에 넣는다.
	      document.getElementById("sample4_postcode").value = data.zonecode;
	      document.getElementById("sample4_roadAddress").value = roadAddr;
	      document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

	      // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
	      if (roadAddr !== "") {
	        document.getElementById("sample4_extraAddress").value = extraRoadAddr;
	      } else {
	        document.getElementById("sample4_extraAddress").value = "";
	      }

	      var guideTextBox = document.getElementById("guide");
	      // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	      if (data.autoRoadAddress) {
	        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	        guideTextBox.innerHTML = "(예상 도로명 주소 : " + expRoadAddr + ")";
	        guideTextBox.style.display = "block";
	      } else if (data.autoJibunAddress) {
	        var expJibunAddr = data.autoJibunAddress;
	        guideTextBox.innerHTML = "(예상 지번 주소 : " + expJibunAddr + ")";
	        guideTextBox.style.display = "block";
	      } else {
	        guideTextBox.innerHTML = "";
	        guideTextBox.style.display = "none";
	      }
	    },
	  }).open();
	}
	</script>

</html>