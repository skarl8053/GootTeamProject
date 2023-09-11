<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>���������� ȸ������</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/user/mypage_info.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
</head>
<style>
#content {
	width: auto;
	height: auto;
}
</style>
<body>
	<div id="con">
		<div id="menu">
			<nav>
				<ul>
					<li id="MyPage_text">
						<p id="MyPage">My Page</p>
						<hr id="menu_bar">
					</li>
					<li class="page_list"><a href="./mypage_info" class="menu"
						id="info">�⺻ ȸ�� ����</a> <br></li>
					<li class="page_list"><a href="./mypage_pay" class="menu"
						id="pay">���� ����</a> <br></li>
					<li class="page_list"><a href="./mypage_review" class="menu"
						id="review">���� �ı�</a> <br></li>
					<li class="page_list"><a href="./mypage_event" class="menu"
						id="event">�̺�Ʈ</a> <br></li>
					<li class="page_list"><a href="./mypage_point" class="menu"
						id="coupon">����Ʈ / ����</a> <br></li>
				</ul>
			</nav>
		</div>
		<div id="Whole">
			<div id="title">
				�⺻ ȸ�� ����
				<hr>
			</div>
			<div id="table">
				<table>

					<tr>
						<td><label>�̸���</label></td>
						<td><input type="email" class="enter" name="m_email"
							id="m_email" value="${m_email }" disabled /></td>
					</tr>
					<tr>
						<td><label>�̸�</label></td>
						<td><input type="text" class="enter" name="m_name"
							id="m_name" value="${m_name }" disabled /></td>
					</tr>
					<tr>
						<td><label>��ȭ��ȣ</label></td>
						<td><input type="text" class="enter" name="m_tel" id="m_tel"
							value="${m_tel }" disabled /></td>
					</tr>
					<tr>
						<td><label>�ּ�</label></td>
						<td><input type="text" class="enter" name="m_address"
							value="${m_address }" disabled /></td>
						<td><a href="../member/modify?m_no?=${sessionScope.m_no }" id="Fix">ȸ����������</a></td>
					</tr>
				</table>
			</div>
			<div id="delete">
				<hr>
				<br>
				<br>
				<p id="delete_text">
					ȸ��Ż�� ���Ͻø� ȸ��Ż�� ��ư�� �����ּ���. <a href="../member/delete?m_no=${sessionScope.m_no }"
						id="delete_btn">ȸ��Ż��</a>
				</p>
			</div>
		</div>
	</div>
</body>
<script>

// ��ȭ��ȣ ����

function formatPhoneNumber(phoneNumber) {
    if (phoneNumber && phoneNumber.length === 11) {
        return phoneNumber.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
    }
    return phoneNumber;
}

const phoneNumberField = document.getElementById('m_tel');

phoneNumberField.value = formatPhoneNumber(phoneNumberField.value);
</script>


</html>