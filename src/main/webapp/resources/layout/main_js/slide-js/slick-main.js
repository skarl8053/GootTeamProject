//  이미지 슬라이드 옵션 설정
//  웹페이지가 완전히 로드된 후에 다음 작업을 수행
$(function() {
	// /////////////////////////
	// 이벤트 슬라이드
	printImgTag = ""; // 동적으로 추가할 이미지 슬라이드

	// 이미지 파일 이름들을 저장하는 배열
	var imgFiles = new Array();

	// 표시할 이미지들을 임시로 지정
	for (i = 0; i < 7; i++)
		imgFiles[i] = 'http://placehold.it/400x400?text=' + (i + 1);

	// 이미지들에 대해서 HTML태그를 만들어서 printImgTag에 저장
	for (i = 0; i < imgFiles.length; i++)
		printImgTag += '<a href="' + imgFiles[i] + '"><img src="' + imgFiles[i]
				+ '" /></a>';

	// <div class="regular slider"> 태그 내부에 printImgTag(html 태그) 삽입
	$("div.regular").addClass("slider").html(printImgTag);

	// 이미지 슬라이더 설정
	$(".regular").slick({
		dots : true /* 페이지 네비게이션(이미지 하단의 ...) */,
		infinite : true /* 페이지 반복 설정 */,
		slidesToShow : 3 /* 보여질 이미지 슬라이드 수 */,
		slidesToScroll : 1 /* 넘겨질 이미지 슬라이드 수 */,
		autoplay : true /* 이미지 슬라이드 자동 넘김 */,
		autoplaySpeed : 2000 /* 이미지 슬라이드 자동 넘김시 슬라이드 시간[s] */,
		pauseOnHover : true /* 이미지 슬라이드에 마우스 hover시 슬라이드 멈춤 */,
		speed : 700 /* 이미지 슬라이드 속도 */,
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