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
			height: 100%;
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
		*{
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
        #button{
        	background-color: #011343;
			color: #EBD01C;
			font-weight: bold;
			border-radius: 3px;
			width: 100px;
			height: 32px;
			cursor: pointer;
        }
    </style>

    <script>

	    $(document).ready(function(){
	        setDateSelectBox();
	    });    
	
	    function setDateSelectBox(){
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
	    
        function selectStayInfo(){
        	var opensite = "stay_popup?&page=1";
            window.open(opensite, 'window', 'width=700px, height=830px');
        }
        
        function searchSalesChart(){
        	var s_name = document.getElementById("s_name").value;
        	var year = document.getElementById("year").value;
        	
        	if( s_name.length < 1 ){
        		alert("매출을 조회할 숙소를 지정해주세요");
        		return false;
        	}
        	
        	if(year.length < 1){
        		alert("매출을 조회할 연도를 지정해주세요");
        		return false;
        	}
        }
        
    </script>

	<!-- 메세지 -->
	<c:if test="${not empty msg}">
			
		<script>
			alert("${msg}");
			location.replace("saleschart_year?s_no=${s_no}&s_name=${s_name}&year=${year}&msg=${msg}");
		</script>
		
	</c:if>

    <h1>연 매출 조회</h1>
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

        for (let index = 0; index < 12; index++) {

            var r = Math.floor(Math.random() * 255);
            var g = Math.floor(Math.random() * 255);
            var b = Math.floor(Math.random() * 255);
            colorArray[index] = "rgba(" + r + "," + g + "," + b + ",0.7)";

        }

	    jsondata = '${arr}'
    	jsondata = JSON.parse(jsondata);

		const ctx = document.getElementById("saleChart").getContext('2d');
		const saleChart = new Chart(ctx, {
			
			type:'bar', 
			data:{
				labels:[
					jsondata[0].order_month,
					jsondata[1].order_month,
					jsondata[2].order_month,
					jsondata[3].order_month,
					jsondata[4].order_month,
					jsondata[5].order_month,
					jsondata[6].order_month,
					jsondata[7].order_month,
					jsondata[8].order_month,
					jsondata[9].order_month,
					jsondata[10].order_month,
					jsondata[11].order_month
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
						jsondata[11].sum_payment_price
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
                        colorArray[11]
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