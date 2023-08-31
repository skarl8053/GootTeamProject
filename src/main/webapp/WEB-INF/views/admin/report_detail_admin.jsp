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
			height: 1000px;
		}
	</style>
	
</head>
<body>

	<style>

        #reportdetail{
            width: 1200px;
        }
        table{
            border-collapse: collapse;
            width: 1150px;
            border: 1px solid black;
        }
        tr td{
            border: 1px solid black;
            padding: 0 0 0 10px;
        }
        .firstCol{
            width: 10%;
            height: 50px;
            text-align: center;
        }
        .secondCol{
            width: 40%;
        }
        .thirdCol{
            width: 10%;
            text-align: center;
        }
        .forthCol{
            width: 40%;
        }
        textarea{
            width: 99.5%;
            height: 100%;
            resize: none;
            border-style: none;
        }
        button{
        	
        	background-color: blue;
            color: white;
            font-weight: bold;
            border-radius: 3px;
            width: 100px;
            height: 32px;
            cursor: pointer;
        	
        }

    </style>

    <h1>신고 상세내용</h1>
    <div id="reportdetail">
        <div>
            <table>
                <tr>
                	<td class="firstCol">신고 번호</td>
                    <td class="secondCol">${list.report_no}</td>
                    <td class="thirdCol" >차단 여부</td>
                    <td class="forthCol" style="color: red;">${list.restrict_name}</td>
                </tr>
                <tr>
                    <td class="firstCol">작성자 ID</td>
                    <td colspan="3" class="secondCol" style="color: red;">${list.m_email}</td>
                </tr>
                <tr>
                    <td class="firstCol">숙소명</td>
                    <td colspan="3" class="secondCol">${list.s_name}</td>
                </tr>
                <tr>
                    <td class="firstCol">신고 타입</td>
                    <td class="secondCol">${list.report_type}</td>
                    <td class="thirdCol">신고 일자</td>
                    <td class="forthCol">${list.report_date}</td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center; height: 50px">댓글 작성내용</td>
                </tr>
                <tr>
                    <td colspan="4">
                        <textarea rows="15" readonly>${list.review_content}</textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center; height: 50px">신고 내용</td>
                </tr>
                <tr>
                    <td colspan="4">
                        <textarea rows="15" readonly>${list.report_content}</textarea>
                    </td>
                </tr>
            </table>
        </div>
        <br>
        <div>
            <button type="button" onclick="location.replace('report')">뒤로 가기</button>
        </div>
        
    </div>
	
</body>
</html>