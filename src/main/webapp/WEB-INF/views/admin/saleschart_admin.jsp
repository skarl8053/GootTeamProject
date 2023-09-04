<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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

        #form{
            width: 1200px;
        }

    </style>

    <script>

        function selectStayInfo(){
        	var opensite = "stay_popup?&page=1";
            window.open(opensite, 'window', 'width=700px, height=830px');
        }
        
    </script>

    <h1>매출 조회</h1>
    <div id="form">
    	<br />
        <form action="">
            <div>
                <span><input type="text" id="s_name" placeholder="이곳을 클릭하여 숙소를 조회해주세요" autocomplete="off" onclick="selectStayInfo()" readonly></span>
                <span><input type="submit" value="검색"></span>
            </div>
            <div>
                <canvas id="saleChart"></canvas>
            </div>
        </form>
    </div>
    

    <script>
	
		const ctx = document.getElementById("saleChart").getContext('2d');
		const saleChart = new Chart(ctx, {
			
			type:'bar', 
			data:{
				labels:['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
				datasets:[{
					labels: '# Votes',
					data:[12, 9, 3, 50, 2, 3],
					backgroundColor:[
						'rgba(255,99,132,1.0)',
						'rgba(55,99,16,1.0)',
						'rgba(10,99,13,1.0)',
						'rgba(255,99,255,1.0)',
						'rgba(2,99,5,1.0)',
						'#0000ff'
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