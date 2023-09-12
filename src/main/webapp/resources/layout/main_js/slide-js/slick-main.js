//  이미지 슬라이드 옵션 설정
//  웹페이지가 완전히 로드된 후에 다음 작업을 수행
$(function() {
	// /////////////////////////
	// 이벤트 슬라이드
	
	//	alert("aa");
					
    var imgData = '${on_evt_img.filename}';
    var noData = '${on_evt_no.event_no}';
    
	//    alert("imgData: " + imgData);
	//    alert("noData: " + noData);
	
	console.log("imgData type:", typeof imgData);
	console.log("noData type:", typeof noData);

    console.log("imgData: " + imgData);
    console.log("noData: " + noData);


	// 이미지 배열
	var imageUrls = [
	    'resources/upload_img/admin/event/서울 야경2.jpg',
	    'resources/upload_img/admin/event/양양 서피비치.jpg',
	    'resources/upload_img/admin/event/제주도.jpg',
	    'resources/upload_img/admin/event/부산.jpg'
	];
	
	// 이미지에 대한 링크 배열
	
	// var event_no = document.querySelector('input[name="event_no"]');
		
	var linkUrls = [
	    'http://localhost:8090/travel/user/event_page?event_no=' + 1,
	    'http://localhost:8090/travel/user/event_page?event_no=' + 2,
	    'http://localhost:8090/travel/user/event_page?event_no=' + 3,
	    'http://localhost:8090/travel/user/event_page?event_no=' +4
	];
	
	//var str_split = str.split(',')
	
	//for(i = 0; i<str_split.length; i++)
	//{
	//	imageUrl.push("resources/upload_img/admin/event/" + str_split[i])
	//}
	
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
		autoplaySpeed : 3000 /* 이미지 슬라이드 자동 넘김시 슬라이드 시간[s] */,
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
		autoplaySpeed : 3000 /* 이미지 슬라이드 자동 넘김시 슬라이드 시간[s] */,
		pauseOnHover : true /* 이미지 슬라이드에 마우스 hover시 슬라이드 멈춤 */,
		speed : 1000 /* 이미지 슬라이드 속도 */,
		centerMode : true
	});
});