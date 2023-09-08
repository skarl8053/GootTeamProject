<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ȸ������ ȭ��</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/user/join_user.css" />
</head>

<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>



<body>
	<p class="join">ȸ������</p>
	<hr>
	<br>
	<form action="joining" onsubmit="return insertBeforeCheck();" id="form">
		<input type="hidden" name="all_tema" id="all_tema" value=""/>
		<input type="hidden" name="all_area" id="all_area" value=""/>

		<div class="join-wrapper">
			<table class="member">
				<tr>
					<td><label>�̸���</label></td>
					<td><input type="email" class="enter" name="m_email" id="m_email" 
						placeholder="�̸����� �Է����ּ���."  autocomplete="off"/>
					</td>
					<td><input type="button" class="certi" id="check_email" onclick="checking()" value="�ߺ�Ȯ��"></td>	
				</tr>
				<tr>
				<td><label style="display:none;"></label></td>
				<td>
				<span id="check_text" class="check_text"></span>
				</td>
				</tr>
				<tr>
					<td><label>��й�ȣ</label></td>
					<td><input type="password" class="enter" name="m_pw" id="m_pw"
						placeholder="��й�ȣ�� �Է����ּ���." /> </td>
				</tr>
				<tr>
					<td><label style="display:none;"></label></td>
					<td><span id="StrengthDisp"></span></td>
				</tr>
				<tr>
					<td><label>��й�ȣȮ��</label></td>
					<td><input type="password" class="enter" name="m_pw2" 
						id="m_pw2" placeholder="��й�ȣ�� �ѹ� �� �Է����ּ���." /></td>
				</tr>
				<tr>
					<td><label>�̸�</label></td>
					<td><input type="text" class="enter" name="m_name" 
						placeholder="�̸��� �Է����ּ���." autocomplete="off"/></td>
				</tr>
				<tr>
					<td><label>�޴���</label></td>
					<td><input type="text" oninput="inputNumberOnly(this)" class="enter" name="m_tel" id="m_tel" 
					maxlength="11"  placeholder="���ڸ� �Է����ּ���." autocomplete="off"/></td>
				</tr>
				<tr>
					<td><label>�ּ�</label></td>
					<td><input type="text" class="enter" id="m_roadAddress" 
						name="m_roadAddress" placeholder="���θ��ּ�" readonly autocomplete="off"></td>
					<td><input type="button" class="certi"
						onclick="execDaumPostcode()" value="�ּ�ã��"></td>
				</tr>
				<tr>
					<td><label></label></td>
					<td>
						<input type="text" class="enter" 
						id="m_detailAddress" placeholder="���ּ�"
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
					<td><label class="tema" id="tema">�׸�</label></td>
					<td><button type="button" class="btn1" name="tema" value="1">#���</button>
						<button type="button" class="btn1" name="tema" value="2" >#�ٴ�</button>
						<button type="button" class="btn1" name="tema" value="3">#����</button>
						<button type="button" class="btn1" name="tema" value="4">#���</button></td>
				</tr>
				<tr>
					<td><label></label></td>
					<td><button type="button" class="btn1" name="tema" value="5">#����</button>
						<button type="button" class="btn1" name="tema" value="6">#��ȭ</button>
						<button type="button" class="btn1" name="tema" value="7">#����</button>
						<button type="button" class="btn1" name="tema" value="8">#��Ƽ</button></td>
				</tr>
				<tr>
					<td><label class="tema" id="area">��ȣ����</label></td>
					<td><button type="button" class="btn2" name="area" value="1">#����</button>
						<button type="button" class="btn2" name="area" value="2">#���</button>
						<button type="button" class="btn2" name="area" value="3">#��õ</button>
						<button type="button" class="btn2" name="area" value="4">#��û</button></td>
				</tr>
				<tr>
					<td><label></label></td>
					<td><button type="button" class="btn2" name="area" value="5">#����</button>
						<button type="button" class="btn2" name="area" value="6">#���</button>
						<button type="button" class="btn2" name="area" value="7">#����</button>
						<button type="button" class="btn2" name="area" value="8">#����</button></td>
				</tr>
				<tr>
					<td><label></label></td>
				</tr>


				<tr>
					<td colspan="2"><span class="tema_area">�� �׸� �� ��ȣ������ ����
							<b>�ִ� 3��</b>���� �����Ͻ� �� �ֽ��ϴ�.
					</span></td>
				</tr>

			</table>
		</div>

		<br>
		<hr>
		<br>

		<table class="agree">

			<tr>
				<td id="agree_label"><label>�̿�������</label></td>
				<td>
					<div class="terms__check__all">
						<input type="checkbox" name="checkAll" id="checkAll" class="chk"/>
						<label for="checkAll" class="required" id="label_font">���
							�����մϴ�.</label>
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
									class="required" id="label_font">�̿��� ���� <strong>(�ʼ�)</strong></label>
							</div>
						</li>
				</td>
				<td>
					<button type="button" id="btn-modal1">��� ���� >></button>
					<div id="modal1" class="modal-overlay">
						<div class="modal-window">
							<div class="title">
								<div class="close-area">X</div>
								<p class="modal_title">�̿��� ����</p>
							</div>
							<div class="content">
								<p class="modal_content">
									����? <br> �Ұ���? <br> ���Ұž�? <br> ��? <br> ��
									���ϴ°ž�? <br> �����ص� �ɱ�? <br> ������ ������ ������� �ɱ�? <br>
									���ϸ� ȸ������ ���ϴµ�? <br> ȸ��Ż��� ���Ұ���? <br> �� ����ϴ°ž�? <br>
									������ ���Ǿ���? <br> ������? <br> ���� ����? <br>
								</p>
							</div>
							<div class="check_container">
								<button type="button" class="last_check">Ȯ��</button>
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
								class="required" id="label_font">�������� ���� �� �̿뿡 ���� �ȳ� <strong>(�ʼ�)</strong></label>
						</div>
				</li>
				</td>
				<td>
					<button type="button" id="btn-modal2">��� ���� >></button>
					<div id="modal2" class="modal-overlay">
						<div class="modal-window">
							<div class="title">
								<div class="close-area">X</div>
								<p class="modal_title">�������� ���� �� �̿뿡 ���� �ȳ�</p>
							</div>
							<div class="content">
								<p class="modal_content">����?</p>
							</div>
							<div class="check_container">
								<button type="button" class="last_check">Ȯ��</button>
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
								id="label_font">�̺�Ʈ ���� ���� ���� <b>(����)</b>
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
			<button type="submit" class="join_button" id="join_button" disabled>ȸ������</button>
			<a href="${pageContext.request.contextPath }/main" id="cancel_button">���</a>
		</div>
		<br />
		<br />
			
	</form>
</body>

<script src="${pageContext.request.contextPath }/resources/js/user/join_user.js"></script>


</html>