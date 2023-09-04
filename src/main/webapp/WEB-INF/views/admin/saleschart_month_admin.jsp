<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<!-- ChartJS -->
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>  
	
	<!-- 개별 화면 content 크기를 조절하는 방법 -->
	<style>
		#content{
			height: 900px;
		}
	</style>
	
</head>
<body>

	<style>
	
		@font-face {
		    font-family: 'GmarketSansMedium';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
		body{
			font-family: 'GmarketSansMedium'
		}
        #form{
            width: 1200px;
        }
        #s_name{
        	width: 300px;
        	height: 25px;
        	margin: 0 5px;
        }
        #year{
        	width: 100px;
        	height: 30px;
        	margin: 0 5px;
        }
        #month{
        	width: 100px;
        	height: 30px;
        	margin: 0 5px;
        }
        #button{
        	background-color: blue;
			color: white;
			font-weight: bold;
			border-radius: 3px;
			width: 100px;
			height: 32px;
			cursor: pointer;
        }
    </style>

    <script>

	    $(document).ready(function(){
	        setYearSelectBox();
            setMonthSelectBox();
	    });    
	
	    function setYearSelectBox(){
	        var now = new Date();
	        var now_year = now.getFullYear();
	        
	        var selectedYear = "${param.year}";
	        
	        $("#year").append("<option value=''>연도 선택</option>");
	        
	        if(selectedYear == null){
		        for(var i = now_year; i >= now_year - 10; i--){
		            $("#year").append("<option value='"+ i +"'>"+ i +"</option>");
		        }
	        }
	        else{
	        	for(var i = now_year; i >= now_year - 10; i--){
	        		if(selectedYear == i){
	        			$("#year").append("<option value='"+ i +"' selected>"+ i +"</option>");
	        		}
	        		else{
	        			$("#year").append("<option value='"+ i +"'>"+ i +"</option>");
	        		}
		        }
	        }
	    }
	    
        function setMonthSelectBox(){
	        var now = new Date();
	        
	        var selectedMonth = "${param.month}";
	        
	        $("#month").append("<option value=''>월 선택</option>");
	        
	        if(selectedMonth == null){
		        for(var i = 1; i <= 12; i++){
		            $("#month").append("<option value='"+ i +"'>"+ i +"</option>");
		        }
	        }
	        else{
	        	for(var i = 1; i <= 12; i++){
	        		if(selectedMonth == i){
	        			$("#month").append("<option value='"+ i +"' selected>"+ i +"</option>");
	        		}
	        		else{
	        			$("#month").append("<option value='"+ i +"'>"+ i +"</option>");
	        		}
		        }
	        }
	    }

        function selectStayInfo(){
        	var opensite = "stay_popup?&page=1";
            window.open(opensite, 'window', 'width=700px, height=830px');
        }
        
        function searchSalesChart(){
        	var s_name = document.getElementById("s_name").value;
        	var year = document.getElementById("year").value;
        	var month = document.getElementById("month").value;
        	
        	if( s_name.length < 1 ){
        		alert("매출을 조회할 숙소를 지정해주세요");
        		return false;
        	}
        	
        	if(year.length < 1){
        		alert("매출을 조회할 연도를 지정해주세요");
        		return false;
        	}
        	
        	if(month.length < 1){
        		alert("매출을 조회할 월을 지정해주세요");
        		return false;
        	}
        }
        
    </script>

	<!-- 메세지 -->
	<c:if test="${not empty msg}">
			
		<script>
			alert("${msg}");
			location.replace("saleschart_month?s_no=${s_no}&s_name=${s_name}&year=${year}&month=${month}&msg=${msg}");
		</script>
		
	</c:if>

    <h1>월 매출 조회</h1>
    <div id="form">
    	<br/>
        <form action="" onsubmit="return searchSalesChart();">
        
        	<c:if test="${ empty s_no || s_no eq '' }">
        			<input type="hidden" id="s_no" name="s_no" value=""/>
        	</c:if>
        	<c:if test="${ s_no ne '' }">
        			<input type="hidden" id="s_no" name="s_no" value="${s_no}"/>
        	</c:if>
        	
            <div>
                <span>
                	<c:if test="${empty s_name || s_name eq ''}">
                		<input type="text" id="s_name" name="s_name" placeholder="이곳을 클릭하여 숙소를 조회해주세요" autocomplete="off" onclick="selectStayInfo()" readonly>
               		</c:if>
               		<c:if test="${s_name ne ''}">
                		<input type="text" id="s_name" name="s_name" autocomplete="off" value="${s_name}"onclick="selectStayInfo()" readonly>
               		</c:if>
               	</span>
               	<span>
                    <select id="year" name="year"></select>
               	</span>
                <span>
                    <select id="month" name="month"></select>
                </span>
                <span><input type="submit"  id="button" value="검색"></span>
            </div>
            
            <br />
            
            <div>
                <canvas id="saleChart"></canvas>
            </div>
        </form>
    </div>
    
    <script>
	
	    var jsondata = new Array();
	    
        var colorArray = new Array();

        for (let index = 0; index < 31; index++) {

            var r = Math.floor(Math.random() * 255);
            var g = Math.floor(Math.random() * 255);
            var b = Math.floor(Math.random() * 255);
            colorArray[index] = "rgba(" + r + "," + g + "," + b + ",1.0)";

        }

	    jsondata = '${arr}'
    	jsondata = JSON.parse(jsondata);

		const ctx = document.getElementById("saleChart").getContext('2d');
		const saleChart = new Chart(ctx, {
			
			type:'bar', 
			data:{
				labels:[
					jsondata[0].order_day,
					jsondata[1].order_day,
					jsondata[2].order_day,
					jsondata[3].order_day,
					jsondata[4].order_day,
					jsondata[5].order_day,
					jsondata[6].order_day,
					jsondata[7].order_day,
					jsondata[8].order_day,
					jsondata[9].order_day,
					jsondata[10].order_day,
					jsondata[11].order_day,
					jsondata[12].order_day,
					jsondata[13].order_day,
					jsondata[14].order_day,
					jsondata[15].order_day,
					jsondata[16].order_day,
					jsondata[17].order_day,
					jsondata[18].order_day,
					jsondata[19].order_day,
					jsondata[20].order_day,
					jsondata[21].order_day,
					jsondata[22].order_day,
					jsondata[23].order_day,
					jsondata[24].order_day,
					jsondata[25].order_day,
					jsondata[26].order_day,
					jsondata[27].order_day,
					jsondata[28].order_day,
					jsondata[29].order_day,
					jsondata[30].order_day
				],
				datasets:[{
					
					data:[
						jsondata[0].sum_payment_price,
						jsondata[1].sum_payment_price,
						jsondata[2].sum_payment_price,
						jsondata[3].sum_payment_price,
						jsondata[4].sum_payment_price,
						jsondata[5].sum_payment_price,
						jsondata[6].sum_payment_price,
						jsondata[7].sum_payment_price,
						jsondata[8].sum_payment_price,
						jsondata[9].sum_payment_price,
						jsondata[10].sum_payment_price,
						jsondata[11].sum_payment_price,
						jsondata[12].sum_payment_price,
						jsondata[13].sum_payment_price,
						jsondata[14].sum_payment_price,
						jsondata[15].sum_payment_price,
						jsondata[16].sum_payment_price,
						jsondata[17].sum_payment_price,
						jsondata[18].sum_payment_price,
						jsondata[19].sum_payment_price,
						jsondata[20].sum_payment_price,
						jsondata[21].sum_payment_price,
						jsondata[22].sum_payment_price,
						jsondata[23].sum_payment_price,
						jsondata[24].sum_payment_price,
						jsondata[25].sum_payment_price,
						jsondata[26].sum_payment_price,
						jsondata[27].sum_payment_price,
						jsondata[28].sum_payment_price,
						jsondata[29].sum_payment_price,
						jsondata[30].sum_payment_price
					],
					backgroundColor:[
                        colorArray[0],
						colorArray[1],
                        colorArray[2],
                        colorArray[3],
                        colorArray[4],
                        colorArray[5],
                        colorArray[6],
                        colorArray[7],
                        colorArray[8],
                        colorArray[9],
                        colorArray[10],
                        colorArray[11],
                        colorArray[12],
                        colorArray[13],
                        colorArray[14],
                        colorArray[15],
                        colorArray[16],
                        colorArray[17],
                        colorArray[18],
                        colorArray[19],
                        colorArray[20],
                        colorArray[21],
                        colorArray[22],
                        colorArray[23],
                        colorArray[24],
                        colorArray[25],
                        colorArray[26],
                        colorArray[27],
                        colorArray[28],
                        colorArray[29],
                        colorArray[30]
					],
					borderColor:[
						'rgba(255,99,9,1.0)',
						'rgba(255,99,9,1.0)',
						'rgba(255,99,9,1.0)',
						'rgba(255,99,9,1.0)',
						'rgba(255,99,9,1.0)',
						'rgba(255,99,9,1.0)'
					],
					borderWidth:3
				}]
			},
			options:{
				plugins:{
						legend:{
							display: false
						}
				},
				scales:{
					y:{
						beginAtZero: true
					}
				}
			}
		});
	
	</script>
	
</body>
</html>