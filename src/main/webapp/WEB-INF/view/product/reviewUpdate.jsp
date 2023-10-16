<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 업데이트</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous" />
<style>
	body {
		margin : 0;
	}
	.head_div{
	    width: 100%;
	    background-color: #7b8ed1;
	    color: white;
	    padding: 10px;
	    font-weight: bold;
  	}
  	.content_div{
  		display: flex;
        justify-content: space-around;
        align-items: center;
  	}  	
  	.content_textarea{
		width: 80%;
	    height: 100px;
	    border: 1px solid #dadada;
	    padding: 12px 8px 12px 8px;
	    font-size: 15px;
	    resize: none;
	    margin-top: 5px;
  	}
  	
  	#reviewContents {
	    width: 100%;
	    height: 150px;
	    padding: 10px;
	    box-sizing: border-box;
	    border: solid 1.5px #D3D3D3;
	    border-radius: 5px;
	    font-size: 16px;
	    resize: none;
	}
	
  	.rating_div{
  		display: flex;
        justify-content: space-around;
        align-items: center;
        direction: rtl;
  	}
  	.rating_div input[type=radio]{
    	display: none;
	}
	.rating_div label{
	    font-size: 3em;
	    color: transparent;
	    text-shadow: 0 0 0 #f0f0f0;
	}
	.rating_div label:hover{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	.rating_div label:hover ~ label{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	.rating_div input[type=radio]:checked ~ label{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	
	
	
  	
</style>
</head>
<body>
	<div class="head_div d-flex justify-content-center"><span>리뷰 수정</span></div>
	<div class="conatiner text-center">
		<div class="mt-3 mb-2">
			<h3>${product.name}</h3>
		</div>
		<div class="mb-2">
			<span>최초 작성일: 
				<fmt:formatDate value="${review.regdate}" var="dateValue" pattern="yyyy-MM-dd"/>${dateValue}</span>
		</div>
		<div class="rating_div">
			<input type="radio" name="reviewStar" value="5" id="rate1"
			<c:if test="${review.rating == 5}">checked</c:if>>
			<label for="rate1">★</label>
			<input type="radio" name="reviewStar" value="4" id="rate2"
			<c:if test="${review.rating == 4}">checked</c:if>>
			<label for="rate2">★</label>
			<input type="radio" name="reviewStar" value="3" id="rate3"
			<c:if test="${review.rating == 3}">checked</c:if>>
			<label for="rate3">★</label>
			<input type="radio" name="reviewStar" value="2" id="rate4"
			<c:if test="${review.rating == 2}">checked</c:if>>
			<label for="rate4">★</label>
			<input type="radio" name="reviewStar" value="1" id="rate5"
			<c:if test="${review.rating == 1}">checked</c:if>>
			<label for="rate5">★</label>
			<span>평점</span>
		</div>
		<div class="content_div mt-3">
			<span>리뷰</span>
			<textarea name="content" class="content_textarea">${review.content}</textarea>
		</div>
		<div class="content_counter_div">
			<span style="color:#aaa;" id="counter">( / 최대 100자)</span>
		</div>
		<div class="btn_div mt-5">
			<a class="btn btn-outline-primary update_btn">수정</a>
			<a class="btn btn-outline-secondary cancel_btn">취소</a>
		</div>
	</div>
	
	<script>
	/* 최초 글자 수 표시 */
	$('document').ready(function() {
		var original_content = String('${review.content}');
		console.log(original_content.length);
		$('#counter').html("("+original_content.length+" / 최대 100자)");
	});
	
	/* textarea 글자 수 카운팅 */
	$('.content_textarea').keyup(function (e){
	    var content = $(this).val();
	    $('#counter').html("("+content.length+" / 최대 100자)");    //글자수 실시간 카운팅
	
	    if (content.length > 100){
	        alert("리뷰는 최대 100자까지 입력 가능합니다.");
	        $(this).val(content.substring(0, 100));
	        $('#counter').html("(100 / 최대 100자)");
	    }
	});
	
	/* 취소 버튼 */
	$(".cancel_btn").on("click", function(e){
		window.close();
	});	
	
	/* 수정 버튼 */
	$(".update_btn").on("click", function(e){
	
		const reviewnum = '${review.reviewnum}';
		const prodnum = '${review.prodnum}';
		const id = '${review.id}';
		const rating = $("input[name=reviewStar]:checked").val();
		const content = $("textarea").val();
		
		
		if (rating == null) {
			alert("별점을 선택해주세요.");
		} else {
			const data = {
					reviewnum : reviewnum,
					prodnum : prodnum,
					id : id,
					content : content,
					rating : parseInt(rating) // check로 string 값을 받기 때문에 int로 형변환
			}		
			
			$.ajax({
				data : data,
				type : 'POST',
				url : '${pageContext.request.contextPath}/prodReview/update',
				success : function(result){
					alert("리뷰가 수정되었습니다.");
					opener.parent.location.reload();
					window.close();
				}
				
			});
		}
	});
	
	</script>
</body>
</html>