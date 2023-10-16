<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
</head>
<body>
	<br>
	<form class="container" name="f"
		action="${pageContext.request.contextPath}/member/adminMemberDelete"
		method="post">
		<h2 align="center">회원 목록</h2>
		<br>
		<br>
		<table class="table ">
			<tbody>
				<tr>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>이름</th>
					<th>성별</th>
					<th>전화번호</th>
					<th>이메일</th>
					<th>선택</th>
				</tr>
			</tbody>
			<tbody>
				<c:forEach var="m" items="${li}">

					<tr>
						<td>${m.id}</td>
						<td>${m.pass}</td>
						<td>${m.name}</td>
						<!-- gender = 1이면 남성, 반대는 여성으로 출력 -->
						<c:choose>
							<c:when test="${m.gender eq 1}">
								<td>남성</td>
							</c:when>
							<c:otherwise>
								<td>여성</td>
							</c:otherwise>
						</c:choose>
						<td>${m.tel}</td>
						<td>${m.email}</td>
						<!-- admin 계정은 리스트에서 선택할 수 없도록 -->
						<c:choose>
							<c:when test="${m.id eq 'admin'}">
								<td><input class="form-check-input" type="checkbox"
									name="chkdel" value="${m.id}" disabled></td>
							</c:when>
							<c:otherwise>
								<td><input class="form-check-input" type="checkbox"
									name="chkdel" value="${m.id}"></td>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="text-center">
			<input class="btn btn-outline-danger" type="submit" value="회원삭제">
		</div>
	</form>
</body>
</html>