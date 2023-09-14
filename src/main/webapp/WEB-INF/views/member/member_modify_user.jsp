<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/user/join_user.css" />
</head>

<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<body id="body">
	<p class="join">회원정보 수정</p>
	<hr>
	<br>
	<form action="modifing" onsubmit="return insertBeforeCheck();" id="form">
			<input type="hidden" name="all_tema" id="all_tema"  value="aaa"/> 
			<input type="hidden" name="all_area" id="all_area" value=""/>
		<div class="join-wrapper">
			<table class="member">
				<tr>
					<td><label>이메일</label></td>
					<td><input type="email" class="enter" name="m_email" value="${m_email }" id="m_email" disabled /></td>
				</tr>
				<tr>
					<td><label>비밀번호</label></td>
					<td><input type="password" class="enter" name="m_pw" id="m_pw"
						autocomplete="off"  placeholder="비밀번호를 입력해주세요."
						required /> &nbsp; <span id="StrengthDisp" class="badge displayBadge my-3"></span></td>
				</tr>
				<tr>
					<td><label>비밀번호확인</label></td>
					<td><input type="password" class="enter" name="m_pw2"
						autocomplete="off"  id="m_pw2" placeholder="비밀번호를 한번 더 입력해주세요." required /></td>
				</tr>
				<tr>
					<td><label>이름</label></td>
					<td><input type="text" class="enter" name="m_name"
						value="${m_name }" id="disabled_name" disabled /></td>
				</tr>
				<tr>
					<td><label>휴대폰</label></td>
					<td><input type="text" oninput="inputNumberOnly(this)"
						class="enter" id="m_tel" name="m_tel" maxlength="11" value="${m_tel }"
						required /></td>
				</tr>
				<tr>
					<td><label>주소</label></td>
					<td><input type="text" class="enter" id="m_roadAddress"
						name="m_roadAddress" value="${m_roadAddress }" readonly></td>
					<td><input type="button" class="certi"
						onclick="execDaumPostcode()" value="주소찾기"></td>
				</tr>
				<tr>
					<td><label></label></td>
					<td><input type="text" class="add_enter"
						name="m_detailAddress" id="m_detailAddress"
						value="${m_detailAddress }" placeholder="상세주소"></td>
				</tr>
			</table>
		</div>
		<br> <br>
		<hr>
		<br>
		<div class="select-wrapper">
			<table class="select">
				<tr>
					<td><label class="tema" id="tema">테마</label></td>
					<td><button type="button"
							class="${m_theme1==1 || m_theme2==1 || m_theme3==1 ? 'btn1 clicked_btn1' : 'btn1' }"
							name="tema" value="1">#등산</button>
						<button type="button"
							class="${m_theme1==2 || m_theme2==2 || m_theme3==2 ? 'btn1 clicked_btn1' : 'btn1' }"
							name="tema" value="2">#바다</button>
						<button type="button"
							class="${m_theme1==3 || m_theme2==3 || m_theme3==3 ? 'btn1 clicked_btn1' : 'btn1' }"
							name="tema" value="3">#도시</button>
						<button type="button"
							class="${m_theme1==4 || m_theme2==4 || m_theme3==4 ? 'btn1 clicked_btn1' : 'btn1' }"
							name="tema" value="4">#계곡</button></td>
				</tr>
				<tr>
					<td><label></label></td>
					<td><button type="button"
							class="${m_theme1==5 || m_theme2==5 || m_theme3==5 ? 'btn1 clicked_btn1' : 'btn1' }"
							name="tema" value="5">#레저</button>
						<button type="button"
							class="${m_theme1==6 || m_theme2==6 || m_theme3==6 ? 'btn1 clicked_btn1' : 'btn1' }"
							name="tema" value="6">#문화</button>
						<button type="button"
							class="${m_theme1==7 || m_theme2==7 || m_theme3==7 ? 'btn1 clicked_btn1' : 'btn1' }"
							name="tema" value="7">#맛집</button>
						<button type="button"
							class="${m_theme1==8 || m_theme2==8 || m_theme3==8 ? 'btn1 clicked_btn1' : 'btn1' }"
							name="tema" value="8">#파티</button></td>
				</tr>
				<tr>
					<td><label class="tema" id="area">선호지역</label></td>
					<td><button type="button"
							class="${m_area1==1 || m_area2==1 || m_area3==1 ? 'btn2 clicked_btn2' : 'btn2' }"
							name="area" value="1">#서울</button>
						<button type="button"
							class="${m_area1==2 || m_area2==2 || m_area3==2 ? 'btn2 clicked_btn2' : 'btn2' }"
							name="area" value="2">#경기</button>
						<button type="button"
							class="${m_area1==3 || m_area2==3 || m_area3==3 ? 'btn2 clicked_btn2' : 'btn2' }"
							name="area" value="3">#인천</button>
						<button type="button"
							class="${m_area1==4 || m_area2==4 || m_area3==4 ? 'btn2 clicked_btn2' : 'btn2' }"
							name="area" value="4">#충청</button></td>
				</tr>
				<tr>
					<td><label></label></td>
					<td><button type="button"
							class="${m_area1==5 || m_area2==5 || m_area3==5 ? 'btn2 clicked_btn2' : 'btn2' }"
							name="area" value="5">#강원</button>
						<button type="button"
							class="${m_area1==6 || m_area2==6 || m_area3==6 ? 'btn2 clicked_btn2' : 'btn2' }"
							name="area" value="6">#경상</button>
						<button type="button"
							class="${m_area1==7 || m_area2==7 || m_area3==7 ? 'btn2 clicked_btn2' : 'btn2' }"
							name="area" value="7">#전라</button>
						<button type="button"
							class="${m_area1==8 || m_area2==8 || m_area3==8 ? 'btn2 clicked_btn2' : 'btn2' }"
							name="area" value="8">#제주</button></td>
				</tr>
				<tr>
					<td><label></label></td>
				</tr>

				<tr>
					<td colspan="2"><span class="tema_area">※ 테마 및 선호지역은 각각
							<b>최대 3개</b>까지 선택하실 수 있습니다.
					</span></td>
				</tr>

			</table>
		</div>
		<br /> <br />
		<hr>
		<br />
		<table class="agree">
			<tr>
				<td id="agree_label"><label>이용약관동의</label></td>
				<td>
					<li class="terms__box">
						<div class="input__check">
							<input type="checkbox" name="m_marketing" id="allowPromotions"
								${m_marketing == 'Y' ? 'checked' : ''} class="chk"
								value="${m_marketing }" /> <label for="allowPromotions"
								id="label_font">이벤트 정보 수신 동의 <b>(선택)</b></label>
						</div>
				</li>
				</td>
			</tr>

		</table>
		<br />
		<hr>
		<br /> <br />

		<div class="join_cancel">
			<button type="submit" value="정보 수정" class="modify_button"
				id="modify_button">정보 수정</button>
			<a href="../user/mypage_info?m_no=${sessionScope.m_no}"
				id="cancel_button">취소</a>
		</div>
		<br> <br>

	</form>
</body>
<script>
// 기존 데이터 가져오기

var themeArr = null;
var locationArr = null;

var m_theme1Value = ${m_theme1}; // JSP 변수 값을 JavaScript 변수에 할당
var m_theme2Value = ${m_theme2};
var m_theme3Value = ${m_theme3};
var m_area1Value = ${m_area1}; // JSP 변수 값을 JavaScript 변수에 할당
var m_area2Value = ${m_area2};
var m_area3Value = ${m_area3};

if (themeArr === null) {
    themeArr = []; // themeArr이 아직 초기화되지 않은 경우 빈 배열로 초기화
}
if (locationArr === null) {
    locationArr = []; // locationArr이 아직 초기화되지 않은 경우 빈 배열로 초기화
}

themeArr.push(m_theme1Value);
themeArr.push(m_theme2Value);
themeArr.push(m_theme3Value);
locationArr.push(m_area1Value);
locationArr.push(m_area2Value);
locationArr.push(m_area3Value);


</script>
<script src="${pageContext.request.contextPath }/resources/js/user/modify_user.js"></script>
</html>