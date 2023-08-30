//  지역명 배열
var region_list = [ '서울', '경기', '인천', '제주', '전라', '경상', '충청', '강원'];

// 테마명 배열
var theme_list = [ '등산', '바다', '도시', '계곡', '레저', '문화', '맛집', '파티'];

// 더보기 메뉴명 배열
var addition_list = [ '이벤트', '고객센터' ];

// 영역1에 삽입할 html 코드
var regionHtml = '<ul id="region-list-content">';

// 영역2에 삽입할 html 코드
var themeHtml = '<ul id="theme-list-content">';

// 영역3에 삽입할 html 코드
var additionHtml = '<ul id="addition-list-content">';

// 웹 페이지가 완전히 로드된 후에 다음 작업을 수행
$(function() {
	// header nav의 지역 리스트(<li>)를 나타내는 html 태그
	for (i = 0; i < region_list.length; i++) {
		if (i % 2 == 0)
			regionHtml += '<li class="list-new-line"><a href="#">'
					+ region_list[i] + '</a></li>';
		else
			// 짝수번째 li 태그에 대해서는 다음줄로 개행되도록...
			regionHtml += '<li><a href="#">' + region_list[i] + '</a></li>';
	}

	regionHtml += '</ul>';

	// header nav의 테마 리스트(<li>)를 나타내는 html 태그
	for (i = 0; i < theme_list.length; i++) {
		if (i % 2 == 0)
			themeHtml += '<li class="list-new-line"><a href="#">#'
					+ theme_list[i] + '</a></li>';
		else
			// 짝수번째 li 태그에 대해서는 다음줄로 개행되도록...
			themeHtml += '<li><a href="#">#' + theme_list[i] + '</a></li>';
	}

	themeHtml += '</ul>';

	// header nav의 더보기 메뉴 리스트(<li>)를 나타내는 html 태그
	for (i = 0; i < addition_list.length; i++)
		additionHtml += '<li><a href="#">' + addition_list[i] + '</a></li>';

	additionHtml += '</ul>';

	$('#region-list-title').append(regionHtml); // 영역1 내부에 regionHtml 코드가 들어감
	$('#theme-list-title').append(themeHtml); // 영역2 내부에 themeHtml 코드가 들어감
	$('#addition-list-title').append(additionHtml); // 영역3 내부에 additionHtml 코드가
	// 들어감

	$('li.list-new-line').addClass('clear'); // 짝수번째 li 태그에 대해서는 다음줄로
	// 개행되도록...
});