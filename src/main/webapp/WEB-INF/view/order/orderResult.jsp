<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 완료 페이지</title>
</head>
<body>
	<div class="container text-center">
		<h3>주문이 완료되었습니다.</h3>
				<p class="fs-5">주문 번호: ${ordernum}</p>
				<button type="button" class="btn btn-outline-primary"
					onclick="location.href='${pageContext.request.contextPath}/order/orderDetail?ordernum=${ordernum}'">
					주문 확인하기
				</button>
	</div>
</body>
</html>