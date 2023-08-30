let pages = 0;//현재 인덱스 번호
let positionValue = 0;//images 위치값
const IMAGE_WIDTH = 1000;//한번 이동 시 IMAGE_WIDTH만큼 이동한다.
//DOM
const backBtn = document.querySelector(".bt_find_id")
const nextBtn = document.querySelector(".bt_find_pw")
const images = document.querySelector(".images")

function next() {
  if (pages< 1) {
    backBtn.removeAttribute('disabled')//뒤로 이동해 더이상 disabled가 아니여서 속성을 삭제한다.
    positionValue -= IMAGE_WIDTH;//IMAGE_WIDTH의 증감을 positionValue에 저장한다.
    images.style.transform = `translateX(${positionValue}px)`;
		//x축으로 positionValue만큼의 px을 이동한다.
    pages += 1; //다음 페이지로 이동해서 pages를 1증가 시킨다.
  }
  if (pages === 1) { //
    nextBtn.setAttribute('disabled', 'true')//마지막 장일 때 next버튼이 disabled된다.
  }
}

function back() {
  if (pages > 0) {
    nextBtn.removeAttribute('disabled')
    positionValue += IMAGE_WIDTH;
    images.style.transform = `translateX(${positionValue}px)`;
    pages -= 1; //이전 페이지로 이동해서 pages를 1감소 시킨다.
  }
  if (pages === 0) {
    backBtn.setAttribute('disabled', 'true')//마지막 장일 때 back버튼이 disabled된다.
  }
}

function init() {  //초기 화면 상태
  backBtn.setAttribute('disabled', 'true'); //속성이 disabled가 된다.
  backBtn.addEventListener("click", back); //클릭시 다음으로 이동한다.
  nextBtn.addEventListener("click", next);//클릭시 이전으로 이동한다.
}
init();

// 아이디 찾기

$(document).ready(function(){
   $("#id_phone").click(function(){
    $("#id_phone_box").toggle(1000);
    $("#id_email_box").hide();
   })
})
$(document).ready(function(){
  $("#id_email").click(function(){
   $("#id_email_box").toggle(1000);
   $("#id_phone_box").hide();
  })
})

// 비밀번호 찾기
$(document).ready(function(){
  $("#pw_phone").click(function(){
   $("#pw_phone_box").toggle(1000);
   $("#pw_email_box").hide();
  })
})
$(document).ready(function(){
 $("#pw_email").click(function(){
  $("#pw_email_box").toggle(1000);
  $("#pw_phone_box").hide();
 })
})
