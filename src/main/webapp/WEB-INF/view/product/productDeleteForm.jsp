<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">


<title>상품 삭제</title>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col text-center">
			<form action="${pageContext.request.contextPath}/product/productDeletePro"
			name="del" method="post">
			<input type="hidden" name="prodnum" value="${prodnum}"> 
			
				<label class="fs-4"> 상품을 삭제하시겠습니까?</label><br>
				<button type="submit" class="btn btn-outline-danger">
					삭제
				</button>
				
				<a href="${pageContext.request.contextPath}/product/productManagement?prodans1=all&order=prodnum">
				<button type="button" class="btn btn-outline-secondary">
				 취소
				</button>
				</a>
			</form>
		</div>
	</div>
</div>


</body>
</html>