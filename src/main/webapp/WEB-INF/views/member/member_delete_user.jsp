<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>È¸¿øÅ»Åð</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/user/delete_user.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />

</head>



<body>
	<div class="withdraw-wrapper">
		<p class="withdraw">È¸¿øÅ»Åð</p>
		<hr />
		<br>
		<form action="deleting" id="delete-form">
<<<<<<< HEAD
			<input type="password" id="pw" name="pw" placeholder="Password">
=======
			<input type="password" id="pw" name="pw" placeholder="Password" autocomplete="off">
>>>>>>> b5b96998bbca96d31499d5b7b1283fc2589b187e
			<i class="fa-solid fa-eye fa-2xl"></i>
	</div>
	<div id="container">
		<input id="btn-modal" value="È¸¿øÅ»Åð"> <a href="#"
			class="cancel_tag">
			<p class="cancel_text">Ãë¼Ò</p>
		</a>
	</div>
	<div id="modal" class="modal-overlay">
		<div class="modal-window">
			<div class="title">
				<div class="close-area">X</div>
				<p class="modal_title">È¸¿øÅ»Åð</p>
			</div>
			<div class="content">
				<p class="modal_content">
					Á¤¸» È¸¿øÅ»Åð¸¦ ÇÏ°Ú´Â°¡? <br> ÈÄÈ¸ ¾ÈÇÏ°Ú´Â°¡?
				</p>
			</div>
			<div class="check_container">
				<input type="submit" id="last_check" value="Å»Åð"></input>
			</div>
			</form>
		</div>
	</div>


</body>

<!-- ¸Þ¼¼Áö -->
	<c:if test="${not empty msg}">
			
		<script>
			alert("${msg}");
		</script>
		
	</c:if>

<script>

<% String errorMessage = (String) session.getAttribute("errorMessage");
if (errorMessage != null) { %>
 document.getElementById("errorMessage").textContent = '<%= errorMessage %>';
<% session.removeAttribute("errorMessage"); // Remove the error message after displaying %>
<% } %>


	const modal = document.getElementById("modal")
	const btnModal = document.getElementById("btn-modal")
	btnModal.addEventListener("click", e => {
		modal.style.display = "flex"
	})

	const closeBtn = modal.querySelector(".close-area")
	closeBtn.addEventListener("click", e => {
		modal.style.display = "none"
	})

	modal.addEventListener("click", e => {
		const evTarget = e.target
		if (evTarget.classList.contains("modal-overlay")) {
			modal.style.display = "none"
		}
	})
	window.addEventListener("keyup", e => {
		if (modal.style.display === "flex" && e.key === "Escape") {
			modal.style.display = "none"
		}
	})

	$(document).ready(function(){
    $('.withdraw-wrapper i').on('click',function(){
        $('input').toggleClass('active');
        if($('input').hasClass('active')){
            $(this).attr('class',"fa-solid fa-eye-slash fa-2xl")
            .prev('input').attr('type',"text");
        }else{
            $(this).attr('class',"fa-solid fa-eye fa-2xl")
            .prev('input').attr('type','password');
        }
    });
});
	
</script>


</html>