<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

</head>
<body>
	<br>
	<div class="container mt-3">

		<h2 align="center">마이페이지</h2>
	</div>
	<br>
	<div class="container">
		<div class="text-center mb-5">
			<input class="btn btn-outline-success" type="button"
				onclick="location.href='${pageContext.request.contextPath}/order/orderList'"
				value="주문내역"> <input class="btn btn-outline-primary"
				type="button"
				onclick="location.href='${pageContext.request.contextPath}/member/memberUpdateForm'"
				value="회원정보수정"> <input class="btn btn-outline-secondary"
				type="button"
				onclick="location.href='${pageContext.request.contextPath}/member/memberPassForm'"
				value="비밀번호수정"> <input class="btn btn-outline-danger"
				type="button"
				onclick="location.href='${pageContext.request.contextPath}/member/memberDeleteForm'"
				value="회원탈퇴">
		</div>
		<div>
			<p>
				<label>아이디</label> <input class="form-control" readonly="readonly"
					placeholder="${mem.id}">
			</p>
			<p>
				<label>이름</label> <input class="form-control" readonly="readonly"
					placeholder="${mem.name}">
			</p>
			<p>
				<label>성별</label> <input class="form-control" readonly="readonly"
					placeholder="${mem.gender==1 ? "남" : "여"}">
			</p>
			<p>
				<label>전화번호</label> <input class="form-control" readonly="readonly"
					placeholder="${mem.tel}">
			</p>
			<p>
				<label>이메일</label> <input class="form-control" readonly="readonly"
					placeholder="${mem.email}">
			</p>

			<p>
				<label>우편번호</label> <input class="form-control" readonly="readonly"
					placeholder="${mem.zipcode}">
			</p>
			<p>
				<label>주소</label> <input class="form-control" readonly="readonly"
					placeholder="${mem.address}"> <br>
				<br>
			</p>
		</div>
	</div>
</body>
</html>