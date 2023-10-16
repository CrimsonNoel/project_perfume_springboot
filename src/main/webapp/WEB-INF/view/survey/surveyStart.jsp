<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문 페이지</title>
<style>
.recommend img {
	width: 300px;
	height: 300px;
	margin-bottom: 10px;
}

.recommend {
	text-align: center;
}

.recommend a {
	display: block;
	text-decoration: none;
	color: black;
}

.recommend p {
	margin-top: 10px;
	font-size: 20px;
}

.title {
	background-color: rgba(230, 230, 230, 0.4);
	margin: auto;
	border-radius: 20px;
	padding: 25px;
	width: 900px;
}

</style>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
   navigator.geolocation.getCurrentPosition(onGeoOk, onError);

   let cityname;   //장소 
   let nweather;   //현재날씨
   let ntemp;      //기온
   let nowWeather; //현재날씨보낼데이터
   let pnum;       //상품페이지번호
   
// 위치정보를 openweathermap api에 입력해 날씨정보 불러오기
// 날씨 정보로 조건에 맞는 추천향수 불러오기
  function onGeoOk(position) {
	   const userlat = position.coords.latitude;
	   const userlon = position.coords.longitude;
	   const API_KEY = 'b822a392b037554745783b87040a79cf';
	   const weatherIcon = document.getElementById('weather-icon');
	   const apiUrl = "https://api.openweathermap.org/data/2.5/weather?lat="+userlat+"&lon="+userlon+"&appid="+API_KEY
	   console.log(apiUrl); 
		
	   
	   fetch(apiUrl)
	      .then(response => response.json())
	      .then(data => {
	         console.log('장소 :'+ data.name +', 날씨 :'+ data.weather[0].main )
	         document.getElementById('cityname').innerHTML = data.name 
	         document.getElementById('nweather').innerHTML = data.weather[0].main
	         document.getElementById('ntemp').innerHTML = (data.main.temp-274).toFixed(1)
	  		 document.getElementById('nowWeather').value = data.weather[0].main
	  		 
	  		 
	  		 cityname =data.name ; 
	         nweather = data.weather[0].main; 
	         nowWeather = document.getElementById('nowWeather').value;
	         ntemp = (data.main.temp-275).toFixed(1);
	         
	         // 날씨 아이콘 적용 openweathermap icon url
	         const iconCode = data.weather[0].icon;
	         const iconUrl = "http://openweathermap.org/img/w/"+data.weather[0].icon+".png"
	         weatherIcon.src = iconUrl;
	         
	         //ajax
	         if(nowWeather!==null && nowWeather!==''){
	        	 	$(document).ready(function(){
	        			$.ajax({
	        				type : 'post',
	        				//url  : '${pageContext.request.contextPath }/survey/weatherajax?nowWeather='+'Clear',
	        				//url  : '${pageContext.request.contextPath }/survey/weatherajax?nowWeather='+'Thunderstorm',
	        				//url  : '${pageContext.request.contextPath }/survey/weatherajax?nowWeather='+'Rain',
	        			    url  : '${pageContext.request.contextPath }/survey/weatherajax?nowWeather='+nowWeather,
	        				error: function(xhr, status, error){ console.log(error)},
	        				success: function(data){
	        				console.log(data) 
	        				//data[0] : msg출력 , data[1] : image src, data[2] : 상품번호	
	        				let hello = document.querySelector("#hello")
	        				hello.innerHTML=data[0]
	        				let pimage = document.querySelector("#pimage")
	        				pimage.src="${pageContext.request.contextPath }/view/product/images/"+data[1]
	        				let prodimagenum = document.querySelector("#prodimagenum")
	        				prodimagenum.value = data[2]
	        				pnum = data[2]
	        				document.weatherPost.prodimagenum.value = pnum
	        				}	})		}) }
	      })
	      .catch(error => {
	         console.error("날씨 정보를 불러오는 중 오류가 발생했습니다.", error);
	      });
	}	
   	
  function onError(error) {
	console.log('위치정보를 가져올수 없습니다.')
	let weatherscreen = document.getElementById('weatherscreen');
   let noweather = document.getElementById('noweather');
	weatherscreen.style.display = 'none';
	noweather.style.display = 'inline-block';
  	}
   
	function pnext() {
	document.weatherPost.submit()
	}
		
</script>
</head>
<body
	style="background-image: url('${pageContext.request.contextPath}/images/surveyback/svback02.jpg'); 
	background-size: cover;">

	<div class="recommend h1 fw-bold" style="margin-top: 5%; text-align: center;">
		<p class="title fs-2">당신에게 맞는 최고의 향수를 찾아드립니다.</p>
	</div>
	<!-- 도넛 차트 view-->
	<div class="d-flex justify-content-center " style="text-align: center;">
		<div class="" style="width: 250px;  background-color: rgb(230,230,230,0.5)" >
			<canvas id="maleChart" width="" height=""></canvas>
			<p class="fs-4">남성 선호</p>
		</div>
		<div class="" style="width: 250px; background-color: rgb(230,230,230,0.5)">
		<canvas id="femaleChart" width="" height=""></canvas>
			<p class="fs-4">여성 선호</p>
		</div>
	</div>
	<!-- 도넛 차트 end-->
	<!-- 날씨 view start -->
	<div id="weatherscreen" style="display: ">
	<div class="position-absolute top-0 start-0 d-none d-sm-none d-md-block" 
		style="margin-top:200px; margin-left:50px; background-color: rgba(220, 220, 220, 0.8); display: inline-block;">
	<form name="ajaxForm" >
		<input type="hidden" name="nowWeather" id="nowWeather" value="">
	</form>
		<!-- icon -->
	<div class="m-0 p-3" style="display:inline-block; width=200px; text-align: center; background-color: rgba(255, 255, 255,0.8);">
		<div class="weather-icon" >
    	<img style="width: 150px;" src="" alt="Weather Icon" id="weather-icon">
		</div>
		<!-- 위치/날씨/온도 입력부분 -->
		<div id="cityname" class="fw-bold"></div>
		<div id="nweather" class="fw-bold"></div>
		<div id="ntemp" class="fw-bold"></div>
		<div style="margin-top: 30px;">
		<!-- 추천상품이미지/링크 -->
		<form method="post" name="weatherPost"
		action="${pageContext.request.contextPath }/survey/weather">
		<input type="hidden" name="prodimagenum" id="prodimagenum" value="">
		<a class="m-0 d-none d-sm-block"
			onclick="pnext()" href="#"
			style="display: inline-block">
				<img class="rounded-2"  id="pimage"
				style="width: 100px; height: 100px; margin: 0"
				src="">
		</a>
		<p class="m-0 d-sm-none d-none d-md-block " style="font-size: 17px; font-weight: bold;"   id="hello"></p>
		</form>
	</div>
	</div>
	</div>
	</div>
	<div id="noweather" style="display: ">
	<input  type="hidden" name="위치정보공유를 차단하여" value="날씨 정보가 없습니다">
	</div>
	<!-- 날씨 end -->
	<div class="btnbox" style="text-align: center;display: block; margin-top: 100px;">
		<div class="btn-group-vertical"
			style="margin-top: 0px; width: 400px;">
			<a href="${pageContext.request.contextPath}/survey/survey01" type="button"
				class="btn btn-dark p-4 fs-3 fw-bold"><p>설문 시작하기</p>
			</a> 
			
			<a	href="${pageContext.request.contextPath}/home/index" type="button" 
				class="btn btn-outline-secondary p-3 fs-5 fw-bold link-dark ">
				<p>홈페이지로 돌아가기</p>
			</a> 

	</div>
   </div>
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
		crossorigin="anonymous">
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
	<!-- 통계차트 chart.js cdn --> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
	<script>
	// ANSWER DB 저장된 자료를 바탕으로 그리는 차트
	const ctx1 = document.getElementById('maleChart').getContext('2d');
	const ctx2 = document.getElementById('femaleChart').getContext('2d');
	
	const maleChart = new Chart(ctx1, {
    type: 'doughnut',
    data: {
        labels: ['꽃', '과일', '나무'],
        datasets: [{
            label: '# of Votes',
            data:  [ '${MaleD.get(0).doughnut+1}','${MaleD.get(1).doughnut+1}','${MaleD.get(2).doughnut+1}'
            	
            ],
            backgroundColor: [
                'rgba(75, 192, 192, 0.4)',
                'rgba(255, 99, 132, 0.4)',
                'rgba(88, 88, 88, 0.4)',
            ],
            borderColor: [
                'rgba(75, 192, 192, 1)',
                'rgba(255, 99, 132, 1)',
                'rgba(88, 88, 88, 0.5)',
            ],
        	    borderWidth: 1
     	   }]
 	   },
    options: {
        scales: {
            y: {
                beginAtZero: true
    	        }
   	     }
  	  }
	});
	const femaleChart = new Chart(ctx2, {
	    type: 'doughnut',
	    data: {
	        labels: ['꽃', '과일', '나무'],
	        datasets: [{
	            label: '# of Votes',
	            data: ['${FemaleD.get(0).doughnut+1}', '${FemaleD.get(1).doughnut+1}', '${FemaleD.get(2).doughnut+1}'],
	            backgroundColor: [
	                'rgba(75, 192, 192, 0.4)',
	                'rgba(255, 99, 132, 0.4)',
	                'rgba(88, 88, 88, 0.4)',
	            ],
	            borderColor: [
	                'rgba(75, 192, 192, 1)',
	                'rgba(255, 99, 132, 1)',
	                'rgba(88, 88, 88, 0.5)',
	            ],
	        	    borderWidth: 1
	     	   }]
	 	   },
	    options: {
	        scales: {
	            y: {
	                beginAtZero: true
	    	        }
	   	     }
	  	  }
		});
</script>
</body>
</html>