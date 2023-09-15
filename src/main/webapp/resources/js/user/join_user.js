	//주소 찾기
	
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
	
	
	// 약관 모두 체크, 해제
	
	
	const checkAll = document.querySelector('.terms__check__all input');
	const checkBoxes = document.querySelectorAll('.input__check input');
	const submitButton = document.querySelector('.join_button');
	
	const agreements = {
	termsOfService: false,
	privacyPolicy: false,
	allowPromotions: false,
	};
	
	
	checkBoxes.forEach((item) => item.addEventListener('input', toggleCheckbox));
	
	function toggleCheckbox(e) {
	const { checked, id } = e.target;  
	agreements[id] = checked;
	this.parentNode.classList.toggle('active');
	checkAllStatus();
	toggleSubmitButton();
	}
	
	function checkAllStatus() {
	const { termsOfService, privacyPolicy, allowPromotions } = agreements;
	if (termsOfService && privacyPolicy && allowPromotions) {
		checkAll.checked = true;
	} else {
		checkAll.checked = false;
	}
	}
	
	function toggleSubmitButton() {
	const { termsOfService, privacyPolicy } = agreements;
	if (termsOfService && privacyPolicy) {
		submitButton.disabled = false;
	} else {
		submitButton.disabled = true;
	}
	}
	
	checkAll.addEventListener('click', (e) => {
	const { checked } = e.target;
	if (checked) {
		checkBoxes.forEach((item) => {
		item.checked = true;
		agreements[item.id] = true;
		item.parentNode.classList.add('active');
		});
	} else {
		checkBoxes.forEach((item) => {
		item.checked = false;
		agreements[item.id] = false;
		item.parentNode.classList.remove('active');
		});
	}
	toggleSubmitButton();
	});
	
	// 약관 보기 모달 창
	
	const modal1 = document.getElementById("modal1");
	const btnModal1 = document.getElementById("btn-modal1");
	
	btnModal1.addEventListener("click", (e) => {
	modal1.style.display = "flex";
	});
	const closeBtn1 = modal1.querySelector(".close-area");
	closeBtn1.addEventListener("click", (e) => {
	modal1.style.display = "none";
	});
	const closeBtn2 = modal1.querySelector(".last_check");
	closeBtn2.addEventListener("click", (e) => {
	modal1.style.display = "none";
	});
	modal1.addEventListener("click", (e) => {
	const evTarget = e.target;
	if (evTarget.classList.contains("modal-overlay")) {
		modal1.style.display = "none";
	}
	});
	window.addEventListener("keyup", (e) => {
	if (modal1.style.display === "flex" && e.key === "Escape") {
		modal1.style.display = "none";
	}
	});
	
	
	const modal2 = document.getElementById("modal2");
	const btnModal2 = document.getElementById("btn-modal2");
	
	btnModal2.addEventListener("click", (e) => {
	modal2.style.display = "flex";
	});
	const closeBtn3 = modal2.querySelector(".close-area");
	closeBtn3.addEventListener("click", (e) => {
	modal2.style.display = "none";
	});
	const closeBtn4 = modal2.querySelector(".last_check");
	closeBtn4.addEventListener("click", (e) => {
	modal2.style.display = "none";
	});
	modal2.addEventListener("click", (e) => {
	const evTarget = e.target;
	if (evTarget.classList.contains("modal-overlay")) {
		modal2.style.display = "none";
	}
	});
	window.addEventListener("keyup", (e) => {
	if (modal2.style.display === "flex" && e.key === "Escape") {
		modal2.style.display = "none";
	}
	});
	
	// 이메일 중복확인 및 정규식
	
	function checking(){
		
		var m_email = $('input#m_email').val();
		var reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		
		$.ajax({
			url : "checking",
			method : "GET",
			data : "m_email="+m_email,
			success : function(data){
				if(data=="1"){
					$("#check_text").text("이메일을 입력해주세요.")
					$("#check_text").css("color","red");
	
					emailMsg = "이메일을 입력해주세요";
					
					isEmailChecked = false;		
				}else if(data=="0"){		
					if((reg.test(m_email))==false){
						$("#check_text").text("이메일 형식에 맞지 않습니다.")
						$("#check_text").css("color","red");
						
						emailMsg = "이메일 형식에 맞지 않습니다.";
						
						isEmailChecked = false;					
					}else{
						$("#check_text").text("사용 가능한 이메일입니다.")
						$("#check_text").css("color","green");
						
						emailMsg = "";
						
						isEmailChecked = true;				
					}
				}else{			
					$("#check_text").text("중복된 이메일입니다.")
					$("#check_text").css("color","red");
					
					emailMsg = "이미 회원가입이 된 이메일입니다.";
					isEmailChecked = false;
				}
			}
		});
	};
	
	// 비밀번호 정규식
	
	let timeout;
	let password = document.getElementById('m_pw')
	let strengthBadge = document.getElementById('StrengthDisp')
	let strongPassword = new RegExp('(?=.*[a-z])(?=.*[0-9])(?=.*[^A-Za-z0-9])(?=.{8,})')
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
	
	if (password.value.length >= 0) {
		strengthBadge.style.display != 'block'
	} else {
		strengthBadge.style.display = 'none'
	}
	});
	
	function inputNumberOnly(el) {
		el.value = el.value.replace(/[^0-9]/g, '');
	}
	
	// 테마 및 지역 선택 (남기문 전체적으로 수정 완료)
	
	var themeArr = null;
	var locationArr = null;
	
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
	////////////////////// 테마 / 선호 지역 선택 : 남기문 /////////////////////////
	
	var isEmailChecked = false;
	var emailMsg = "";
	var isPasswordChecked = false;
	
	// 회원가입 전에 입력 안한것 / 입력이 잘못된것 찾기 (남기문 추가)
	
	function insertBeforeCheck() {
	
		var tel = new RegExp('010(?=.*[0-9]{8})')
	
		var p1 = document.getElementById('m_pw').value;
		var p2 = document.getElementById('m_pw2').value;
	
		var phone_number = $("input[id=m_tel]").val();
	
		var name = $("input[id=m_name]").val();
		
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
		if(name.length < 1){
			alert("이름을 입력해주세요");
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
		document.getElementById("all_tema").value = themeArr;
		document.getElementById("all_area").value = locationArr;
		
	}