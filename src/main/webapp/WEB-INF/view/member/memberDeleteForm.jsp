<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<body>
	<div class="container mt-3">
		<h2 align="center">회원탈퇴</h2>
	</div>
	<br>
	<div class="container mt-3"></div>
	<form class="container" name="f" action="${pageContext.request.contextPath}/member/memberDeletePro" method="post">
		<br><br>
		<div class="container" style="text-align:center">
		<p>
			<label>비밀번호</label>
			<input type="password" name="pass" >
		</p>
		<p><br><br>
			<input class="btn btn-outline-danger" type="submit" value="확인" >
		</p>
		</div>
	</form>

</body>
</html>