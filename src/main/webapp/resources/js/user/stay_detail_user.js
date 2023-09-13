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


