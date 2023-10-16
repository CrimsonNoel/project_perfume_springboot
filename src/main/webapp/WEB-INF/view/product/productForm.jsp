<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">


<title>상품 등록</title>
</head>
<body>

<form action="${pageContext.request.contextPath}/product/productPro" enctype="multipart/form-data"  
method="post" id="productForm" onsubmit="return blankchk();">
	<div  class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				상품 등록
			</h1>
		</div>
	</div>
	
	<div class="container">
		
			
			
			<div class="form-group row">
				<label class="col-sm-2">상품 이름</label>
				<div class="com-sm-3">
					<input type="text" id="name" name="name" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">상품 가격</label>
				<div class="com-sm-3">
					<input type="number" min="1" id="price" name="price" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">재고</label>
				<div class="com-sm-3">
					<input type="number" min="1" id="stock" name="stock" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">상세정보</label>
				<div class="com-sm-5">
					<textarea id="info" name="info" cols="50" rows="2" class="form-control"></textarea>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">성별</label>
				<div class="com-sm-5">
					<input type="radio" name="prodgender" id="prodgender" value="1" checked> 남성
					<input type="radio" name="prodgender" id="prodgender" value="2"> 여성
	
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">설문정보1</label>
				<select class="form-select required" name="prodans1" id="prodans1" onchange="prodansList(this.value);">
				  <option value="" selected>설문정보1 선택</option>
				  <option value="flower">꽃</option>
				  <option value="fruit">과일</option>
				  <option value="wood">나무</option>
				</select>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 required">설문정보2</label>
				<select class="form-select" name="prodans2" id="prodans2">
					<option value="" selected>설문정보2 선택</option>
					<option value="">-------꽃-------</option>
					<option value="lilac">라일락</option>
					<option value="citrus">시트러스</option>
					<option value="lavender">라벤더</option>
					<option value="rose">장미</option>
					<option value="">-------과일-------</option>
					<option value="peach">복숭아</option>
					<option value="cherry">체리</option>
					<option value="strawberry">딸기</option>
					<option value="lemon">레몬</option>
					<option value="">-------나무-------</option>
					<option value="sandal">샌달우드</option>
					<option value="pyeonbaeg">편백나무</option>
					<option value="sonamu">소나무</option>
					<option value="void">보이드우드</option>
				</select>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">상품 이미지</label>
				<div>
					<input type="file" name="f1" id="image" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">상품 상세페이지</label>
				<div>
					<input type="file" name="f2" id="detail" class="form-control" >
				</div>
			</div>
				
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-primary">등록</button>
				</div>
			</div>
			
	</div>
</form>	

<script>
	<!-- 빈칸 체크 -->
	function blankchk() {
		if(document.getElementById( 'name' ).value.trim() == "") {
			alert("상품 이름은 필수 입력 값입니다.")
		  	return false;
		}
		if(document.getElementById( 'price' ).value.trim() == "") {
			alert("상품 가격은 필수 입력 값입니다.")
		  	return false;
		}
		if(document.getElementById( 'stock' ).value.trim() == "") {
			alert("재고는 필수 입력 값입니다.")
		  	return false;
		}
		if(document.getElementById( 'prodans1' ).value.trim() == "") {
			alert("설문정보1은 필수 입력 값입니다.")
		  	return false;
		}
		if(document.getElementById( 'prodans2' ).value.trim() == "") {
			alert("설문정보2는 필수 입력 값입니다.")
		  	return false;
		}
		if(document.getElementById( 'image' ).value.trim() == "") {
			alert("상품 이미지는 필수 입력 값입니다.")
		  	return false;
		}
		if(document.getElementById( 'detail' ).value.trim() == "") {
			alert("상품 상세정보 이미지는 필수 입력 값입니다.")
		  	return false;
		} else return true;
	}
	
	function prodansList(prodans1) {
		let f = document.getElementById( 'productForm' );
		let opt = $("prodans2 option").length;
		
		if (prodans1 == "") {
			num = new Array("설문정보2");
			vnum = new Array("");
		} else if (prodans1 == "flower") {
			num = new Array("라일락", "시트러스", "라벤더", "장미");
			vnum = new Array("lilac", "citrus", "lavender", "rose");
		} else if (prodans1 == "fruit") {
			num = new Array("복숭아", "체리", "딸기", "레몬");
			vnum = new Array("peach", "cherry", "strawberry", "lemon");
		} else if (prodans1 == "wood") {
			num = new Array("샌달우드", "편백나무", "소나무", "보이드우드");
			vnum = new Array("sandal", "pyeonbaeg", "sonamu", "void");
		}
		
		for (let i = 0; i < num.length; i++) {
			f.prodans2.options[0] = null;
		}
		
		for (k = 0; k < num.length; k++) {
			f.prodans2.options[k] = new Option(num[k], vnum[k])
		}
	}
	
</script>
</body>
</html>