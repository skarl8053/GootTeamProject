var slideIndex = 0; //slide index
var slideIndex1 = 0; 
var slideIndex2 = 0; 
// HTML 로드가 끝난 후 동작
window.onload=function(){
  showSlides(slideIndex);
  showSlides1(slideIndex1);
  showSlides2(slideIndex2);

  // Auto Move Slide
  var sec = 3000;
  setInterval(function(){
    slideIndex++;
    showSlides(slideIndex);

  }, sec);
  setInterval1(function(){
	    slideIndex1++;
	    showSlides1(slideIndex1);

	  }, sec);
  setInterval2(function(){
	  slideIndex2++;
	  showSlides2(slideIndex1);
	  
  }, sec);
}


// Next/previous controls
function moveSlides(n) {
  slideIndex = slideIndex + n
  showSlides(slideIndex);
}

function moveSlides1(n) {
	  slideIndex1 = slideIndex1 + n
	  showSlides1(slideIndex1);
	}
function moveSlides2(n) {
	slideIndex2 = slideIndex2 + n
	showSlides2(slideIndex2);
}

// Thumbnail image controls
function currentSlide(n) {
  slideIndex = n;
  showSlides(slideIndex);
}

function currentSlide1(n) {
	  slideIndex1 = n;
	  showSlides1(slideIndex1);
	}

function currentSlide2(n) {
	slideIndex2 = n;
	showSlides2(slideIndex2);
}

function showSlides(n) {

  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  var size = slides.length;

  if ((n+1) > size) {
    slideIndex = 0; n = 0;
  }else if (n < 0) {
    slideIndex = (size-1);
    n = (size-1);
  }

  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }

  slides[n].style.display = "block";
  dots[n].className += " active";
}

function showSlides1(n) {

	  var slides1 = document.getElementsByClassName("mySlides12");
	  var dots = document.getElementsByClassName("dot1");
	  var size = slides1.length;

	  if ((n+1) > size) {
	    slideIndex1 = 0; n = 0;
	  }else if (n < 0) {
	    slideIndex1 = (size-1);
	    n = (size-1);
	  }

	  for (i = 0; i < slides1.length; i++) {
	      slides1[i].style.display = "none";
	  }
	  for (i = 0; i < dots.length; i++) {
	      dots[i].className = dots[i].className.replace(" active1", "");
	  }

	  slides1[n].style.display = "block";
	  dots[n].className += " active";
	}

function showSlides2(n) {
	
	var slides2 = document.getElementsByClassName("mySlides23");
	var dots = document.getElementsByClassName("dot2");
	var size = slides2.length;
	
	if ((n+1) > size) {
		slideIndex2 = 0; n = 0;
	}else if (n < 0) {
		slideIndex2 = (size-1);
		n = (size-1);
	}
	
	for (i = 0; i < slides2.length; i++) {
		slides2[i].style.display = "none";
	}
	for (i = 0; i < dots.length; i++) {
		dots[i].className = dots[i].className.replace(" active2", "");
	}
	
	slides2[n].style.display = "block";
	dots[n].className += " active";
}



		
/*slideIndex: 슬라이드의 인덱스를 나타내는 변수입니다. 이 변수는 현재 표시되고 있는 슬라이드의 인덱스를 추적합니다.

window.onload: HTML 문서가 로드되면 실행되는 함수입니다. 슬라이드 쇼를 시작하며 초기 슬라이드를 표시하는 showSlides 함수를 호출하고, setInterval을 사용하여 일정한 시간 간격으로 자동으로 슬라이드를 변경합니다.

moveSlides(n): 이 함수는 '다음' 또는 '이전' 슬라이드로 이동하기 위해 사용됩니다. n은 이동할 슬라이드의 상대적인 인덱스 변경을 나타냅니다.

currentSlide(n): 이 함수는 특정 슬라이드로 이동하기 위해 사용됩니다. n은 이동할 슬라이드의 인덱스입니다.

showSlides(n): 이 함수는 슬라이드를 표시하고 감추는 데 사용됩니다. 현재 슬라이드를 감추고 지정된 슬라이드를 표시합니다. 또한 슬라이드 아래에 있는 동그라미 표시(페이징)를 업데이트합니다.

이 코드는 슬라이드 쇼를 자동으로 이동하고, 다음/이전 슬라이드로 이동하며, 특정 슬라이드를 클릭하여 이동할 수 있도록 하는 데 사용됩니다. HTML 문서에서 클래스 이름이 "mySlides"인 슬라이드 요소와 "dot"인 동그라미 표시 요소를 찾아 업데이트합니다.		
		*/
