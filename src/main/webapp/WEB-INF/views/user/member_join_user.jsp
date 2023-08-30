<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ȸ������ ȭ��</title>
<link rel="stylesheet" href="../../../resources/css/user/join_user.css" />
</head>

<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<!-- �׸� �� ���� ���� -->
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
								alert('�׸� �� ��ȣ ������ ���� �ִ� 3�������� ������ �����մϴ�.');
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
								alert('�׸� �� ��ȣ ������ ���� �ִ� 3�������� ������ �����մϴ�.');
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
	<p class="join">ȸ������</p>
	<hr>
	<br>
	<form action="#">
		<div class="join-wrapper">
			<table class="member">
				<tr>
					<td><label>�̸���</label></td>
					<td><input type="email" class="enter"
						placeholder="ex) Email@Goot.co.kr" required /></td>
					<td><input type="button" class="certi" value="������û"></td>
				</tr>
				<tr>
					<td><label>��й�ȣ</label></td>
					<td><input type="password" class="enter"
						placeholder="��й�ȣ�� �Է����ּ���." pattern=".{5,20}" required /></td>
				</tr>
				<tr>
					<td><label>��й�ȣȮ��</label></td>
					<td><input type="password" class="enter"
						placeholder="��й�ȣ�� �ѹ� �� �Է����ּ���." pattern=".{5,20}" required /></td>
				</tr>
				<tr>
					<td><label>�̸�</label></td>
					<td><input type="text" class="enter" placeholder="�̸��� �Է����ּ���."
						required /></td>
				</tr>
				<tr>
					<td><label>�޴���</label></td>
					<td><input type="text" class="enter" placeholder="���ڸ� �Է����ּ���."
						required /></td>
					<td><input type="button" class="certi" value="������û"></td>
				</tr>
				<tr>
					<td><label>�ּ�</label></td>
					<td><input type="text" class="enter" id="sample4_roadAddress"
						placeholder="���θ��ּ�"></td>
					<td><input type="button" class="certi"
						onclick="sample4_execDaumPostcode()" value="�ּ�ã��"></td>
				</tr>
				<tr>
					<td><label></label></td>
					<td><input type="text" class="add_enter" id="sample4_postcode"
						placeholder="�����ȣ"> <input type="text" class="add_enter"
						id="sample4_jibunAddress" placeholder="�����ּ�"></td>
					<span id="guide" style="color: #999; display: none"></span>
				</tr>
				<tr>
					<td><label></label></td>
					<td><input type="text" class="add_enter"
						id="sample4_detailAddress" placeholder="���ּ�"> <input
						type="text" class="add_enter" id="sample4_extraAddress"
						placeholder="�����׸�"></td>
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
				<td><label class="tema">�׸�</label></td>
				<td><button type="button" class="btn1">#���</button>
					<button type="button" class="btn1">#�ٴ�</button>
					<button type="button" class="btn1">#����</button>
					<button type="button" class="btn1">#���</button></td>
			</tr>
			<tr>
				<td><label></label></td>
				<td><button type="button" class="btn1">#����</button>
					<button type="button" class="btn1">#��ȭ</button>
					<button type="button" class="btn1">#����</button>
					<button type="button" class="btn1">#��Ƽ</button></td>
			</tr>
			<tr>
				<td><label class="tema">��ȣ����</label></td>
				<td><button type="button" class="btn2">#����</button>
					<button type="button" class="btn2">#���</button>
					<button type="button" class="btn2">#��õ</button>
					<button type="button" class="btn2">#��û</button></td>
			</tr>
			<tr>
				<td><label></label></td>
				<td><button type="button" class="btn2">#����</button>
					<button type="button" class="btn2">#���</button>
					<button type="button" class="btn2">#����</button>
					<button type="button" class="btn2">#����</button></td>
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

	<div id="agreeForm">
		<table class="agree">
			<tr>
				<td id="agree_label"><label>�̿�������</label></td>
				<td>
					<ul class="join_box">
						<li class="checkBox check01">
							<ul class="clearfix">
								<li class="checkAllBtn"><input type="checkbox"
									name="chkAll" id="chkAll" class="chkAll"> <span
									class="text">��ü �����մϴ�.</span></li>
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
								class="chk"> <span class="text">�̿��� ���� <strong>(�ʼ�)</strong></span>
							</li>
						</ul>
				</td>
				<td>
					<button id="btn-modal1">��� ���� >></button>
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
								<button id="last_check">Ȯ��</button>
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
								class="chk"> <span class="text">�������� ���� �� �̿뿡 ����
									�ȳ� <strong>(�ʼ�)</strong>
							</span></li>
						</ul>
				</td>
				<td>
					<button id="btn-modal2">��� ���� >></button>
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
								<button id="last_check">Ȯ��</button>
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
								class="chk"> <span class="text">�̺�Ʈ ���� ���� ���� <b>(����)</b></span>
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
								class="chk"> <span class="text">�� 3�� ���� ���� ���� <b>(����)</b></span>
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
			<input type="submit" value="ȸ������" class="join_btn"> <input
				type="submit" value="���" class="join_btn">
		</div>

		<br> <br>
		<script src="../../../resources/js/user/join_user.js"></script>
</body>
</html>