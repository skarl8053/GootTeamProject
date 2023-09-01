<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
		<form id="withdraw-form">
			<input type="password" name="pw" placeholder="Password">
		<i class="fa-solid fa-eye fa-2xl"></i>
		</form>
	</div>
	<div id="container">
		<button id="btn-modal">È¸¿ø Å»Åð</button>
		<a href="#" class="cancel_tag">
			<p class="cancel_text">Ãë¼Ò</p>
		</a>
	</div>
	<div id="modal" class="modal-overlay">
		<form action="deleting">
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

<script>
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