<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 관리 페이지</title>
<style>
	.ordernumTd a:hover {
		text-decoration: underline;
	}
	
	.resultSelect {
	    width: 140px;
	    border: 1px solid #C4C4C4;
	    box-sizing: border-box;
	    border-radius: 10px;
	    padding: 12px 13px;
	    font-style: normal;
	    font-weight: 400;
	    font-size: 15px;
	}
	
	.resultSelect:focus {
	    border: 1px solid #9B51E0;
	    box-sizing: border-box;
	    border-radius: 10px;
	    outline: 1px solid #E2E2E2;
	}
	
</style>
</head>
<body>
	<div class="container">
		<table class="table align-middle">
			<thead>
				<tr>
					<th scope="col" width="20%">주문 ID</th>
					<th scope="col" width="40%">주문 번호</th>
					<th scope="col" width="15%">주문 상태</th>
					<th scope="col" width="10%"></th>
					<th scope="col" width="15%">주문 날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="o" items="${li}" varStatus="status">
					<tr>
						<td>${o.id}</td>
						<td class="ordernumTd">
							<a href="${pageContext.request.contextPath}/order/orderDetail?ordernum=${o.ordernum}"
							style="color: black;">${o.ordernum}</a></td>
						<td colspan="2" class="resultSelectTd">
							<select id="resultSelect" class="resultSelect">							
								<option value="" disabled>주문 상태 설정</option>
								<option value="1" <c:if test="${resultLi[status.index] == 1}">selected</c:if>>주문 완료</option>
								<option value="2" <c:if test="${resultLi[status.index] == 2}">selected</c:if>>배송 중</option>
								<option value="3" <c:if test="${resultLi[status.index] == 3}">selected</c:if>>주문 취소</option>
								<option value="4" <c:if test="${resultLi[status.index] == 4}">selected</c:if>>배송 완료</option>
								<option value="5" <c:if test="${resultLi[status.index] == 5}">selected</c:if>>주문 확정</option>
							</select>
							<a class="state-update-btn btn btn-sm btn-outline-secondary"
									data-ordernum="${o.ordernum}">변경</a></td>
						<td><fmt:formatDate value="${o.regdate}" pattern="yyyy-MM-dd"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
				<!-- 주문 페이지 표시 -->
		<br>
		<div class="text-center">
			<!-- 이전 버튼 -->
			<c:if test="${start < bottomLine}">
				<a href="#" class="btn btn-sm btn-outline-danger disabled">이전</a>
			</c:if>
			<c:if test="${start > bottomLine}">
				<a
					href="${pageContext.request.contextPath}/order/orderManagement?pageNum=${start-bottomLine}"
					class="btn btn-sm btn-outline-primary">이전</a>
			</c:if>

			<!-- 현재 페이지 표시 -->
			<c:forEach var="p" begin="${start}" end="${end}">
				<a
					href="${pageContext.request.contextPath}/order/orderManagement?pageNum=${p}"
					class="btn <c:if test="${pageInt==p}"> btn-sm btn-outline-secondary </c:if> ml-3 mr-3">${p}</a>
			</c:forEach>

			<!-- 다음 버튼 -->
			<c:if test="${end >= maxPage}">
				<a href="#" class="btn btn-sm btn-outline-danger disabled">다음</a>
			</c:if>
			<c:if test="${end <  maxPage}">
				<a
					href="${pageContext.request.contextPath}/order/orderManagement?pageNum=${start+bottomLine}"
					class="btn btn-sm btn-outline-primary">다음</a>
			</c:if>
		</div>
		
		<!-- 주문 상태 변경 form -->
		<form action="${pageContext.request.contextPath}/order/orderStateUpdate"
			method="post" class="state-update-form" id="state-update-form">
			<input type="hidden" name="ordernum" class="update-ordernum">
			<input type="hidden" name="result" class="update-result">
		</form>
	</div>
	
	<script>
		$(".state-update-btn").on("click", function() {
			let result = $(this).parent("td").find("select").val();
			let ordernum = $(this).data("ordernum");
			$(".update-ordernum").val(ordernum);
			$(".update-result").val(result);
			$(".state-update-form").submit();
		});
	</script>
	
	
</body>
</html>