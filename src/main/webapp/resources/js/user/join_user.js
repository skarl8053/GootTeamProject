
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
	var flag = false;
	
	$.ajax({
		url : "checking",
		method : "GET",
		data : "m_email="+m_email,
		success : function(data){
			if(data=="1"){
				$("#check_text").text("이메일을 입력해주세요.")
				$("#check_text").css("color","red");
				flag = false		
			}else if(data=="0"){		
				if((reg.test(m_email))==false){
					$("#check_text").text("이메일 형식에 맞지 않습니다.")
					$("#check_text").css("color","red");
					flag = false					
				}else{
					$("#check_text").text("사용 가능한 이메일입니다.")
					$("#check_text").css("color","green");
					flag = false				
				}
			}else{			
				$("#check_text").text("중복된 이메일입니다.")
				$("#check_text").css("color","red");
				flag = false
			}
		}
	});
	return false;
};




// 비밀번호 정규식

let timeout;
let password = document.getElementById('m_pw')
let strengthBadge = document.getElementById('StrengthDisp')
let strongPassword = new RegExp('(?=.*[^a-z0-9])(?=.{8,})')
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

  if (password.value.length >= 0) {
    strengthBadge.style.display != 'block'
  } else {
    strengthBadge.style.display = 'none'
  }
});





//핸드폰 번호 형식 일치 여부
//비밀번호확인 일치 여부

function test() {

var tel = new RegExp('010(?=.*[0-9]{8})')
	
if(!tel.test($("input[id=m_tel]").val())){
	alert("휴대폰 번호를 다시 입력해주세요.");
	return false;
} else{
   return true;
}
	
	
var p1 = document.getElementById('m_pw').value;
var p2 = document.getElementById('m_pw2').value;

   if( p1 != p2 ) {
     alert("비밀번호가 일치하지 않습니다.");
     return false;
   } else{
     return true;
   }
   
}

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
						$('.btn1[btn1-index=' + index + ']').toggleClass('clicked_btn1');
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
						$('.btn2[btn2-index=' + index + ']').toggleClass('clicked_btn2');
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


var all_tema1 = "";
var all_area1 = "";
var f = document.joining;

function a(target){
	
		if(all_tema1.length>5){
			all_tema1=""
		}else{
			all_tema1 += target.value+","
			f.all_tema.value=all_tema1;
		}
	
	console.log(all_tema1)
}
function aa(target){
	if(all_area1.length>5){
		all_area1=""
	}else{
		all_area1 += target.value+","	
		f.all_area.value=all_area1;
	}
	console.log(all_area1)
}

