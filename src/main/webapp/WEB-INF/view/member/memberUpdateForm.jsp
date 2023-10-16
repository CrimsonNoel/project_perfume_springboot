<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>


<!-- 회원정보수정 시 우편번호 주소-->

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
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
</script>

<!-- 회원정보 수정 시 아이디 4글자 이상 경고문구 -->

<script>
	function Validation() {
    	var id = document.getElementById("id")

		if(id.value.length <4){
    	alert("아이디를 4글자 이상 입력하세요.")
    	id.focus();
    	return false;
		}
}
</script>


</head>
<body>
	<br>
	<br>
	<br>
	<div class="container mt-3">
		<h2 align="center">회원정보수정</h2>
	</div>
	<br>
	<div class="container mt-3">
		<form class="container" name="f"
			action="${pageContext.request.contextPath}/member/memberUpdatePro"
			method="post">

<!-- 회원정보 수정시 아이디 중복확인 -->
	<script>
    function checkDuplicateId() {
    	//alert("ok")
        var id = document.getElementById("id").value;
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    var response = xhr.responseText;
                    
                    alert(response)
                } else {
                    console.error(xhr.status);
                }
            }
        };
        var url = "${pageContext.request.contextPath}/member/checkDuplicateId";
        xhr.open("POST", url, true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.send("id=" + id);
    }
</script>
		 
			<p>
				<label>아이디</label> <input class="form-control" type="text" name="id" id="id" placeholder="${mem.id}" readonly="readonly"></p>
			<p>
				<label>비밀번호</label> <input class="form-control" type="password" name="pass" placeholder="Password"></p>
			<p>
				<label>이름</label> <input class="form-control" type="text" name="name" placeholder="Username" value="${mem.name}"></p>
			<p>
				<label>성별</label>
			<div class="form-check"><input class="form-check-input" type="radio" name="gender" value="1" ${mem.gender==1 ? "checked" : ""}>남<br></div>
			<p>
			<div class="form-check"><input class="form-check-input" type="radio" name="gender" value="2" ${mem.gender==2 ? "checked" : ""}>여</div></p>
			<p>
				<label>전화번호</label> 
				<input class="form-control" type="text" name="tel" placeholder="Phone Number" value="${mem.tel}"></p>
			<p>
				<label>이메일</label> 
				<input class="form-control" type="text"name="email" placeholder="example@hotmail.com" value="${mem.email}"></p>
			<p>
				<label>주소</label> 
				<br>
			<div class="row">
			<div class="col">
				<input class="form-control" type="text" name="zipcode" id="sample4_postcode" placeholder="우편번호" value="${mem.zipcode}"></div>
			<div class="col">
				<input type="button" onclick="sample4_execDaumPostcode()"value="우편번호 찾기"></div></div></p>
			<p>
			<div class="row">
			<div class="col">
					<input class="form-control" type="text" id="sample4_roadAddress" placeholder="도로명주소"></div>
			<div class="col">
					<input class="form-control" type="text" name="address"
						id="sample4_jibunAddress" placeholder="지번주소" value="${mem.address}"></div></div></p>
			<span id="guide" style="color: #999; display: none"></span>
			<p>
			<div class="row">
				<div class="col">
					<input class="form-control" type="text" id="sample4_detailAddress" placeholder="상세주소"></div>
				<div class="col">
					<input class="form-control" type="text" id="sample4_extraAddress" placeholder="참고항목"></div></div></p><br><br>
			<p>
				<input class="form-control" type="submit" value="정보수정">
			</p>
		</form>
	</div>
</body>
</html>

