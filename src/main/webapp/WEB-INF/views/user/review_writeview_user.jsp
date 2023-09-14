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
		/* alert("target : " + target.value); */
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
<script>

        function reviewCheck()
        {
            // 후기 내용을 모두 작성했는지 확인

            var review_content = document.getElementById("review_text").value;

            if(review_content.length < 1)
            {
                alert("후기 내용을 입력해주세요");
                return false;
            }

            if(review_content.length > 175)
            {
                alert("후기 내용은 175자를 넘을 수 없습니다.");
                return false;
            }
            
            var review_rate = document.getElementById("review_rate").value;
            
            if (review_rate.length < 1) {
            	 alert("평점을 클릭해주세요");
                 return false;
			}
           
        }

    </script>


</head>
<body>

	<form action="review_write_user" onsubmit="return reviewCheck()" method="post" enctype="multipart/form-data">
		<div class="content">
			<div class="a">
				<div class="repl">후기 남기기</div>
			</div>
			<div class="b">
				<div class="bname">
					숙소 : ${srName[0].s_name }
				</div>

				<div class="binfor">
					객실 : ${srName[0].r_name }
				</div>

				<span class="star"> ★★★★★ <span>★★★★★</span> <input
					type="range" onclick="reratinglist(this);" oninput="drawStar(this)"
					value="1" step="1" min="1" max="5">
				</span><input type="hidden" name="review_rate" id="review_rate" value="" size="20" />
			</div>

			<div class="d">

				<div class="dl">후기</div>
				<div class="dr">
					<div>
						사진업로드 <input type="file" name="file" />
					</div>

				</div>
				<div class="db">
					<textarea name="review_content" id="review_text" cols="143" rows="3"></textarea>
				</div>
			</div>
			
			<input type="hidden" name="m_no" value=${m_no } /> 
			<input type="hidden" name="r_no" value=${r_no } /> 
			<input type="hidden" name="s_no" value=${s_no } /> 
			<input type="hidden" name="order_no" value=${order_no } /> 
			<input type="submit" value="저장" />
	</form>
	<button class="button-24" role="button"><a href="mypage_pay">취소</a></button>
	</div>
</body>
</html>
