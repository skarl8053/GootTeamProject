//  회원 관리
var member_list = [
    '회원 조회','구매 내역 조회', '결제 내역 조회', '배송내역 조회', '환불정보 조회', '댓글 내역 조회', '신고 내역 조회', '포인트 내역 조회'
];

//  숙소 관리
var stay_list = [
    '숙소 등록', '객실 등록'
];

//  이벤트 관리
var event_list = [
    '쿠폰 관리', '이벤트 관리', '경품 관리', '이벤트 당첨 내역'
];

//  영역1에 삽입할 html 코드
var memberHtml = '<ul id="member-list-content">';

//  영역2에 삽입할 html 코드
var stayHtml = '<ul id="stay-list-content">';

//  영역3에 삽입할 html 코드
var eventHtml = '<ul id="event-list-content">';

//  웹 페이지가 완전히 로드된 후에 다음 작업을 수행
$(function(){
    //  header nav의 지역 리스트(<li>)를 나타내는 html 태그
    for(i = 0; i < member_list.length; i++){
        if(i % 4 == 0)
            memberHtml += '<li class="list-new-line"><a href="#">' + member_list[i] + '</a></li>';
        else    //  짝수번째 li 태그에 대해서는 다음줄로 개행되도록...
            memberHtml += '<li><a href="#">'+member_list[i]+'</a></li>';
    }

    memberHtml += '</ul>';

    //  header nav의 테마 리스트(<li>)를 나타내는 html 태그
    for(i = 0; i < stay_list.length; i++){
        if(i % 7 == 0)
            stayHtml += '<li class="list-new-line"><a href="#">#' + stay_list[i] + '</a></li>';
        else    //  짝수번째 li 태그에 대해서는 다음줄로 개행되도록...
            stayHtml += '<li><a href="#">#'+stay_list[i]+'</a></li>';
    }

    stayHtml += '</ul>';

    //  header nav의 더보기 메뉴 리스트(<li>)를 나타내는 html 태그
    for(i = 0; i < event_list.length; i++)
        if(i % 7 == 0)
            eventHtml += '<li class="list-new-line"><a href="#">'+event_list[i]+'</a></li>';
        else
            eventHtml += '<li><a href="#">'+event_list[i]+'</a></li>';
    
    eventHtml += '</ul>';

    $('#member-list-title').append(memberHtml); //  영역1 내부에 memberHtml 코드가 들어감
    $('#stay-list-title').append(stayHtml); //  영역2 내부에 stayHtml 코드가 들어감
    $('#event-list-title').append(eventHtml); //  영역3 내부에 eventHtml 코드가 들어감

    $('li.list-new-line').addClass('clear');        //  짝수번째 li 태그에 대해서는 다음줄로 개행되도록...
});