<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 화면</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/user/join_user.css" />
</head>

<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>



<body>
	<p class="join">회원가입</p>
	<hr>
	<br>
	<form action="joining" onsubmit="return insertBeforeCheck();" id="form">
		<input type="hidden" name="all_tema" id="all_tema" value=""/>
		<input type="hidden" name="all_area" id="all_area" value=""/>

		<div class="join-wrapper">
			<table class="member">
				<tr>
					<td><label>이메일</label></td>
					<td><input type="email" class="enter" name="m_email" id="m_email" 
						placeholder="이메일을 입력해주세요."  autocomplete="off"/>
					</td>
					<td><input type="button" class="certi" id="check_email" onclick="checking()" value="중복확인"></td>	
				</tr>
				<tr>
				<td><label style="display:none;"></label></td>
				<td>
				<span id="check_text" class="check_text"></span>
				</td>
				</tr>
				<tr>
					<td><label>비밀번호</label></td>
					<td><input type="password" class="enter" name="m_pw" id="m_pw"
						placeholder="비밀번호를 입력해주세요." /> </td>
				</tr>
				<tr>
					<td><label style="display:none;"></label></td>
					<td><span id="StrengthDisp"></span></td>
				</tr>
				<tr>
					<td><label>비밀번호확인</label></td>
					<td><input type="password" class="enter" name="m_pw2" 
						id="m_pw2" placeholder="비밀번호를 한번 더 입력해주세요." /></td>
				</tr>
				<tr>
					<td><label>이름</label></td>
					<td><input type="text" class="enter" name="m_name"  id="m_name" 
						placeholder="이름을 입력해주세요." autocomplete="off"/></td>
				</tr>
				<tr>
					<td><label>휴대폰</label></td>
					<td><input type="text" oninput="inputNumberOnly(this)" class="enter" name="m_tel" id="m_tel" 
					maxlength="11"  placeholder="숫자만 입력해주세요." autocomplete="off"/></td>
				</tr>
				<tr>
					<td><label>주소</label></td>
					<td><input type="text" class="enter" id="m_roadAddress" 
						name="m_roadAddress" placeholder="도로명주소" readonly autocomplete="off"></td>
					<td><input type="button" class="certi"
						onclick="execDaumPostcode()" value="주소찾기"></td>
				</tr>
				<tr>
					<td><label></label></td>
					<td>
						<input type="text" class="enter" 
						id="m_detailAddress" placeholder="상세주소"
						name="m_detailAddress" autocomplete="off">
					</td>
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
					<td><button type="button" class="btn1" name="tema" value="1">#등산</button>
						<button type="button" class="btn1" name="tema" value="2" >#바다</button>
						<button type="button" class="btn1" name="tema" value="3">#도시</button>
						<button type="button" class="btn1" name="tema" value="4">#계곡</button></td>
				</tr>
				<tr>
					<td><label></label></td>
					<td><button type="button" class="btn1" name="tema" value="5">#레저</button>
						<button type="button" class="btn1" name="tema" value="6">#문화</button>
						<button type="button" class="btn1" name="tema" value="7">#맛집</button>
						<button type="button" class="btn1" name="tema" value="8">#파티</button></td>
				</tr>
				<tr>
					<td><label class="tema" id="area">선호지역</label></td>
					<td><button type="button" class="btn2" name="area" value="1">#서울</button>
						<button type="button" class="btn2" name="area" value="2">#경기</button>
						<button type="button" class="btn2" name="area" value="3">#인천</button>
						<button type="button" class="btn2" name="area" value="4">#충청</button></td>
				</tr>
				<tr>
					<td><label></label></td>
					<td><button type="button" class="btn2" name="area" value="5">#강원</button>
						<button type="button" class="btn2" name="area" value="6">#경상</button>
						<button type="button" class="btn2" name="area" value="7">#전라</button>
						<button type="button" class="btn2" name="area" value="8">#제주</button></td>
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

		<table class="agree">

			<tr>
				<td id="agree_label"><label>이용약관동의</label></td>
				<td>
					<div class="terms__check__all">
						<input type="checkbox" name="checkAll" id="checkAll" class="chk"/>
						<label for="checkAll" class="required" id="label_font">모두
							동의합니다.</label>
					</div>
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<ul class="terms__list">
						<li class="terms__box">
							<div class="input__check">
								<input type="checkbox" name="agreement" id="termsOfService"
									class="chk"  required/> <label for="termsOfService" 
									class="required" id="label_font">이용약관 동의 <strong>(필수)</strong></label>
							</div>
						</li>
				</td>
				<td>
					<button type="button" id="btn-modal1">약관 보기 >></button>
					<div id="modal1" class="modal-overlay">
						<div class="modal-window">
							<div class="title">
								<div class="close-area">X</div>
								<p class="modal_title">이용약관 동의</p>
							</div>
							<div class="content">
								<p class="modal_content">동의?   <!-- <br /> 태그 필요없음 -->
									할거지? 
									안할거야?
									왜? 
									왜 안하는거야? 
									집착해도 될까?
									동의할 때까지 물어봐도 될까? 동의할 때까지 물어봐도 될까?
									안하면 회원가입 못하는데? 
									회원탈퇴는 안할거지? 
									뭘 고민하는거야? 
									아직도 동의안해? 
									아직도? 
									이제 하지? 
									과연 늘어나나? 
									늘어나야해 
									늘어난다!
								</p>
							</div>
							<div class="check_container">
								<button type="button" class="last_check">확인</button>
							</div>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<li class="terms__box">
						<div class="input__check">
							<input type="checkbox" name="agreement" id="privacyPolicy" 
								class="chk" required /> <label for="privacyPolicy"
								class="required" id="label_font">개인정보 수집 및 이용에 대한 안내 <strong>(필수)</strong></label>
						</div>
				</li>
				</td>
				<td>
					<button type="button" id="btn-modal2">약관 보기 >></button>
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
								<button type="button" class="last_check">확인</button>
							</div>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<li class="terms__box">
						<div class="input__check">
							<input type="checkbox" name="m_marketing" id="allowPromotions"
								class="chk"/> <label for="allowPromotions"
								id="label_font">이벤트 정보 수신 동의 <b>(선택)</b>
							</label>
						</div>
				</li>
				</td>
				</ul>
			</tr>

		</table>
		<br />
		<hr />
		<br />
		<div class="join_cancel">
			<button type="submit" class="join_button" id="join_button" disabled>회원가입</button>
			<a href="${pageContext.request.contextPath }/main" id="cancel_button">취소</a>
		</div>
		<br />
		<br />
			
	</form>
</body>

<script src="${pageContext.request.contextPath }/resources/js/user/join_user.js"></script>


</html>