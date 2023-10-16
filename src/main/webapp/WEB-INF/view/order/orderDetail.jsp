<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 상세: ${ordernum}</title>
<style>
.prodname-td a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
	<div class="container">
		<div class="text-center mb-5">
			<h3>주문번호: ${ordernum}</h3>
			<span style="font-size: 30px;">주문 상태: </span>
			<c:choose>
				<c:when test="${order.result == 1}">
					<span style="font-size: 30px;">주문 완료</span>
				</c:when>
				<c:when test="${order.result == 2}">
					<span style="font-size: 30px;">배송 중</span>
				</c:when>
				<c:when test="${order.result == 3}">
					<span style="font-size: 30px; color: crimson;">주문 취소</span>
				</c:when>
				<c:when test="${order.result == 4}">
					<span style="font-size: 30px;">배송 완료</span>
				</c:when>
				<c:when test="${order.result == 5}">
					<span style="font-size: 30px;">주문 확정</span>
				</c:when>
			</c:choose>
		</div>
		<div class="mb-3 d-flex justify-content-center">
			<table class="table table-borderless" style="width: 80%;">
				<tr>
					<td><span>받으시는 분: </span></td>
					<td><span>${order.name}</span> 님</td>
				</tr>
				<tr>
					<td><span>전화번호: </span></td>
					<td><span>${order.tel}</span></td>
				</tr>
				<tr>
					<td><span>주소: </span></td>
					<td><span>${order.address}, </span></td>
				</tr>
				<tr>
					<td></td>
					<td><span>${order.detailaddress}</span></td>
				</tr>
			</table>
		</div>
		<div class="text-center">
			<h4>주문 상품 정보</h4>
		</div>
		<div class="d-flex justify-content-center">
			<table class="table table-hover orderList align-middle"
				style="width: 80%;">
				<thead>
					<tr>
						<th scope="col" width="40%">상품</th>
						<th scope="col" width="20%">수량</th>
						<th scope="col" width="20%">가격</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="totalQuantity" value="0" />
					<c:set var="totalPrice" value="0" />
					<c:forEach var="li" items="${li}" varStatus="status">
					<c:set var="currentProdname" value="${prodnameLi[status.index]}" />
						<tr>
							<c:choose>
							<c:when test="${currentProdname ne 'deletedProduct'}">
							<td class="prodname-td"><a
								href="${pageContext.request.contextPath}/product/productDetail?prodnum=${prodnumLi[status.index]}"
								style="color: black;"> ${prodnameLi[status.index]}</a></td>
							</c:when>
							<c:otherwise>
							<td class="prodname-td">삭제된 상품</td>
							</c:otherwise>
							</c:choose>
							<td>${li.quantity}</td>
							<td><fmt:formatNumber value='${li.price}' pattern="#,### 원" /></td>
						</tr>
						<c:set var="totalQuantity" value="${totalQuantity + li.quantity}" />
						<c:set var="totalPrice" value="${totalPrice + (li.price * li.quantity)}" />
					</c:forEach>
					<tr>
						<td></td>
						<td><span>총: <c:out value="${totalQuantity}" /> 개
						</span></td>
						<td><span>합계: <fmt:formatNumber value='${totalPrice}'
									pattern="#,### 원" /></span></td>
					</tr>
					<tr>
						<td></td>
						<td>배송비: <fmt:formatNumber value='${order.delivercost}'
								pattern="#,### 원" /></td>
						<td><span>총액: <strong><fmt:formatNumber
										value='${totalPrice + order.delivercost}' pattern="#,### 원" /></strong></span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<c:if test="${id eq order.id}">
			<div class="text-center">
				<c:choose>
					<c:when test="${order.result == 1}">
						<!-- 결제 대기 상태 -->
						<button class="cancel-btn btn btn-outline-danger"
							data-ordernum="${order.ordernum}">주문취소</button>
					</c:when>

					<c:when test="${order.result == 4}">
						<!-- 배송 완료 -->
						<button class="confirm-btn btn btn-outline-primary"
							data-ordernum="${order.ordernum}">주문확정</button>
					</c:when>
				</c:choose>
				<button type="button" class="btn btn-outline-secondary"
					onclick="location.href='${pageContext.request.contextPath}/order/orderList'">
					돌아가기</button>
			</div>
		</c:if>

		<!-- 취소 form -->
		<form
			action="${pageContext.request.contextPath}/order/orderCancelForm"
			method="post" class="order-cancel-form">
			<input type="hidden" name="ordernum" class="cancel-ordernum">
		</form>

		<!-- 취소 form -->
		<form action="${pageContext.request.contextPath}/order/orderConfirm"
			method="post" class="order-confirm-form">
			<input type="hidden" name="ordernum" class="confirm-ordernum">
		</form>
	</div>

	<script>
		/* 주문 취소 버튼 */
		$(".cancel-btn").on("click", function() {
			const orderNum = $(this).data("ordernum");
			$(".cancel-ordernum").val(orderNum);
			$(".order-cancel-form").submit();
		});

		/* 주문 확정 버튼 */
		$(".confirm-btn").on("click", function() {
			const orderNum = $(this).data("ordernum");
			$(".confirm-ordernum").val(orderNum);
			$(".order-confirm-form").submit();
		});
	</script>
</body>
</html>