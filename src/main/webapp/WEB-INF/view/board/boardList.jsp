<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판: ${boardName}</title>
</head>
<body>
	<div class="container">
	<!-- 게시판 테이블 -->
	<table class="table boardTable">
		<thead>
			<tr>
				<th scope="col" width="5%">No</th>
				<th scope="col" width="20%">제목</th>
				<th scope="col" width="10%">작성자</th>
				<th scope="col" width="10%">입력일</th>
				<th scope="col" width="7%">조회수</th>
			</tr>
		</thead>
		<c:set var="boardNum" value="${boardNum}"/>
		<c:forEach var="b" items="${list}" varStatus="status">
		<tbody>
			<tr>
				<th scope="row">${boardNum}</th>
				<c:set var="boardNum" value="${boardNum-1}"/>
				<td><a
					href="${pageContext.request.contextPath}/board/boardComment?num=${b.num}"
					style="color: black;">${b.subject}</a></td>
				<td>${boardNameLi[status.index]}</td>
				<td><fmt:formatDate value="${b.regdate}" var="dateValue" pattern="yyyy-MM-dd"/>${dateValue}</td>
				<td>${b.readcnt}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table> <!-- 게시판 테이블 끝 -->

	<!-- 게시글 등록 버튼, admin만 작성버튼이 나타나도록 -->
	<c:if test="${sessionScope.id ne null && sessionScope.id eq 'admin'}">
		<div class="col">
			<button type="button" class="btn btn-outline-dark"
			onclick="location.href='${pageContext.request.contextPath}/board/boardForm'">
				<i class="fa-solid fa-pencil"></i> 쓰기
			</button>
		</div>
	</c:if>
	</div>
	
	<!-- 게시판 페이지 표시 -->
	<br>
	<div class="text-center">
		<!-- 이전 버튼 -->
		<c:if test="${start < bottomLine}">
			<a href="#" class="btn btn-sm btn-outline-danger disabled">이전</a>
		</c:if>
		<c:if test="${start > bottomLine}">
			<a
				href="${pageContext.request.contextPath}/board/boardList?pageNum=${start-bottomLine+(bottomLine-1)}"          
				class="btn btn-sm btn-outline-primary">이전</a> 					<!-- 1페이지 아니라 5페이지로 이동하게  -->         
			</c:if>

		<!-- 현재 페이지 표시 -->
		<c:forEach var="p" begin="${start}" end="${end}">
			<a
				href="${pageContext.request.contextPath}/board/boardList?pageNum=${p}"
				class="btn <c:if test="${pageInt==p}"> btn-sm btn-outline-secondary </c:if> ml-3 mr-3">${p}</a>
		</c:forEach>

		<!-- 다음 버튼 -->
		<c:if test="${end >= maxPage}">
			<a href="#" class="btn btn-sm btn-outline-danger disabled">다음</a>
		</c:if>
		<c:if test="${end <  maxPage}">
			<a
				href="${pageContext.request.contextPath}/board/boardList?pageNum=${start+bottomLine}"
				class="btn btn-sm btn-outline-primary">다음</a>
		</c:if>
	</div>
	
	<!-- 내가 쓴 댓글 모아보기 : admin에서는 안나타나게  -->
	<c:if test="${sessionScope.id ne 'admin'}">
	<div class="container text-end">
	<button type="button" class="btn btn-outline-dark"
		onclick="location.href='${pageContext.request.contextPath}/board/myComment'">내가 쓴 댓글
	</button>	
	</div>  
	</c:if>  
	
</body>
</html>