<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>���̵�/��й�ȣ ã��</title>
</head>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/find_user.css" />


<body>
	<div class="box">
		<!--div�� �ΰ� ���������� img���� �¿��ġ�ϰ� ��ġ�� ������ ���常 ���̰� �ϱ� ���ؼ��̴�.-->
		<div class="button_box">
			<button class="bt_find_id">���̵� ã��</button>
			<button class="bt_find_pw">��й�ȣ ã��</button>
			
		</div>
		<div class="slide"> <!--��ġ�� img���� �ϳ��� img�� ���̰� ������ ���� �±�-->
			<div class="images"> <!--img���� �¿��ġ�� �±�-->
				<div class="id1">
					<div class="find_id">
						<label class="id_phone" for="id_phone">�ڵ��� ����</label>
						<label class="id_email" for="id_email">�̸��� ����</label>
						<input id="id_phone" type="checkbox">
						<input id="id_email" type="checkbox">
						<div id="id_phone_box">
							<div id="id_phone_box_text">
								�̸� <br><input type="text"> <br><br>
								�ڵ��� ��ȣ <br><input type="text">
								<input type="submit" value="����" id="check">
							</div>
						</div>
						<div id="id_email_box">
							<div id="id_email_box_text">
								�̸� <br><input type="text"> <br><br>
								�̸��� <br><input type="text">
								<input type="submit" value="����" id="check">
							</div>
						</div>
					</div>
				</div>
				<div class="pw1">
					<div class="find_pw">
						<label class="pw_phone" for="pw_phone">�ڵ��� ����</label>
						<label class="pw_email" for="pw_email">�̸��� ����</label>
						<input id="pw_phone" type="checkbox">
						<input id="pw_email" type="checkbox">
						<div id="pw_phone_box">
							<div id="pw_phone_box_text">
								�̸��� <br><input type="text"> <br><br>
								�ڵ��� ��ȣ <br><input type="text">
								<input type="submit" value="����" id="check">
							</div>
						</div>
						<div id="pw_email_box">
							<div id="pw_email_box_text">
								�̸� <br><input type="text"> <br><br>
								�̸��� <br><input type="text">
								<input type="submit" value="����" id="check">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="under">
		<br>
			<a href="login">�α���</a> / <a href="join">ȸ������</a> / <a href="${pageContext.request.contextPath }/main">���� ������</a>
	</div>

</body>
	<script src="${pageContext.request.contextPath }/resources/js/user/find_user.js"></script>

</html>