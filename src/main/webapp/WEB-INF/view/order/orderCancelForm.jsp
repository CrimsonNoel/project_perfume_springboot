<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 취소 확인</title>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col text-center">
			<form action="${pageContext.request.contextPath}/order/orderCancelPro"
			name="cancel" method="post">
			<input type="hidden" name="ordernum" value="${ordernum}"> <!-- ordernum을 hidden으로 넘김 -->
				<p class="fs-4">주문을 취소하시겠습니까?</p>
				<p class="fs-5">주문 번호: ${ordernum}</p>
				<button type="submit" class="btn btn-outline-danger">
					취소
				</button>
				<button type="button" class="btn btn-outline-secondary"
				onclick="location.href='${pageContext.request.contextPath}/order/orderList'">
					돌아가기
				</button>
			</form>
		</div>
	</div>
</div>
</body>
</html>