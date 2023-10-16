<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 쓰기</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous" />
<style>
body {
	margin: 0;
}

.head_div {
	width: 100%;
	background-color: #7b8ed1;
	color: white;
	padding: 10px;
	font-weight: bold;
}
</style>

</head>
<body>
	<div class="head_div d-flex justify-content-center">
		<span>리뷰 삭제</span>
	</div>

	<div class="text-center mt-5">
		<span>리뷰를 삭제하시겠습니까?</span>
	</div>

	<div class="btn_div text-center mt-5">
		<a class="btn btn-outline-danger delete_btn">삭제</a> <a
			class="btn btn-outline-secondary cancel_btn">취소</a>
	</div>


	<script>
		/* 취소 버튼 */
		$(".cancel_btn").on("click", function(e) {
			window.close();
		});
		
		/* 삭제 버튼 */
		$(".delete_btn").on("click", function(e){
	
		const id = '${review.id}';
		const loginId = '${id}';
		const reviewnum = '${review.reviewnum}'
		
		
		if (id !== loginId) {
			alert("해당 리뷰를 작성한 회원만 삭제할 수 있습니다.");
		} else {
			const data = {
					reviewnum : reviewnum,
			}		
			
			$.ajax({
				data : data,
				type : 'POST',
				url : '${pageContext.request.contextPath}/prodReview/delete',
				success : function(result){
					alert("리뷰가 삭제되었습니다.");
					opener.parent.location.reload();
					window.close();
				}
				
			});
		}
	});
		
		
	</script>
</body>
</html>