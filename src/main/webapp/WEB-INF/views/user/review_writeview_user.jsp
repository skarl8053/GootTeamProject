<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<title>Document</title>
<script>
	function reratinglist(target) {
		alert("target : " + target.value);
		var htmltxt = "";
		//var pointvalue=document.getElementById("rating").value;
		$('input[name=review_rate]').attr('value', target.value);

	}
</script>
<script src="resources/js/user/star_user.js"></script>
<script type="text/javascript">
	function getvalue(target) {
		alert(target.value);
	}
</script>

<link rel="stylesheet" href="/travel/resources/css/user/reviewTReg_user.css" />



</head>
<body>

	<form action="review_write_user" method="post" enctype="multipart/form-data">
		<div class="container">
			<div class="a">
				<div class="repl">후기 남기기</div>
			</div>
			<div class="b">
				<div class="bname">
					숙소명(예약정보에서 가져와야함)<input type="text" name="s_no" value="51" />
				</div>

				<div class="binfor">
					객실정보(예약정보에서 가져와야함)<input type="text" name="r_no" value="589" />
				</div>

				<span class="star"> ★★★★★ <span>★★★★★</span> <input
					type="range" onclick="reratinglist(this);" oninput="drawStar(this)"
					value="1" step="1" min="1" max="5">
				</span><input type="hidden" name="review_rate" value="" size="20" />
			</div>

			<div class="d">

				<div class="dl">후기</div>
				<div class="dr">
					<div>
						사진업로드 <input type="file" name="file" />
					</div>

				</div>
				<div class="db">
					<textarea name="review_content" id="review_text" cols="150" rows="3">Cooooool</textarea>
				</div>
			</div>

			<input type="hidden" name="m_no" value="55" /> 
			<input type="submit" value="submit" />
	</form>
	<a href="review_list_user">목록</a>
	</div>
</body>
</html>
