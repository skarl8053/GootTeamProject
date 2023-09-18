//  이미지 슬라이드 옵션 설정
//  웹페이지가 완전히 로드된 후에 다음 작업을 수행
$(function() {
	// /////////////////////////
	// 이벤트 슬라이드

	var img_split = imgData.split(",");
	var no_split = noData.split(",");

	var imageUrls = new Array();
	var linkUrls = new Array();
	
	for (var i = 0; i < img_split.length; i++) {
		imageUrls[i] = "resources/upload_img/admin/event/" + img_split[i]
		linkUrls[i] = "http://localhost:8090/travel/user/event_page?event_no=" + no_split[i]
	}
	
	// 이미지 + 링크 배열
	var printImgTag = "";
	for (var i = 0; i < imageUrls.length; i++) {
	    printImgTag += '<a href="' + linkUrls[i] + '"><img src="' + imageUrls[i] + '" /></a>';
	}
	
	$("div.regular").addClass("slider").html(printImgTag);

	// 이벤트 이미지 슬라이더 설정
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
	// 숙소 추천 슬라이드
	printImgTag2 = ""; // 동적으로 추가할 이미지 슬라이드
	printImgTag3 = "";
	var not_login_img_split = not_login_img.split(",");
	var login_img_split = login_img.split(",");
	var login_s_no_split = login_s_no.split(",");
	
	// 이미지 파일 이름들을 저장하는 배열 (비로그인 시)
	var Not_Login_Stay_img = new Array();
	var Not_Login_Stay_link = new Array();
	
	for (var i = 0; i < not_login_img_split.length; i++) {
		Not_Login_Stay_img[i] = "resources/upload_img/admin/stay/" + not_login_img_split[i]
		Not_Login_Stay_link[i] = "http://localhost:8090/travel/member/login"
	}
	

	// 이미지 파일 이름들을 저장하는 배열 (로그인 상태)
	var Login_Stay_img = new Array();
	var Login_Stay_link = new Array();

	for (var i = 0; i < login_img_split.length; i++) {
		Login_Stay_img[i] = "resources/upload_img/admin/stay/" + login_img_split[i]
		Login_Stay_link[i] = "user/stay_detail_user?s_no=" + login_s_no_split[i] + "&m_no=" + m_no
	}

	// 비로그인 / 로그인 시 이미지 , 링크 뿌려주기
	if (m_no == "" || m_no == null) {
		for (i = 0; i < 5; i++) {
		printImgTag2 += '<a href="' + Not_Login_Stay_link[i] + '"><img src="'
				+ Not_Login_Stay_img[i] + '" /></a>';
		}
		$("div.stayinfo").addClass("slider").html(printImgTag2);
		} else {
		    // 로그인 상태에서는 이미지와 링크 배열에서 무작위로 5개를 선택합니다.
		    var randomIndices = getRandomIndices(Login_Stay_img.length, 5); 

		    for (var i = 0; i < randomIndices.length; i++) {
		        var randomIndex = randomIndices[i];
		        printImgTag3 += '<a href="' + Login_Stay_link[randomIndex] + '"><img src="' + Login_Stay_img[randomIndex] + '" /></a>';
		    }
		    $("div.stayinfo").addClass("slider").html(printImgTag3);
		}
	// console.log("사용자에게 맞는 해당 숙소 번호 : "+randomIndices);
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

// 랜덤값 구하기
function getRandomIndices(max, count) {
    var indices = [];
    for (var i = 1; i < max; i++) {
        indices.push(i);
    }
    var randomIndices = [];
    while (randomIndices.length < count && indices.length > 0) {
        var randomIndex = Math.floor(Math.random() * indices.length);
        randomIndices.push(indices[randomIndex]);
        indices.splice(randomIndex, 1);
    }
    return randomIndices;
}