<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<style>
li {
	list-style-type: none;
}

.subdivision a {
	color: black;
}

.subdivision a:hover {
	text-decoration: underline;
}

.avg_rate {
	background:
		url('${pageContext.request.contextPath}/images/shop/star_bg.png')
		no-repeat;
	width: 120px;
	height: 19px;
	position: relative;
}

.avg_rate .avg_rating {
	position: absolute;
	background:
		url('${pageContext.request.contextPath}/images/shop/star.png');
	background-size: cover;
	width: auto;
	height: 19px;
}

</style>
</head>

<body>
	<div class="text-center mb-2">
		<h2>${ansName}</h2>
	</div>

	
	<!-- 상품 정렬 -->
	<div class="array mb-3 text-center subdivision">
		<p>
		<c:if test="${order eq 'prodnum'}">
			<a  href="${pageContext.request.contextPath}/product/shop?prodans1=${prodans1}&order=prodnum"><b>최신순</b></a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
			</c:if>
			<c:if test="${order ne 'prodnum'}">
			<a  href="${pageContext.request.contextPath}/product/shop?prodans1=${prodans1}&order=prodnum">최신순</a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
			</c:if>
			
			<c:if test="${order eq 'stock'}">
			<a  href="${pageContext.request.contextPath}/product/shop?prodans1=${prodans1}&order=stock"><b>판매량순</b></a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
			</c:if>
			<c:if test="${order ne 'stock'}">
			<a  href="${pageContext.request.contextPath}/product/shop?prodans1=${prodans1}&order=stock">판매량순</a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
			</c:if>
			
			<c:if test="${order eq 'pricedesc'}">
			<a  href="${pageContext.request.contextPath}/product/shop?prodans1=${prodans1}&order=pricedesc"><b>높은 가격순</b></a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
			</c:if>
			<c:if test="${order ne 'pricedesc'}">
			<a  href="${pageContext.request.contextPath}/product/shop?prodans1=${prodans1}&order=pricedesc">높은 가격순</a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
			</c:if>
			
			<c:if test="${order eq 'priceasc'}">
			<a  href="${pageContext.request.contextPath}/product/shop?prodans1=${prodans1}&order=priceasc"><b>낮은 가격순</b></a>
			</c:if> 
			<c:if test="${order ne 'priceasc'}">
			<a  href="${pageContext.request.contextPath}/product/shop?prodans1=${prodans1}&order=priceasc">낮은 가격순</a>
			</c:if> 
			
			 
		</p>
	</div>
 <input type="hidden"   name="order"   value="${order}"/> 
 
	<!-- 제품 이미지 -->
	<div class="product text-center  flex-wrap:wrap"
		style="width: 81%; margin: auto;">

		<c:forEach var="p" items="${li}" varStatus="status">
			<ul class="d-inline-flex flex-sm-column m-auto p-5">
				<li class="mt-3">
					<div class="card" style="width: 18rem;">
						<a
							href="${pageContext.request.contextPath}/product/productDetail?prodnum=${p.prodnum}">
							<img
							src="${pageContext.request.contextPath}/view/product/images/${p.image}"
							class="card-img-top" alt="...">
						</a>
						<div class="card-body container text-center">
							<h5 class="card-title">${p.name}</h5>
							<p class="card-text">
								<fmt:formatNumber value='${p.price}' pattern="#,### 원" />
							</p>
						</div>
						<ul class="list-group list-group-flush">
						</ul>
						<div class="card-body container text-center">
							<div class="avg_rate align-middle text-start"
								style="display: inline-block;">
								<span class="avg_rating" id="avg_rating_${status.index}">
									${ratingList[status.index]}</span>
							</div>
							<a href="#" class="card-link cart-btn ps-3"
								data-prodnum="${p.prodnum}" data-prodname="${p.name}"
								data-price="${p.price}"> <img
								src="${pageContext.request.contextPath}/images/shop/cart.png"
								alt="" width="30px"></a>
						</div>
					</div>
				</li>

			</ul>
		</c:forEach>
	</div>
	<!-- 상품 페이지 표시 -->
	<br>
	<div class="text-center">
		<!-- 이전 버튼 -->
		<c:if test="${start < bottomLine}">
			<a href="#" class="btn btn-sm btn-outline-danger disabled">이전</a>
		</c:if>
		<c:if test="${start > bottomLine}">
			<a
				href="${pageContext.request.contextPath}/product/shop?pageNum=${start-bottomLine}&prodans1=${prodans1}&order=${order}"
				class="btn btn-sm btn-outline-primary">이전</a>
		</c:if>

		<!-- 현재 페이지 표시 -->
		<c:forEach var="p" begin="${start}" end="${end}">
			<a
				href="${pageContext.request.contextPath}/product/shop?pageNum=${p}&prodans1=${prodans1}&order=${order} "
				class="btn <c:if test="${pageInt==p}"> btn-sm btn-outline-secondary </c:if> ml-3 mr-3">${p}</a>
		</c:forEach>

		<!-- 다음 버튼 -->
		<c:if test="${end >= maxPage}">
			<a href="#" class="btn btn-sm btn-outline-danger disabled">다음</a>
		</c:if>
		<c:if test="${end <  maxPage}">
			<a
				href="${pageContext.request.contextPath}/product/shop?pageNum=${start+bottomLine}&prodans1=${prodans1}&order=${order}"
				class="btn btn-sm btn-outline-primary">다음</a>
		</c:if>
	</div>


	<!-- 장바구니 form -->
	<form action="${pageContext.request.contextPath}/cart/cartPro"
		method="post" class="cart-form">
		<input type="hidden" name="prodnum" class="current-prodnum"> <input
			type="hidden" name="price" class="current-price"> <input
			type="hidden" name="prodname" class="current-prodname"> <input
			type="hidden" name="quantity" value="1">
	</form>


	<script>
		/* 장바구니 버튼 */
		$(".cart-btn").on("click", function() {
			let prodnum = $(this).data("prodnum");
			let prodname = $(this).data("prodname");
			let price = $(this).data("price");
			$(".current-prodnum").val(prodnum);
			$(".current-prodname").val(prodname);
			$(".current-price").val(price);
			$(".cart-form").submit();
		});


		/* 상품 평점 */
		$("document").ready(function() {

			for (i = 0; i < '${li.size()}'; i++) {
				let rating = $("#avg_rating_"+i).text();
				$("#avg_rating_"+i).empty();
				let star_width = (rating / 5) * 100;
				$("#avg_rating_"+i).css("width", star_width + '%');
			}

		});		
	</script>
</body>
</html>