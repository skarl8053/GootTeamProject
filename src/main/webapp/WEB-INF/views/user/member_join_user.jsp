<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 화면</title>
<link rel="stylesheet" href="../../../resources/css/user/join_user.css" />
</head>

<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<!-- 테마 및 지역 선택 -->
<script type="text/javascript">
	$(document).ready(
			function() {
				var count1 = 0;
				var count2 = 0;
				$('.btn1').each(function(index) {
					$(this).attr('btn1-index', index);
				}).click(
						function() {
							var index = $(this).attr('btn1-index');
							$('.btn1[btn1-index=' + index + ']').toggleClass(
									'clicked_btn1');
							count1++;
							if (count1 > 3) {
								alert('테마 및 선호 지역은 각각 최대 3개까지만 선택이 가능합니다.');
								$('.btn1[bt1-index!=' + index + ']')
										.toggleClass('clicked_btn1');
								$('.btn1[bt1-index!=' + (index + 1) + ']')
										.toggleClass('clicked_btn1');
								$('.btn1[bt1-index!=' + index + ']')
										.removeClass('clicked_btn1');
								count1 = 0;
							}
						});
				$('.btn2').each(function(index) {
					$(this).attr('btn2-index', index);
				}).click(
						function() {
							var index = $(this).attr('btn2-index');
							$('.btn2[btn2-index=' + index + ']').toggleClass(
									'clicked_btn2');
							count2++;
							if (count2 > 3) {
								alert('테마 및 선호 지역은 각각 최대 3개까지만 선택이 가능합니다.');
								$('.btn2[bt2-index!=' + index + ']')
										.toggleClass('clicked_btn2');
								$('.btn2[bt2-index!=' + (index + 1) + ']')
										.toggleClass('clicked_btn2');
								$('.btn2[bt2-index!=' + index + ']')
										.removeClass('clicked_btn2');
								count2 = 0;
							}
						});
			});
</script>

<body>
	<p class="join">회원가입</p>
	<hr>
	<br>
	<form action="#">
		<div class="join-wrapper">
			<table class="member">
				<tr>
					<td><label>이메일</label></td>
					<td><input type="email" class="enter"
						placeholder="ex) Email@Goot.co.kr" required /></td>
					<td><input type="button" class="certi" value="인증요청"></td>
				</tr>
				<tr>
					<td><label>비밀번호</label></td>
					<td><input type="password" class="enter"
						placeholder="비밀번호를 입력해주세요." pattern=".{5,20}" required /></td>
				</tr>
				<tr>
					<td><label>비밀번호확인</label></td>
					<td><input type="password" class="enter"
						placeholder="비밀번호를 한번 더 입력해주세요." pattern=".{5,20}" required /></td>
				</tr>
				<tr>
					<td><label>이름</label></td>
					<td><input type="text" class="enter" placeholder="이름을 입력해주세요."
						required /></td>
				</tr>
				<tr>
					<td><label>휴대폰</label></td>
					<td><input type="text" class="enter" placeholder="숫자만 입력해주세요."
						required /></td>
					<td><input type="button" class="certi" value="인증요청"></td>
				</tr>
				<tr>
					<td><label>주소</label></td>
					<td><input type="text" class="enter" id="sample4_roadAddress"
						placeholder="도로명주소"></td>
					<td><input type="button" class="certi"
						onclick="sample4_execDaumPostcode()" value="주소찾기"></td>
				</tr>
				<tr>
					<td><label></label></td>
					<td><input type="text" class="add_enter" id="sample4_postcode"
						placeholder="우편번호"> <input type="text" class="add_enter"
						id="sample4_jibunAddress" placeholder="지번주소"></td>
					<span id="guide" style="color: #999; display: none"></span>
				</tr>
				<tr>
					<td><label></label></td>
					<td><input type="text" class="add_enter"
						id="sample4_detailAddress" placeholder="상세주소"> <input
						type="text" class="add_enter" id="sample4_extraAddress"
						placeholder="참고항목"></td>
				</tr>
			</table>
		</div>
	</form>
	<br>
	<br>
	<hr>
	<br>
	<div class="select-wrapper">
		<table class="select">
			<tr>
				<td><label class="tema">테마</label></td>
				<td><button type="button" class="btn1">#등산</button>
					<button type="button" class="btn1">#바다</button>
					<button type="button" class="btn1">#도시</button>
					<button type="button" class="btn1">#계곡</button></td>
			</tr>
			<tr>
				<td><label></label></td>
				<td><button type="button" class="btn1">#레저</button>
					<button type="button" class="btn1">#문화</button>
					<button type="button" class="btn1">#맛집</button>
					<button type="button" class="btn1">#파티</button></td>
			</tr>
			<tr>
				<td><label class="tema">선호지역</label></td>
				<td><button type="button" class="btn2">#서울</button>
					<button type="button" class="btn2">#경기</button>
					<button type="button" class="btn2">#인천</button>
					<button type="button" class="btn2">#충청</button></td>
			</tr>
			<tr>
				<td><label></label></td>
				<td><button type="button" class="btn2">#강원</button>
					<button type="button" class="btn2">#경상</button>
					<button type="button" class="btn2">#전라</button>
					<button type="button" class="btn2">#제주</button></td>
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

	<br>
	<hr>
	<br>

	<div id="agreeForm">
		<table class="agree">
			<tr>
				<td id="agree_label"><label>이용약관동의</label></td>
				<td>
					<ul class="join_box">
						<li class="checkBox check01">
							<ul class="clearfix">
								<li class="checkAllBtn"><input type="checkbox"
									name="chkAll" id="chkAll" class="chkAll"> <span
									class="text">전체 동의합니다.</span></li>
							</ul>
						</li>
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<li class="checkBox check02">
						<ul class="clearfix">
							<li class="checkBtn"><input type="checkbox" name="chk"
								class="chk"> <span class="text">이용약관 동의 <strong>(필수)</strong></span>
							</li>
						</ul>
				</td>
				<td>
					<button id="btn-modal1">약관 보기 >></button>
					<div id="modal1" class="modal-overlay">
						<div class="modal-window">
							<div class="title">
								<div class="close-area">X</div>
								<p class="modal_title">이용약관 동의</p>
							</div>
							<div class="content">
								<p class="modal_content">
									동의? <br> 할거지? <br> 안할거야? <br> 왜? <br> 왜
									안하는거야? <br> 집착해도 될까? <br> 동의할 때까지 물어봐도 될까? <br>
									안하면 회원가입 못하는데? <br> 회원탈퇴는 안할거지? <br> 뭘 고민하는거야? <br>
									아직도 동의안해? <br> 아직도? <br> 이제 하지? <br>
								</p>
							</div>
							<div class="check_container">
								<button id="last_check">확인</button>
							</div>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
					</li>
					<li class="checkBox check03">
						<ul class="clearfix">
							<li class="checkBtn"><input type="checkbox" name="chk"
								class="chk"> <span class="text">개인정보 수집 및 이용에 대한
									안내 <strong>(필수)</strong>
							</span></li>
						</ul>
				</td>
				<td>
					<button id="btn-modal2">약관 보기 >></button>
					<div id="modal2" class="modal-overlay">
						<div class="modal-window">
							<div class="title">
								<div class="close-area">X</div>
								<p class="modal_title">개인정보 수집 및 이용에 대한 안내</p>
							</div>
							<div class="content">
								<p class="modal_content">동의?</p>
							</div>
							<div class="check_container">
								<button id="last_check">확인</button>
							</div>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
					</li>
					<li class="checkBox check03">
						<ul class="clearfix">
							<li class="checkBtn"><input type="checkbox" name="chk"
								class="chk"> <span class="text">이벤트 정보 수신 동의 <b>(선택)</b></span>
							</li>
						</ul>

				</li>
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<li class="checkBox check04">
						<ul class="clearfix">
							<li class="checkBtn"><input type="checkbox" name="chk"
								class="chk"> <span class="text">제 3자 정보 제공 동의 <b>(선택)</b></span>
							</li>
						</ul>
				</li>
					</ul>
				</td>
			</tr>
		</table>
		</form>

		<br> <br>
		<hr>
		<br> <br>

		<div class="join_cancel">
			<input type="submit" value="회원가입" class="join_btn"> <input
				type="submit" value="취소" class="join_btn">
		</div>

		<br> <br>
		<script src="../../../resources/js/user/join_user.js"></script>
</body>
</html>