<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
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

.btn {
	display: flex;
}
</style>
<script>
	function next(page) {
		//alert(page)
		document.RadioPost.page.value = page;
		document.RadioPost.submit()
	}

	let pnum;
	function pnext(pnum) {
		//alert(pnum)
		page = 'product2';
		document.RadioPost.page.value = page;
		document.RadioPost.pnum.value = pnum;
		document.RadioPost.prodimagenum.value;
		document.RadioPost.submit()

	}
</script>
</head>
<body
	style="background-image: url('${pageContext.request.contextPath}/images/surveyback/svback02.jpg'); 
   background-size: cover;">
	<!-- 체크값 보내고 받아주는 부분 -->
	<form method="post" name="RadioPost"
		action="${pageContext.request.contextPath }/survey/surveyInsertPro">
		<input type="hidden" name="pnum" value=""> 
		<input type="hidden" name="page" value=""> 
		<input type="hidden" name="pname" value="${pname}"> 
		<input type="hidden" name="prodimagenum" value="${prodimagenum }"> 
		<input type="hidden" name="ck1gender" value="${ck1gender}"> 
		<input type="hidden" name="ck2favorite" value="${ck2favorite}"> 
		<input type="hidden" name="ck3fruit" value="${ck3fruit}"> 
		<input type="hidden" name="ck3flower" value="${ck3flower}"> 
		<input type="hidden" name="ck3wood" value="${ck3wood}"> 
		<input type="hidden" name="anslistImage" value="${anslistImage}">

		<div class="recommend p-5 h1"
			style="margin-top: 50px; background-color: rgba(200, 200, 200, 0.5);">
			
			<div class="position-absolute top-0 end-0 translate-middle-y float-sm-none"
				 style="margin-top: 250px;">
				<!-- 가장 많은 설문 결과를 얻어낸 향수 -->
				<!-- 성별별로 추천 -->
				<div class = "d-none d-sm-block" style="margin-top: 150px; width: 200px; background-color: rgba(230, 230, 230, 0.5);">
					<br>
					<div class="m-0">
						<p class="fs-4 fw-bold m-0" style="margin-right: 20px;" 
						>최다 추천 향수</p>
					</div>
					<c:choose>
					<c:when test="${Male ne null }">
					<div style="margin-top: 30px;">
						<a class="pimage m-0 d-none d-sm-block"
								onclick="pnext('${Male.getProdnum()}')" href="#"
								style="display: inline-block">
									<img class="rounded-2"
									style="width: 100px; height: 100px; margin: 0"
									src="${pageContext.request.contextPath }/view/product/images/${Male.getImage()}">
						</a>
						<p class="m-0 d-sm-none d-none d-md-block " style="font-size: 17px; font-weight: bold;">${Male.getName()}</p>
						<p class="fs-5 fw-bold m-0 d-sm-none d-none d-md-block ">남성 부분</p>
					</div>
					</c:when>
					<c:otherwise>
					<div><p class= "fs-3 fw-bold"
							style="margin: 20px;">
							설문 결과가 없습니다.<p></div>
					</c:otherwise>
					</c:choose><c:choose>
					<c:when test="${Female ne null }">
					<div style="margin-top: 30px;">
						<a class="pimage m-0 d-none d-sm-block"
								onclick="pnext('${Female.getProdnum()}')" href="#"
								style="display: inline-block"> 
									<img class="rounded-2"
									style="width: 100px; height: 100px; margin: 0"
									src="${pageContext.request.contextPath }/view/product/images/${Female.getImage()}">
						</a>
						<p class="m-0 d-sm-none d-none d-md-block " style="font-size: 17px; font-weight: bold;">${Female.getName()}</p>
						<p class="fs-5 fw-bold m-0 d-sm-none d-none d-md-block " style="margin-bottom: 30px;">여성 부분</p>
					</div>
					</c:when>
					<c:otherwise>
					<div><p class= "fs-3 fw-bold"
							style="margin: 20px;">
							설문 결과가 없습니다.<p></div>
					</c:otherwise>
					</c:choose>
				</div>
				
			</div>

			<!-- 기존에 설문 조사한 사람들은 좌측에 최근 4개 노출되도록 -->
			<div class=" position-absolute translate-middle-y float-sm-none"
				style="margin-top: 250px;">

				<table class="table table-secondary table-borderless">
					<tr class="fs-3 d-none d-sm-block fw-bold">
						<td
							style="width: 175px; background-color: rgba(200, 200, 200, 0.3);">${msg}</td>
					</tr>
					<c:forEach var="s" items="${anslistImage }" varStatus="status"
						begin="0" end="3" step="1">
						<tr>
							<td><a class="pimage m-0 d-none d-sm-block"
								onclick="pnext('${anslistProdnum[status.index]}')" href="#"
								style="display: inline-block"> <input type="hidden"
									name="anslistProdnum" value="${anslistProdnum[status.index]}">
									<img class="rounded-2"
									style="width: 100px; height: 100px; margin: 0"
									src="${pageContext.request.contextPath }/view/product/images/${s}">
							</a>
								<p class="m-0 d-sm-none d-none d-md-block "
									style="font-size: 17px; font-weight: bold;">
									${anslistImageName[status.index]}</p></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<!-- 사진누르면 상품페이지 -->
			<!-- 설문 결과에따른 사진 -->
			<a href="#" class="m-auto" onclick="next('product')"
				style="width: 350px; display: inline-block;"> 
				<img class="rounded-2"
				src="${pageContext.request.contextPath }/view/product/images/${image}"
				alt="" style="margin-top: 85px;">
				<p class="fs-2 fw-bolder">${pname}</p>
			</a>
			<p class="m-0">다음과 같은 제품을 추천합니다.</p>
			</br>
			<p class="m-0">제품 사진을 누르시면 상품페이지로 이동합니다.</p>

		</div>
	</form>

	<!-- 홈페이지, 설문 다시하기 버튼 -->
	<div style="text-align: center;">
		<div class="btn-group-vertical" style="margin-top: 50px;">
			<a href="${pageContext.request.contextPath}/survey/survey01"
				type="button" class="btn btn-dark p-4 fs-3 fw-bold"> 설문 다시하기 </a>

			<a href="#" onclick="next('surveyStart')" type="button"
				class="btn btn-outline-secondary p-3 fw-bold link-dark"> 홈페이지로
				돌아가기 </a>
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
</body>
</html>