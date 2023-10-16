<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호수정</title>
</head>
<body>
	<br>
	<br>
	<br>
	<div class="container mt-3">
		<h2 align="center">비밀번호수정</h2>
	</div>
	<br>
	<div class="container mt-3">
		<form class="container" name="f"
			action="${pageContext.request.contextPath}/member/memberPassPro"
			method="post" onsubmit="return passChk(this)">

			<p>
				<label>현재 비밀번호</label> <input class="form-control" type="password"
					name="pass">
			</p>
			<p>
				<label>변경 비밀번호</label> <input class="form-control" type="password"
					name="chgpass1">
			</p>
			<p>
				<label>변경 비밀번호 재확인</label> <input class="form-control"
					type="password" name="chgpass2">
			</p>
			<br>
			<br>
			<p>
				<input class="form-control" type="submit" value="비밀번호 변경">
			</p>

		</form>
	</div>
	<script>
		function passChk(form) {
			//alert("ok")
			if (form.chgpass1.value != form.chgpass2.value) {
				alert("비밀번호가 일치하지 않습니다.")
				form.chgpass2.value = ""
				form.chgpass2.focus()
				return false;
			} else {
				return true;
			}
		}
	</script>
</body>
</html>