//  이미지 슬라이드 옵션 설정
//  웹페이지가 완전히 로드된 후에 다음 작업을 수행
$(function() {
	// /////////////////////////
	// 이벤트 슬라이드
	
	// 이미지 배열
	var imageUrls = [
	    'resources/upload_img/admin/stay/숙소11693357921313_KakaoTalk_20230830_095826716.jpg',
	    'resources/upload_img/admin/stay/숙소11693357921316_KakaoTalk_20230830_095826716_01.jpg',
	    'resources/upload_img/admin/stay/숙소11693357921318_KakaoTalk_20230830_095826716_02.jpg',
	    'resources/upload_img/admin/stay/KakaoTalk_20230830_095826716_03.jpg'
	];
	
	// 이미지에 대한 링크 배열
	var linkUrls = [
	    'http://www.naver.com',
	    'http://www.nate.com',
	    'http://www.youtube.com',
	    'https://sports.news.naver.com/index.nhn'
	];
	
	// 이미지 + 링크 배열
	var printImgTag = "";
	for (var i = 0; i < imageUrls.length; i++) {
	    printImgTag += '<a href="' + linkUrls[i] + '"><img src="' + imageUrls[i] + '" /></a>';
	}
	
	
	$("div.regular").addClass("slider").html(printImgTag);


	// 이미지 슬라이더 설정
	$(".regular").slick({
		dots : true /* 페이지 네비게이션(이미지 하단의 ...) */,
		infinite : true /* 페이지 반복 설정 */,
		slidesToShow : 1 /* 보여질 이미지 슬라이드 수 */,
		slidesToScroll : 1 /* 넘겨질 이미지 슬라이드 수 */,
		autoplay : true /* 이미지 슬라이드 자동 넘김 */,
		autoplaySpeed : 2300 /* 이미지 슬라이드 자동 넘김시 슬라이드 시간[s] */,
		pauseOnHover : true /* 이미지 슬라이드에 마우스 hover시 슬라이드 멈춤 */,
		speed : 1000 /* 이미지 슬라이드 속도 */,
		centerMode : true
	});

	// /////////////////////////
	// 핫딜 슬라이드
	printImgTag2 = ""; // 동적으로 추가할 이미지 슬라이드

	// 이미지 파일 이름들을 저장하는 배열
	var imgFiles2 = new Array();

	// 표시할 이미지들을 임시로 지정
	for (i = 0; i < 4; i++)
		imgFiles2[i] = 'http://placehold.it/400x200?text=' + (i + 1);
		//imgFiles2[i] = 'https://imagescdn.gettyimagesbank.com/500/202002/jv11981539.jpg';

	// 이미지들에 대해서 HTML태그를 만들어서 printImgTag에 저장
	for (i = 0; i < imgFiles2.length; i++)
		printImgTag2 += '<a href="' + imgFiles2[i] + '"><img src="'
				+ imgFiles2[i] + '" /></a>';

	// <div class="hdeal slider"> 태그 내부에 printImgTag2(html 태그) 삽입
	$("div.stayinfo").addClass("slider").html(printImgTag2);

	$(".stayinfo").slick({
		dots : true /* 페이지 네비게이션(이미지 하단의 ...) */,
		infinite : true /* 페이지 반복 설정 */,
		slidesToShow : 1 /* 보여질 이미지 슬라이드 수 */,
		slidesToScroll : 1 /* 넘겨질 이미지 슬라이드 수 */,
		autoplay : true /* 이미지 슬라이드 자동 넘김 */,
		autoplaySpeed : 2000 /* 이미지 슬라이드 자동 넘김시 슬라이드 시간[s] */,
		pauseOnHover : true /* 이미지 슬라이드에 마우스 hover시 슬라이드 멈춤 */,
		speed : 900 /* 이미지 슬라이드 속도 */,
		centerMode : true
	});
});