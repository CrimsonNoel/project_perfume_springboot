<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>설문 페이지</title>
<style>
.boxbox {
	width: 85%;
	margin: 10px auto;
	background-color: #fff;
	border-radius: 20px;
	box-shadow: 8px 8px 2px 1px rgba(0, 0, 0, 0.3);
}

body {
	width: 100%;
	height: 100%;
}

.nav {
	text-align: center;
}

.nav a {
	text-decoration: none;
	color: black;
}

.nav a:hover {
	text-decoration: underline;
}

.h1 {
	background-color: rgba(230, 230, 230, 0.4);
	margin: auto;
	border-radius: 20px;
	padding: 25px;
}
</style>
<script>
<!-- 이전 다음페이지 onclick 함수 체크한 value 넘어가는 역할도있음-->
	var maxChecked = 1;
	var totalChecked = 0;

	function CountChecked(field) {
		if (field.checked) {
			totalChecked += 1;
		} else {
			totalChecked -= 1;
		}
	}

	function pre(page) {
		//alert(page)
		document.RadioPost.page.value = page;
		document.RadioPost.submit()
	}

	function next(page) {
		//alert(page)
		document.RadioPost.page.value = page;
		//alert(document.RadioPost.page.value)
		let ck = document.RadioPost.ck0.value
		document.RadioPost.ck1gender.value = ck;

		if (totalChecked === 0) {
			alert('반드시 하나 이상 선택해주세요')
			page = survey01;
		}

		//alert(ck)
		document.RadioPost.submit()

	}
</script>
</head>
<!-- 백그라운드 이미지 images - surveyback 폴더에 추가 -->
<body
	style="background-image: url('${pageContext.request.contextPath}/images/surveyback/svback02.jpg');
  			   background-size: cover;">
	<nav>
		<!--닫기 버튼 ,사이즈 조절가능 -->
		<button
			onClick="location.href='${pageContext.request.contextPath}/home/index'"
			type="button"
			class="me-5 mt-3 btn btn-outline-dark  position-absolute top-0 end-0 translate-middle-x"
			style="-bs-btn-padding-y: .25rem; - -bs-btn-padding-x: .5rem; - -bs-btn-font-size: 1 rem;">
			닫기</button>
	</nav>
	<div class="boxbox col col-xl-11">
		<div class="container-fluid  text-center" style="margin-top: 5%;">
			<div class="col col-xl-12 m-auto ">
				<div class="row m-0 justyfy-center">
					<div class="header row m-0 p-3">
						<!-- 설문 헤더 -->
						<div class="h1 m-0 p-5 fw-bold">나에게 맞는 향수 찾기</div>
					</div>
					<div class="row m-0">
						<!-- 설문 문항 -->
						<h3 class="m-0 p-5 fw-bold">성별을 선택해주세요</h3>
					</div>
					<div class="row m-0">
						<!-- 체크값 보내고 받아주는 부분 -->
						<form method="post" name="RadioPost"
							action="${pageContext.request.contextPath }/survey/RadioCheckedPro">
							<input type="hidden" name="page" value="">
							<c:choose>
								<c:when test="${ck1gender eq null}">
									<input type="hidden" name="ck1gender" value="3">
								</c:when>
								<c:otherwise>
									<input type="hidden" name="ck1gender" value="${ck1gender}">
								</c:otherwise>
							</c:choose>
							<input type="hidden" name="ck2favorite" value="${ck2favorite}">
							<input type="hidden" name="ck3fruit" value="${ck3fruit}">
							<input type="hidden" name="ck3flower" value="${ck3flower}">
							<input type="hidden" name="ck3wood" value="${ck3wood}">
							<!-- 라디오박스 -->
							<div class="check p-3 m-1" style="text-align: center;">
								<input onclick="CountChecked(this)"
									class="btn-check form-check-input" type="radio" name="ck0"
									id="Radio1" value="1" /> <label
									class="btn btn-outline-primary form-check-label fs-3 fw-bold"
									for="Radio1" style="width: 80%; padding: 10px;">
									&nbsp;남성 </label>
							</div>

							<div class="check p-3 m-3" style="text-align: center;">
								<input onclick="CountChecked(this)"
									class="btn-check form-check-input" type="radio" name="ck0"
									id="Radio2" value="2" /> <label
									class="btn btn-outline-danger form-check-label fs-3 fw-bold"
									for="Radio2" style="width: 80%; padding: 10px;">
									&nbsp;여성 </label>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- flex 제거 버튼위치 고정-->
	<!-- 이전,다음버튼 -->
	<div style="text-align: center;">
		<div class="btn-group"
			style="margin-top: 7%; margin-bottom: 10%; width: 450px;">
			<!-- footer 삭제 a태그 controller 타도록 변경 -->
			<a href="#" onclick="pre('surveyStart')"
				class="btn btn-outline-dark fs-5">이전</a> <a href="#"
				onclick="next('survey02')" class="btn btn-dark fs-5">다음</a>
		</div>
	</div>
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
		crossorigin="anonymous" />
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>
</html>