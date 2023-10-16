<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 삭제 확인</title>
<!-- bootstrap link -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
	crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col text-center">
			<form action="${pageContext.request.contextPath}/board/boardDeletePro"
			name="del" method="post">
			<input type="hidden" name="num" value="${num}"> <!-- 게시글 num을 hidden으로 받음 -->
				<p class="fs-4">게시글을 삭제하시겠습니까?</p>
				<button type="submit" class="btn btn-outline-danger">
					삭제
				</button>
				<button type="button" class="btn btn-outline-secondary"
				onclick="location.href='${pageContext.request.contextPath}/board/boardComment?num=${num}'">
					취소
				</button>
			</form>
		</div>
	</div>
</div>
</body>
</html>