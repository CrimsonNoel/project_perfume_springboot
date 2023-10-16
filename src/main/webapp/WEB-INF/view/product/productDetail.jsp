<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${product.name}</title>
<style>
.rate {
	background:
		url('${pageContext.request.contextPath}/images/shop/star_bg.png')
		no-repeat;
	width: 120px;
	height: 19px;
	position: relative;
}

.rate .my_rating {
	position: absolute;
	background:
		url('${pageContext.request.contextPath}/images/shop/star.png');
	width: auto;
	height: 19px;
}

.rate .other_rating {
	position: absolute;
	background:
		url('${pageContext.request.contextPath}/images/shop/star.png');
	width: auto;
	height: 19px;
}

.avg_rate {
	background:
		url('${pageContext.request.contextPath}/images/shop/star_bg.png')
		no-repeat;
	background-size: cover;
	width: 240px;
	height: 38px;
	position: relative;
}

.avg_rate .avg_rating {
	position: absolute;
	background:
		url('${pageContext.request.contextPath}/images/shop/star.png');
	background-size: cover;
	width: auto;
	height: 38px;
}
</style>
</head>

<body>

	<div class="container">
		<div class="card mb-3" style="max-width: 1500px;">
			<div class="row g-0">
				<div class="col-md-4">
					<img
						src="${pageContext.request.contextPath}/view/product/images/${product.image}"
						class="img-fluid rounded-start" alt="...">
				</div>
				<div class="col-md-8">
					<div class="card-body">
						<h5 class="card-title">${product.name}</h5>
						<div class="mb-3">
							<b>상품번호</b> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
							${product.prodnum}
						</div>
						<div class="mb-3">
							<b>재고 수 </b> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
							<fmt:formatNumber value='${product.stock}' pattern="#,### 개" />
						</div>
						<div>
							<span class="fs-3 fw-bold" style="padding-right: 20px;"> <fmt:formatNumber
									value='${product.price}' pattern="#,### 원" />
							</span>
							<div class="avg_rate" id="title_rating"
								style="display: inline-block; width: 120px; height: 19px;">
								<span class="avg_rating" style="height: 19px;"></span>
							</div>
							<span style="font-size: 17px; padding-left: 20px;">평점: </span> <span
								class="avg_rating_text" style="font-size: 20px;"></span> <span
								style="font-size: 20px;">/ 5.0</span>
						</div>
						<hr>
						<div class="mb-3">
							<b>배송비 </b>
							&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 2,500원
							(50,000원 이상 구매 시 무료)
						</div>
						<div class="mb-3">
							<b>출고예정일</b> &nbsp&nbsp&nbsp&nbsp&nbsp 2시 이전 당일출고(주말,공휴일 제외)
						</div>
						<div class="mb-3">
							<b>배송방법 </b> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 퍼퓸컴퍼니 / 본사
							검수 및 직배송 / CJ대한통운
						</div>
						<c:choose>
							<c:when test="${product.stock < 1}">
							<div>
								<span style="color: red;">품절된 상품입니다.</span>
							</div>
							</c:when>
							<c:otherwise>
								<div class="quantity-div-parent">
									<div class="quantity-div" style="display: inline-block;">
										<input type="text" value="1"
											style="border: radius; outline: none; width: 50px;"
											class="text-center">
										<button class="plus-btn btn btn-sm btn-outline-primary">+</button>
										<button class="minus-btn btn btn-sm btn-outline-success">-</button>
									</div>
									<a class="order-btn btn btn-info">상품주문</a> <a
										class="cart-btn btn btn-secondary">장바구니</a>
								</div>
							</c:otherwise>
						</c:choose>

					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="detail">
		<div class="text-center">
			<img
				src="${pageContext.request.contextPath}/view/product/images/${product.detail}"
				class="rounded" alt="...">
		</div>
	</div>
	<div class="deliver">
		<div class="text-center">
			<img
				src="${pageContext.request.contextPath}/view/product/images/상품구매안내.png"
				class="rounded" alt="...">
		</div>
	</div>

	<div class="container">
		<div class="d-flex justify-content-center mb-3">
			<h3>리뷰</h3>
		</div>
		<div class="d-flex justify-content-center mb-1">
			<div class="avg_rate">
				<span class="avg_rating"></span>
			</div>
		</div>
		<div class="text-center">
			<span class="avg_rating_text" style="font-size: 20px;"></span> <span
				style="font-size: 20px;">/ 5.0</span>
		</div>

		<c:if test="${id != null}">
			<div class="d-flex justify-content-end">
				<button class="btn btn-outline-primary review_btn">리뷰 쓰기</button>
			</div>
		</c:if>
		<div>
			<c:if test="${empty list}">
				<div class="text-center">
					<span>작성된 리뷰가 없습니다.</span>
				</div>
			</c:if>
			<c:if test="${not empty list}">
				<c:if test="${myReview != null}">
					<div class="mb-2">
						<input type="hidden" class="myReviewNum"
							value="${myReview.reviewnum}"> <span class="pe-3"><strong>${myReview.id}</strong></span>
						<div class="rate" style="display: inline-block;">
							<span class="my_rating">${myReview.rating}</span>
						</div>
						<span class="px-3"> <fmt:formatDate
								value="${myReview.regdate}" var="dateValue" pattern="yyyy-MM-dd" />${dateValue}
						</span> <a class="btn btn-sm btn-outline-secondary review_update_btn">수정</a>
						<a class="btn btn-sm btn-outline-danger review_delete_btn">삭제</a>
						<span style="color: blue;" class="ps-3">나의 리뷰!</span>
					</div>
				</c:if>
				<div>
					<span>${myReview.content}</span>
				</div>
				<hr>
				<c:forEach var="r" items="${list}" varStatus="status">
					<c:if test="${id ne null}">
						<c:if test="${reviewIdList[status.index] ne id}">
							<div class="mb-2">
								<span class="pe-3"><strong>${r.id}</strong></span>
								<div class="rate" style="display: inline-block;">
									<span class="other_rating_${status.index} other_rating">${r.rating}</span>
								</div>
								<span class="px-3"> <fmt:formatDate value="${r.regdate}"
										var="dateValue" pattern="yyyy-MM-dd" />${dateValue}
								</span>
							</div>
							<div>
								<span>${r.content}</span>
							</div>
							<hr>
						</c:if>
					</c:if>
					<c:if test="${id eq null}">
						<div class="mb-2">
							<span class="pe-3"><strong>${r.id}</strong></span>
							<div class="rate" style="display: inline-block;">
								<span class="other_rating_${status.index} other_rating">${r.rating}</span>
							</div>
							<span class="px-3"> <fmt:formatDate value="${r.regdate}"
									var="dateValue" pattern="yyyy-MM-dd" />${dateValue}
							</span>
						</div>
						<div>
							<span>${r.content}</span>
						</div>
						<hr>
					</c:if>
				</c:forEach>
			</c:if>
		</div>
	</div>

	<!-- 장바구니 form -->
	<form action="${pageContext.request.contextPath}/cart/cartPro"
		method="post" class="cart-form">
		<input type="hidden" name="prodnum" value="${product.prodnum}">
		<input type="hidden" name="quantity" class="input-quantity"> <input
			type="hidden" name="prodname" value="${product.name}"> <input
			type="hidden" name="price" value="${product.price}">
	</form>

	<!-- 주문하기 form -->
	<form action="${pageContext.request.contextPath}/order/order"
		method="post" class="order-form">
		<input type="hidden" name="prodnum" value="${product.prodnum}">
		<input type="hidden" name="quantity" class="order-quantity">
	</form>


	<script>
		/* 수량버튼 */
		$(".plus-btn").on("click", function() {
			let quantity = $(this).parent("div").find("input").val();
			$(this).parent("div").find("input").val(++quantity);
		});
		$(".minus-btn").on("click", function() {
			let quantity = $(this).parent("div").find("input").val();
			if (quantity > 1) {
				$(this).parent("div").find("input").val(--quantity);
			}
		});

		/* 장바구니 버튼 */
		$(".cart-btn").on("click", function() {
			let quantity = $(this).parent("div").find("input").val();
			if (quantity < 1) {
				alert("장바구니에 추가하려는 수량이 1개 미만입니다.");
			} else {
				$(".input-quantity").val(quantity);
				$(".cart-form").submit();
			}
		});
		
		/* 주문하기 버튼 */
		$(".order-btn").on("click", function() {
			let quantity = $(this).parent("div").find("input").val();
			if (quantity < 1) {
				alert("주문하시려는 수량이 1개 미만입니다.");
			} else {
				$(".order-quantity").val(quantity);
				$(".order-form").submit();
			}
		});
		
		/* 리뷰 평점 별 */
		$("document").ready(function() {
			let total_rating = 0;
			/* 나의 리뷰 */
			let my_rating = parseInt($(".my_rating").text());
			$(".my_rating").empty();
			let star_width = (my_rating / 5) * 100;
			$(".my_rating").css("width", star_width+'%');
			
			/* 다른 사람 리뷰 */
			for (let i = 0; i < ${list.size()}; i++) {
				let other_rating = $(".other_rating_"+i).text();
				let other_star_width = (other_rating / 5) * 100;
				$(".other_rating_"+i).empty();
				$(".other_rating_"+i).css("width", other_star_width+'%');
				if (other_rating.trim() != "") {
					total_rating += parseInt(other_rating);
				}
			}
			
			console.log("total_rating: " + total_rating);
			console.log("my_rating: " + my_rating);
			
			
			/* 평균 평점 */
			if (total_rating == 0 && isNaN(my_rating) == true) { // 리뷰가 아예 없는 경우
				$(".avg_rating_text").text("리뷰 없음");
			} else if (total_rating == 0 && isNaN(my_rating) == false) { // 나의 리뷰만 있는 경우
				avg_rating = parseInt(my_rating);
				let avg_star_width = (avg_rating / 5) * 100;
				const roundNum = (Math.round(avg_rating * 10) / 10).toFixed(1);
				$(".avg_rating_text").text(roundNum);
				$(".avg_rating").css("width", avg_star_width+'%');
			} else if (total_rating != 0 && isNaN(my_rating) == true) { // 다른 사람의 리뷰만 있는 경우
				avg_rating = total_rating/${list.size()};
				const roundNum = (Math.round(avg_rating * 10) / 10).toFixed(1);
				let avg_star_width = (avg_rating / 5) * 100;
				$(".avg_rating_text").text(roundNum);
				$(".avg_rating").css("width", avg_star_width+'%');
				let cscswidth = $(".avg_rating").width();
			} else if (total_rating != 0 && isNaN(my_rating) == false) { // 나의 리뷰 + 다른 사람의 리뷰 모두 있는 경우
				total_rating += parseInt(my_rating);
				avg_rating = total_rating/${list.size()};
				const roundNum = (Math.round(avg_rating * 10) / 10).toFixed(1);
				let avg_star_width = (avg_rating / 5) * 100;
				$(".avg_rating_text").text(roundNum);
				$(".avg_rating").css("width", avg_star_width+'%');
				let cscswidth = $(".avg_rating").width();
			}
			
			
		});
		
		
		
		
		/* 리뷰쓰기 팝업 */
		$(".review_btn").on("click", function(e){
		
		e.preventDefault();			
		
		const id = '${id}';
		const prodnum = '${product.prodnum}';
		const availableReview = '${availableReview}';
	
		$.ajax({
			data : {
				prodnum, prodnum,
				id, id
			},
			url : '${pageContext.request.contextPath}/prodReview/check',
			type : 'POST',
			success : function(result){
				if (availableReview == 1) {
					if(result === "1"){
						alert("이미 등록된 리뷰가 존재 합니다.");
					} else if(result === "0"){
						let popUrl = "reviewEnroll/" + id + "?prodnum=" + prodnum;
						console.log(popUrl);
						let popOption = "width = 490px, height=490px, top=300px, left=300px, scrollbars=yes";
						
						window.open(popUrl,"리뷰 쓰기",popOption);						
					}
				} else {
					alert("구매하신 상품만 리뷰를 남기실 수 있습니다.\n(주문 확정을 해야합니다.)");
				}
			}
		})
		});
		
		/* 리뷰 수정 버튼 */
		$(document).on('click', '.review_update_btn', function(e){
			
			const availableReview = '${availableReview}';
			
			if (availableReview == 1) {
			e.preventDefault();
			let reviewnum = $(this).parent("div").find("input").val();
			let popUrl = "reviewUpdate?reviewnum=" + reviewnum + "&prodnum=" + '${product.prodnum}' + "&id=" + '${id}';	
			let popOption = "width = 490px, height=490px, top=300px, left=300px, scrollbars=yes"	
				
			window.open(popUrl,"리뷰 수정",popOption);
			} else {
				alert("주문 내역이 없어 리뷰를 수정하실 수 없습니다. 관리자에게 문의하세요.") // 주문이 삭제되어서 확인이 불가능한 경우
			}
		});
		
		/* 리뷰 삭제 버튼 */
		$(document).on('click', '.review_delete_btn', function(e){
			
			const availableReview = '${availableReview}';
			
			if (availableReview == 1) {
			e.preventDefault();
			let reviewnum = $(this).parent("div").find("input").val();
			let popUrl = "reviewDelete?reviewnum=" + reviewnum;	
			let popOption = "width = 490px, height=490px, top=300px, left=300px, scrollbars=yes"	
			
			window.open(popUrl,"리뷰 삭제",popOption);
			} else {
				alert("주문 내역이 없어 리뷰를 삭제하실 수 없습니다. 관리자에게 문의하세요.") // 주문이 삭제되어서 확인이 불가능한 경우
			}
		});
		
	</script>
</body>
</html>