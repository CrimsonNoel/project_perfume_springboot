<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE>
<html>
<head>
<!-- webapp/layout/layout.jsp -->
<title><sitemesh:write property='title' /></title> 
<!-- css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/font.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/footer.css" />
<!-- bootstrap link -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous" />
<!-- bootstrap 메인페이지 배너 슬라이드 link -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
	crossorigin="anonymous"></script>
<!-- jQuery link -->
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<!-- 아이콘용 link -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
.mainBody {
	margin-top: 30px;
}

a {
	text-decoration: none;
}
</style>
<%@ include file="/common/header.jsp"%>
<sitemesh:write property='head' />
</head>
<body>

	<div class='mainBody'>
		<sitemesh:write property='body' />
	</div>

	<div>
		<%@ include file="/common/footer.jsp"%>
		<sitemesh:write property='footer' />
	</div>

	 
</body>
</html>
