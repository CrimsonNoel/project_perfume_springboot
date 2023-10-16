<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>
	<div class="container">
		<h2 align="center">${member.name}님의 장바구니</h2>
		<br>
		<br>

		<!-- 체크박스 전체 여부 -->
		<div class="all-check-input-div px-3">
			<input type="checkbox" class="all-check-input form-check-input"
				checked="checked"> <span class="all-chcek-span px-2">전체선택</span>
		</div>
		<form method="post">
		<table class="table cartList align-middle">
			<tbody>
				<tr>
					<th scope="col" width="5%"></th>
					<th scope="col" width="30%">상품</th>
					<th scope="col" width="30%">수량</th>
					<th scope="col" width="20%">합계</th>
					<th scope="col" width="10%"></th>
				</tr>
			</tbody>
			<tbody>
				<c:forEach var="c" items="${li}">
					<tr>
						<td class="cart-info-td">
							<!-- 해당 카트의 상품 정보를 담고 있음 --> 
							<input type="checkbox" class="cart-checkbox form-check-input" name="chk" value="${c.cartid}" checked="checked">
							
							<!-- 개별 체크박스 --> 
							<input type="hidden" class="cartid-input" value="${c.cartid}"> 
							<input type="hidden" class="prodnum-input" value="${c.prodnum}"> 
							<input type="hidden" class="prodname-input" value="${c.prodname}">
							<input type="hidden" class="quantity-input" value="${c.quantity}">
							<input type="hidden" class="price-input" value="${c.price}">
							<input type="hidden" class="totalPrice-input" value="${c.price * c.quantity}">
						</td>
						<td><a href="${pageContext.request.contextPath}/product/productDetail?prodnum=${c.prodnum}"
							style="color: black;">${c.prodname}</a></td>
						<td>
							<div class="quantity-div" style="display:inline-block;">
								<input type="number" min="1" value="${c.quantity}"
									style="border: radius; outline: none; width:50px;" class="text-center">
							</div>
							<a class="quantity-update-btn btn btn-sm btn-outline-secondary"
							data-cartid="${c.cartid}">변경</a>
						</td>
						<td><span><fmt:formatNumber
									value='${c.price*c.quantity}' pattern="#,### 원" /></span></td>
						<td><button class="delete-btn btn btn-outline-danger"
							data-cartid="${c.cartid}">삭제</button></td>
					</tr>
				</c:forEach>
				
				<c:if test="${empty li}">
					<td colspan="12"><p class="text-center">
							<br>장바구니가 비어있습니다.
						</p></td>
				</c:if>
			
			</tbody>
		</table>
		<c:if test="${not empty li}">
			<div class="text-center total-section">
				<div class="d-flex justify-content-end">
					<table class="table table-borderless text-end" style="width: 30%;">
						<tr>
							<td>총 상품 가격</td>
							<td><span class="totalPrice-span"></span> 원</td>
						</tr>
						<tr>
							<td>배송비</td>
							<td><span class="deliveryPrice-span"></span> 원</td>
						</tr>
						<tr>
							<td><strong>총 결제 예상 금액</strong></td>
							<td><span class="finalTotalPrice-span"></span> 원</td>
						</tr>
					</table>
				</div>
				<!-- 구매 버튼 영역 -->
				<div class="content-btn-section">
					<input type="submit" formaction="${pageContext.request.contextPath}/order/order"
					 class="order-btn btn btn-bg btn-outline-primary order-btn"  value="주문하기">
				</div>
			</div>
		</c:if>
		</form>


				<!-- 수량 조정 form -->
				<form action="${pageContext.request.contextPath}/cart/cartUpdate"
					method="post" class="quantity-update-form">
					<input type="hidden" name="cartid" class="update-cartid"> 
					<input type="hidden" name="quantity" class="update-quantity">
				</form>
				
				<!-- 삭제 form -->
				<form action="${pageContext.request.contextPath}/cart/cartDelete" 
					method="post" class="quantity-delete-form">
					<input type="hidden" name="cartid" class="delete-cartid">
				</form>
			</div>

	
	<script>
		/* 총 주문 정보 */
		function setTotalInfo() {
			let totalPrice = 0;
			let deliveryPrice = 0;
			let finalTotalPrice = 0;

			$(".cart-info-td")
					.each(
							function(index, element) {
								if ($(element).find(".cart-checkbox").is(
										":checked") === true) { //체크여부
									// 총 가격
									totalPrice += parseInt($(element).find(
											".totalPrice-input").val());
								}
							});

			if (totalPrice >= 50000) {
				deliveryPrice = 0;
			} else if (totalPrice == 0) {
				deliveryPrice = 0;
			} else {
				deliveryPrice = 2500;
			}

			finalTotalPrice = totalPrice + deliveryPrice;

			$(".totalPrice-span").text(totalPrice.toLocaleString());
			$(".deliveryPrice-span").text(deliveryPrice.toLocaleString());
			$(".finalTotalPrice-span").text(finalTotalPrice.toLocaleString());
		}

		/* 사용자가 페이지에서 총 주문 정보를 바로 볼 수 있게 */
		$(document).ready(function() {
			setTotalInfo();
		});

		/* 체크여부에 따른 종합 정보 변화 */
		$(".cart-checkbox").on("change", function() {
			/* 총 주문 정보 세팅(배송비, 총 가격) */
			setTotalInfo($(".cart-info-td"));
		});

		/* 체크박스 전체 선택 */
		$(".all-check-input").on("click", function() {

			/* 체크박스 체크/해제 */
			if ($(".all-check-input").prop("checked")) {
				$(".cart-checkbox").attr("checked", true);
			} else {
				$(".cart-checkbox").attr("checked", false);
			}

			/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
			setTotalInfo($(".cart-info-td"));
		});

		/* 수량 수정 버튼 */
		$(".quantity-update-btn").on("click", function() {
			let cartId = $(this).data("cartid");
			let quantity = $(this).parent("td").find("input").val();
			$(".update-cartid").val(cartId);
			$(".update-quantity").val(quantity);
			$(".quantity-update-form").submit();
		});
		
		/* 장바구니 삭제 버튼 */
		$(".delete-btn").on("click", function(e){
			e.preventDefault(); // submit 후 페이지 새로고침을 막음
			const cartId = $(this).data("cartid");
			$(".delete-cartid").val(cartId);
			$(".quantity-delete-form").submit();
		});

	</script>
</body>
</html>