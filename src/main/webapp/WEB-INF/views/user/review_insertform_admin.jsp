<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	
	<!-- 개별 화면 content 크기를 조절하는 방법 -->
	<style>
		#content{
			height: 1300px;
		}
		
		textarea{
			resize: none;
		}
		
	</style>
	
</head>
<body>
	
	<script>

        function reportCheck()
        {
            // 신고 내용을 모두 작성했는지 확인

            var report_content = document.getElementById("report_content").value;

            if(report_content.length < 1)
            {
                alert("신고 내용을 입력해주세요");
                return false;
            }

            if(report_content.length > 1000)
            {
                alert("내용은 1000자를 넘을 수 없습니다.");
                return false;
            }

            var message = confirm("해당 내용을 신고하시겠습니까? 신고하시면 취소할 수 없습니다.");

            if(message == false)
            {
                return false;
            }
        }

    </script>

    <h1>신고 작성</h1>

    <br>

    <div>
        <form action="reportinsert" onsubmit="return reportCheck()" method="post">

			<!-- 앞 화면에서 후기번호 가져옴.. -->
            <input type="hidden" name="review_no" value="1">

            <div>
                <span>
                    <p>신고 사유 :</p> 
                </span>
                <span>
                    <select id="report_type" name="report_type">
                        <option value="1">욕설/인신공격</option>
                        <option value="2">성희롱</option>
                        <option value="3">내용도배</option>
                        <option value="4">불법광고</option>
                        <option value="5">허위내용</option>
                        <option value="6">개인정보 노출</option>
                    </select>
                </span>
            </div>
            <br>
            <div>
                <div>
                    <p>신고 내용 :</p> 
                </div>
                <div>
                    <textarea id="report_content" name="report_content" cols="100px" rows="30px"></textarea>
                </div>
            </div>
            <div>
                <br>
                <input type="submit" value="신고">
            </div>
        </form>
    </div>
	
</body>
</html>