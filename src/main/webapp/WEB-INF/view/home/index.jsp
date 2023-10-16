<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>메인 페이지</title>
<style>
 #survey-btn:hover {
 	transform: scale(1.25);
 }
 #shop-btn:hover {
 	transform: scale(1.25);
 }
</style>
</head>
<body>
<div id="carouselExampleCaptions" class="carousel slide carousel-fade container" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active" data-bs-interval="10000">
      <img src="${pageContext.request.contextPath}/images/index/banner01.png" class="d-block w-100" alt="..." height="600px">
      <div class="carousel-caption d-none d-md-block">
        <h5 style="color:black; font-size:30px;" class="mb-5">당신에게 맞는 향수를 찾아보세요</h5>
        <button class="btn btn-dark mb-5" id="survey-btn" 
        onclick="location.href='${pageContext.request.contextPath}/survey/surveyStart'">지금 바로 찾기</button>
      </div>
    </div>
    <div class="carousel-item" data-bs-interval="10000">
      <img src="${pageContext.request.contextPath}/images/index/banner02.jpg" class="d-block w-100" alt="..." height="600px">
      <div class="carousel-caption d-none d-md-block">
        <h5></h5>
        <p></p>
      </div>
    </div>
    <div class="carousel-item" data-bs-interval="10000">
      <img src="${pageContext.request.contextPath}/images/index/banner03.jpg" class="d-block w-100" alt="..." height="600px">
      <div class="carousel-caption d-none d-md-block">
      	<h5 style="color:black; font-size:30px;">어떤 향수를 찾고 계신가요?</h5>
      	<a href="${pageContext.request.contextPath}/product/shop" style="display: block;" class="mt-1 mb-1">
      	<img alt="" src="${pageContext.request.contextPath}/images/index/sample.png" width="50%">
      	</a>
        <a style="color:white; text-decoration: none;" class="btn btn-bg btn-primary" id="shop-btn"
        href="${pageContext.request.contextPath}/product/shop">상품 보기</a>
      </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

</body>
</html>