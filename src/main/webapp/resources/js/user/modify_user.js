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
	var isPasswordChecked = false;
	

	function StrengthChecker(PasswordParameter) {
	  if (strongPassword.test(PasswordParameter)) {
	    strengthBadge.style.color = "green"
	    strengthBadge.textContent = '올바른 형식입니다.'
	    isPasswordChecked = true;
	  } else{
	    strengthBadge.style.color = "red"
	    strengthBadge.textContent = '영문 소문자, 숫자, 특수문자 1개 이상 포함 8자 이상 '
	    isPasswordChecked = false;
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
	
	
	$(document).ready(
			function() {
				
				// 테마
				$('.btn1').each(function(index) {
					$(this).attr('btn1-index', index);
				}).click(
						function() {
							var index = $(this).attr('btn1-index');
							$('.btn1[btn1-index=' + index + ']').toggleClass('clicked_btn1');
							
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
							
							console.log("themeArr :: " + themeArr);
						});
				
				$('.btn2').each(function(index) {
					$(this).attr('btn2-index', index);
				}).click(
						function() {
							var index = $(this).attr('btn2-index');
							$('.btn2[btn2-index=' + index + ']').toggleClass('clicked_btn2');
							
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
							console.log("locationArr :: " + locationArr);
						});
			});

    // themeArr 데이터를 사용하는 코드 작성
	
	
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

		document.getElementById("all_tema").value = themeArr;
		document.getElementById("all_area").value = locationArr;
		
	}
