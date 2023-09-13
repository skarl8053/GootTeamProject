function getCheckboxValue() {
  // 선택된 목록 가져오기
  const query = 'input[type="radio"]:checked';
  const selectedEls = document.querySelectorAll(query);

  // 선택된 목록에서 value 찾기
  let result = '';

  selectedEls.forEach((el) => {
    result += `
      <span class="selectedValue">
        ${el.value}
        <span class="close"> </span>
      </span>
    `;
  });

  // 출력
  const selectedValuesDiv = document.getElementById('selectedValues');
  selectedValuesDiv.innerHTML = result;

  // 각 "X" 버튼에 클릭 이벤트 추가
  const closeButtonList = selectedValuesDiv.querySelectorAll('.close');
  closeButtonList.forEach((closeButton) => {
    closeButton.addEventListener('click', function () {
      const selectedValueDiv = closeButton.parentNode;
      const radioInput = selectedValueDiv.querySelector('input[type="radio"]');
      radioInput.checked = false;
      selectedValueDiv.remove();
    });
  });
}

// 페이지 로드 후 실행
document.addEventListener('DOMContentLoaded', function () {
  // "X" 버튼 클릭 이벤트 핸들러 추가
  getCheckboxValue();
});


/*여기서는 X눌렀을 때 삭제가 되었다..*/
/*function getCheckboxValue() {
	  // 선택된 목록 가져오기
	  const query = 'input[type="radio"]:checked';
	  const selectedEls = document.querySelectorAll(query);

	  // 선택된 목록에서 value 찾기
	  let result = '';

	  selectedEls.forEach((el) => {
	    result += el.value + ', ';
	  });

	  // 출력
	  const resultDiv = document.getElementById('result');
	  const selectedValuesDiv = document.getElementById('selectedValues');
	  const closeButton = resultDiv.querySelector('.close');

	  selectedValuesDiv.textContent = result;
	  resultDiv.style.display = 'block';

	  closeButton.addEventListener('click', function () {
	    selectedEls.forEach((el) => {
	      el.checked = false;
	    });
	    selectedValuesDiv.textContent = '';
	    resultDiv.style.display = 'none';
	  });
	}

	
*/
// variables
var accordionBtn = document.querySelectorAll('.accordionTitle');
var allTexts = document.querySelectorAll('.text');
var accIcon = document.querySelectorAll('.accIcon');

// event listener
accordionBtn.forEach(function (el) {
    el.addEventListener('click', toggleAccordion)
});

// function
function toggleAccordion(el) {
   var targetText = el.currentTarget.nextElementSibling.classList;
   var targetAccIcon = el.currentTarget.children[0];
   var target = el.currentTarget;
   
   if (targetText.contains('show')) {
       targetText.remove('show');
       targetAccIcon.classList.remove('anime');
       target.classList.remove('accordionTitleActive');
   } 
   else {
      accordionBtn.forEach(function (el) {
         el.classList.remove('accordionTitleActive');
         
         allTexts.forEach(function (el) {
            el.classList.remove('show');
         })
         
         accIcon.forEach(function (el) {
          el.classList.remove('anime');
         }) 
         
      })
      
         targetText.add('show');
         target.classList.add('accordionTitleActive');
         targetAccIcon.classList.add('anime');
   }  
}