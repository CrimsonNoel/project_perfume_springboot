<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문서 작성</title>
<!-- 주소 api -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<div class="container">
		<h3 class="text-center">주문서 작성</h3>

		<table class="table table-borderless table-hover">
			<tbody>
				<tr>
					<th style="width: 10%">주문자</th>
					<td style="width: *">${member.name}님</td>
				</tr>
			</tbody>
		</table>

		<form method="post" onsubmit="return blankchk(this);">
			<!-- 주문 정보 입력 -->
			<div class="info-div">
				<br>
				<div class="container mt-3 address-input-div">
					<div>
						<label>받으시는 분</label> <input class="form-control" type="text"
							name="name" id="name" placeholder="받으시는 분의 성함을 입력해주세요."
							value="${member.name}">
					</div>

					<div class="mt-3">
						<label>전화번호</label> <input class="form-control" type="text"
							name="tel" id="tel" value="${member.tel}">
					</div>

					<div class="mt-3 mb-1">
						<p class="mb-0">
							<label>주소</label>
						</p>
						<div class="row">
							<div class="col">
								<input class="form-control" type="text" id="sample4_postcode"
									name="zipcode" placeholder="우편번호" readonly>
							</div>
							<div class="col">
								<input type="button" class="btn btn-outline-secondary" id="searchZipcodeBtn"
									onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
							</div>
						</div>
					</div>

					<div class="mb-1">
						<div class="row">
							<div class="col">
								<input class="form-control" type="text" id="sample4_roadAddress"
									name="address" placeholder="도로명주소" readonly>
							</div>
							<div class="col">
								<input class="form-control" type="text"
									id="sample4_jibunAddress" placeholder="지번주소" readonly>
							</div>
						</div>
					</div>
					<span id="guide" style="color: #999; display: none"></span>
					<div class="mb-3">
						<div class="row">
							<div class="col">
								<input class="form-control" type="text"
									id="sample4_detailAddress" placeholder="상세주소"
									name="detailaddress">
							</div>
							<div class="col">
								<input class="form-control" type="text"
									id="sample4_extraAddress" placeholder="참고항목" readonly>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="product-div">
				<!-- 상품 종류 -->
				<div class="kind-div text-end">
					주문상품: <span class="kd-kind-span"></span>종 <span
						class="kd-quantity-span"></span>개
				</div>

				<!-- 상품 테이블 -->
				<div class="d-flex justify-content-start">
					<table class="table product-subject-div" style="width: 80%;">
						<colgroup>
							<col width="40%">
							<col width="20%">
							<col width="40%">
						</colgroup>
						<tbody>
							<tr>
								<th>상품</th>
								<th>수량</th>
								<th>총액</th>
							</tr>
						</tbody>
					</table>
				</div>

				<c:if test="${not empty list}">
					<c:forEach var="li" items="${list}" varStatus="status">
						<c:forEach var="p" items="${list[status.index]}">
							<div class="d-flex justify-content-start">
								<table class="table product-main-div" style="width: 80%;">
									<colgroup>
										<col width="41%">
										<col width="19%">
										<col width="40%">
									</colgroup>
									<tbody>
										<tr>
											<td>${p.name}</td>
											<td>${quantityList[status.index]}</td>
											<td class="price-td"><fmt:formatNumber
													value='${p.price*quantityList[status.index]}'
													pattern="#,### 원" /> <input type="hidden"
												name="multi-price" class="price-input" value="${p.price}">
												<input type="hidden" name="multi-prodnum"
												class="prodnum-input" value="${p.prodnum}"> <input
												type="hidden" name="multi-quantity" class="quantity-input"
												value="${quantityList[status.index]}"> <input
												type="hidden" name="multi-total-price"
												class="total-price-input"
												value="${p.price*quantityList[status.index]}"></td>
										</tr>
									</tbody>
								</table>
							</div>
						</c:forEach>
					</c:forEach>
				</c:if>

				<c:if test="${empty list}">
					<c:forEach var="p" items="${li}">
						<div class="d-flex justify-content-start">
							<table class="table product-main-div" style="width: 80%;">
								<colgroup>
									<col width="41%">
									<col width="19%">
									<col width="40%">
								</colgroup>
								<tbody>
									<tr>
										<td>${p.name}</td>
										<td>${quantity}</td>
										<td class="price-td-single"><fmt:formatNumber
												value='${p.price*quantity}' pattern="#,### 원" /> <input
											type="hidden" name="single-price" class="single-price-input"
											value="${p.price}"> <input type="hidden"
											name="single-prodnum" class="single-prodnum-input"
											value="${p.prodnum}"> <input type="hidden"
											name="single-quantity" class="single-quantity-input"
											value="${quantity}"> <input type="hidden"
											name="single-total-price" class="single-total-price-input"
											value="${p.price*quantity}"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</c:forEach>
				</c:if>
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
								<td><strong>총 결제 금액</strong></td>
								<td><span class="finalTotalPrice-span"></span> 원</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="order-btn-div text-center">
				<input type="submit"
					formaction="${pageContext.request.contextPath}/order/orderPro"
					class="order-btn btn btn-bg btn-outline-primary order-btn"
					value="주문하기">
				<button type="button" class="btn btn-outline-secondary"
					onclick="location.href='${pageContext.request.contextPath}/home/index'">
					주문취소</button>
			</div>
		</form>
	</div>

	<script>
	/* 주소 */
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample4_postcode').value = data.zonecode;
						document.getElementById("sample4_roadAddress").value = roadAddr;
						document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
						if (roadAddr !== '') {
							document.getElementById("sample4_extraAddress").value = extraRoadAddr;
						} else {
							document.getElementById("sample4_extraAddress").value = '';
						}

						var guideTextBox = document.getElementById("guide");
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';
							guideTextBox.style.display = 'block';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							guideTextBox.innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';
							guideTextBox.style.display = 'block';
						} else {
							guideTextBox.innerHTML = '';
							guideTextBox.style.display = 'none';
						}
					}
				}).open();
	}
	
	/* 총액 정보 */
	function setTotalInfo() {
		let totalPrice = 0;
		let deliveryPrice = 0;
		let finalTotalPrice = 0;
		let totalQuantity = 0;
		let totalKind = 0;
		
		<c:if test="${not empty list}"> // 장바구니 -> 주문페이지
		$(".price-td").each(function(index, element){
			totalPrice += parseInt($(element).find(".total-price-input").val());
			totalQuantity += parseInt($(element).find(".quantity-input").val());
			totalKind += 1;
		});
		</c:if>
			
		<c:if test="${empty list}"> // 상품페이지 -> 주문페이지
		$(".price-td-single").each(function(index, element){
			totalPrice += parseInt($(element).find(".single-total-price-input").val());
			totalQuantity += parseInt($(element).find(".single-quantity-input").val());
			totalKind = 1;
		});
		</c:if>
		
		if (totalPrice >= 50000) {
			deliveryPrice = 0;
		} else if (totalPrice == 0) {
			deliveryPrice = 0;
		} else {
			deliveryPrice = 2500;
		}
		
		finalTotalPrice = totalPrice + deliveryPrice;
		
		$(".kd-kind-span").text(totalKind);
		$(".kd-quantity-span").text(totalQuantity);
		$(".totalPrice-span").text(totalPrice.toLocaleString());
		$(".deliveryPrice-span").text(deliveryPrice.toLocaleString());
		$(".finalTotalPrice-span").text(finalTotalPrice.toLocaleString());
		
	}
	
	$(document).ready(function(){
		setTotalInfo();
	});
	
	<!-- 빈칸 체크 -->

	function blankchk(form) {
		if(document.getElementById( 'name' ).value.trim() == "") {
	        alert("이름을 입력해주세요.")
	        form.name.focus()
	        return false;
	    }
		if(document.getElementById( 'tel' ).value.trim() == "") {
	        alert("전화번호를 입력해주세요.")
	        form.tel.focus()
	        return false;
		}
		if(document.getElementById( 'sample4_postcode' ).value.trim() == "") {
	        alert("우편번호를 입력해주세요.")
	        form.zipcode.focus()
	        return false;
	    }
	    if(document.getElementById( 'sample4_roadAddress' ).value.trim() == "") {
	        alert("주소를 입력해주세요.")
	        form.address.focus()
	        return false;
	    }
	    if(document.getElementById( 'sample4_detailAddress' ).value.trim() == "") {
	        alert("상세주소를 입력해주세요.")
	        form.detailaddress.focus()
	        return false;
	    }	else return true;
	    };
	
</script>
</body>
</html>