<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역</title>
<style>
.ordernum-td a:hover {
	text-decoration: underline;
}
</style>

</head>
<body>
	<div class="container">
		<h2 align="center">${member.name}님의 주문내역</h2>
		<br> <br>

		<div class="d-flex justify-content-center">
			<table class="table table-hover orderList align-middle"
				style="width: 90%;">
				<thead>
					<tr>
						<th scope="col" width="35%">주문번호</th>
						<th scope="col" width="25%">주문날짜</th>
						<th scope="col" width="20%">주문상태</th>
						<th scope="col" width="20%"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="o" items="${li}">
						<tr>
							<td class="ordernum-td"><input type="hidden"
								class="ordernum-input" value="${o.ordernum}"> <a
								href="${pageContext.request.contextPath}/order/orderDetail?ordernum=${o.ordernum}"
								style="color: black;'">${o.ordernum}</a></td>
							<td><fmt:formatDate value="${o.regdate}" pattern="yyyy-MM-dd"/></td>
							<c:choose>
								<c:when test="${o.result == 1}">
									<!-- 주문 완료 -->
									<td><span>주문 완료</span></td>
									<td><button
											class="cancel-btn btn btn-outline-danger"
											data-ordernum="${o.ordernum}">주문취소</button></td>
								</c:when>

								<c:when test="${o.result == 2}">
									<!-- 배송 중 -->
									<td><span>배송 중</span></td>
									<td><span>배송 중인 상품은 취소 하실 수 없습니다.</span></td>
								</c:when>

								<c:when test="${o.result == 3}">
									<!-- 주문 취소 -->
									<td><span style="color: crimson;">주문 취소</span></td>
									<td>
								</c:when>

								<c:when test="${o.result == 4}">
									<!-- 배송 완료 -->
									<td><span>배송 완료</span></td>
									<td><button
											class="confirm-btn btn btn-outline-primary"
											data-ordernum="${o.ordernum}">주문확정</button></td>
								</c:when>

								<c:when test="${o.result == 5}">
									<!-- 주문 확정 -->
									<td><span>주문 확정</span></td>
									<td>
								</c:when>
							</c:choose>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<!-- 취소 form -->
		<form
			action="${pageContext.request.contextPath}/order/orderCancelForm"
			method="post" class="order-cancel-form">
			<input type="hidden" name="ordernum" class="cancel-ordernum">
		</form>
		<!-- 주문확정 form -->
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