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
<body id="body">
	<p class="join">회원정보 수정</p>
	<hr>
	<br>
	<form action="modifing" onsubmit="return insertBeforeCheck();">
		<input type="hidden" name="modify_tema" id="modify_tema" value=""/>
		<input type="hidden" name="modify_area" id="modify_area" value=""/>
		
		<div class="join-wrapper">
			<table class="member">
				<tr>
					<td><label>이메일</label></td>
					<td><input type="email" class="enter" name="m_email" value="${m_email }"
						id="disabled_email" disabled /></td>
				</tr>
				<tr>
					<td><label>비밀번호</label></td>
					<td><input type="password" class="enter" name="m_pw" id="m_pw" autocomplete="off"
						placeholder="비밀번호를 입력해주세요." required /> &nbsp; <span
						id="StrengthDisp" class="badge displayBadge my-3"></span></td>
				</tr>
				<tr>
					<td><label>비밀번호확인</label></td>
					<td><input type="password" class="enter" name="m_pw2"  autocomplete="off"
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
						 required /></td>
				</tr>
				<tr>
					<td><label>주소</label></td>
					<td><input type="text" class="enter" id="m_roadAddress"
						name="m_roadAddress" value="${m_roadAddress }" readonly></td>
					<td><input type="button" class="certi" 
						onclick="execDaumPostcode()" value="주소찾기"></td>
				</tr>
				<tr>
					<td><label></label></td>
					<td><input type="text" class="add_enter"
						name="m_detailAddress" id="m_detailAddress" value="${m_detailAddress }"
						placeholder="상세주소"></td>
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
								class="chk" value="${m_marketing }" /> <label for="allowPromotions"
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
	
	// 주소 찾기

	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function execDaumPostcode() {
	new daum.Postcode({
			oncomplete: function (data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
			// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var roadAddr = data.roadAddress; // 도로명 주소 변수
			document.getElementById("m_roadAddress").value = roadAddr;
		},
	}).open();
	}
	
	
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


	
	// 전화번호 숫자만 입력
	function inputNumberOnly(el) {
	    el.value = el.value.replace(/[^0-9]/g, '');
	  }
	

	var themeArr = null;
	var locationArr = null;
	
	var m_theme1Value = ${m_theme1}; // JSP 변수 값을 JavaScript 변수에 할당
	var m_theme2Value = ${m_theme2};
	var m_theme3Value = ${m_theme3};
	var m_area1Value = ${m_area1}; // JSP 변수 값을 JavaScript 변수에 할당
	var m_area2Value = ${m_area2};
	var m_area3Value = ${m_area3};
	
	if (themeArr === null) {
	    themeArr = []; // themeArr이 아직 초기화되지 않은 경우 빈 배열로 초기화
	}
	if (locationArr === null) {
	    locationArr = []; // locationArr이 아직 초기화되지 않은 경우 빈 배열로 초기화
	}

	themeArr.push(m_theme1Value);
	themeArr.push(m_theme2Value);
	themeArr.push(m_theme3Value);
	locationArr.push(m_area1Value);
	locationArr.push(m_area2Value);
	locationArr.push(m_area3Value);
	

	$(document).ready(
			function() {
				
				// 테마
				$('.btn1').each(function(index) {
					$(this).attr('btn1-index', index);
				}).click(
						function() {
							var index = $(this).attr('btn1-index');
							$('.btn1[btn1-index=' + index + ']').toggleClass('clicked_btn1');
							
							// 남기문 수정 (기존 소스 삭제)
							if(themeArr == null){
								themeArr = new Array();
							}
	
							// 해당 테마 버튼의 value값 (숫자 가져옴)
							var selectedButtonValue = $('.btn1[btn1-index=' + index + ']').attr('value');
							
							var themeArrIndex = themeArr.findIndex((e) => e == selectedButtonValue);
	
							if(themeArrIndex == -1){
								if(themeArr.length < 3){
									themeArr.push(selectedButtonValue);
								}
								else{
									alert('테마는 각각 최대 3개까지만 선택이 가능합니다.');
									$('.btn1[btn1-index=' + index + ']').toggleClass('clicked_btn1');
								}
							}
							else{
									themeArr.splice(themeArrIndex, 1);
							}
							
							console.log("themeArr : " + themeArr);
						});
				
				$('.btn2').each(function(index) {
					$(this).attr('btn2-index', index);
				}).click(
						function() {
							var index = $(this).attr('btn2-index');
							$('.btn2[btn2-index=' + index + ']').toggleClass('clicked_btn2');
							
							// 남기문 수정 (기존 소스 삭제)
							if(locationArr == null){
								locationArr = new Array();
							}
							
							// 해당 지역 버튼의 value값 (숫자 가져옴)
							var selectedButtonValue = $('.btn2[btn2-index=' + index + ']').attr('value');
							
							// 해당 value가 배열에 있는지 확인 / 없으면 -1 반환, 있으면 N번째 수 반환
							var locationArrIndex = locationArr.findIndex((e) => e == selectedButtonValue);
							
							if(locationArrIndex == -1){
								if(locationArr.length < 3){
									// 배열에 값이 없고, 배열 내의 개수가 3개 이하인 경우 insert
									locationArr.push(selectedButtonValue);
								}
								else{
									alert('선호 지역은 각각 최대 3개까지만 선택이 가능합니다.');
									$('.btn2[btn2-index=' + index + ']').toggleClass('clicked_btn2');
								}
							}
							else{
								// N번째 인덱스를 이용하여 데이터 삭제
								locationArr.splice(locationArrIndex, 1);
							}
							console.log("locationArr : " + locationArr);
						});
			});

    // themeArr 데이터를 사용하는 코드 작성
    console.log("themeArr: ", themeArr);
    console.log("locationArr: ", locationArr);
	
	function insertBeforeCheck() {
		
		var tel = new RegExp('010(?=.*[0-9]{8})')
	
		var p1 = document.getElementById('m_pw').value;
		var p2 = document.getElementById('m_pw2').value;
	
		var phone_number = $("input[id=m_tel]").val();
	
		var roadaddress = $("input[id=m_roadAddress]").val();
		var detailaddress = $("input[id=m_detailAddress]").val();
		
		if($("input[id=m_email]").val().length < 1){
			alert("이메일을 입력해주세요");
			return false;
		}
		
		if(isEmailChecked == false)
		{
			if(emailMsg == ""){
				alert("이메일 중복확인 버튼을 눌러주세요");
				return false;
			}
			else{
				alert(emailMsg);
				return false;
			}
		}
		
		if(p1.length < 1){
			alert("비밀번호를 입력해주세요");
			return false;
		}
		if(isPasswordChecked == false){
			alert("비밀번호를 조건에 맞게 입력해주세요");
			return false;
		}
		
		if(p2.length < 1){
			alert("'비밀번호 확인'을 입력해주세요");
			return false;
		}
	
		if( p1 != p2 ) {
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
	
		if(phone_number.length < 1){
			alert("휴대폰 정보를 입력해주세요");
			return false;
		}
	
		if(!tel.test($("input[id=m_tel]").val())){
			alert("휴대폰 번호를 다시 입력해주세요.");
			return false;
		} 
	
		if(roadaddress.length < 1){
			alert("도로명 주소를 입력해주세요");
			return false;
		}
			
		if(detailaddress.length < 1){
			alert("상세 주소를 입력해주세요");
			return false;
		}	
		
		if(themeArr == null || themeArr.length < 1){
			alert("테마를 최소 1개 이상 선택해주세요");
			return false;
		}
	
		if(locationArr == null || locationArr.length < 1){
			alert("선호지역을 최소 1개 이상 선택해주세요");
			return false;
		}
	
		// 위에서 저장한 내용을 hidden값에 집어넣어줌..
		var selectTema = themeArr.join(',');
		document.getElementById("modify_tema").value = selectTema;
		document.getElementById("modify_area").value = locationArr;
		
	}
	</script>

</html>