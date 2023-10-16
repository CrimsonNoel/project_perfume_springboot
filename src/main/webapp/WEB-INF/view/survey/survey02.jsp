<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
    <meta charset="UTF-8">
    <title>설문 페이지</title>
        <style>
            .boxbox{
              width: 85%;
              margin: 10px auto;
              background-color: #fff;
              border-radius: 20px;   
              box-shadow: 8px 8px 2px 1px rgba(0, 0, 0, 0.3);         
            }
            body{
                width: 100%;
                height: 100%;
            }
          
            .nav {
                  text-align: center;
            }
            .nav a {
                    text-decoration: none;
                    color: black;
            }
            .h1{
                background-color: rgba(230,230,230,0.4);
                margin:auto;
                border-radius: 20px;
                padding: 25px;
            }
        </style>
       <script>
   		var totalChecked = 0; 
   		function CountChecked(field) {
       		if (field.checked) {
          	 totalChecked += 1; 
   			}else {
           totalChecked -= 1;
           } 
   		}
   		
        function pre(page){
	    	//alert(page)
	    	document.RadioPost.page.value=page;
	    	document.RadioPost.submit()
        }
    
    	function next(page) {
	    	//alert(page)
	    	
	    	//alert(document.RadioPost.page.value)
	    	let ck = document.RadioPost.ck0.value
	    	
	    	document.RadioPost.page.value=page+ck;
	    	
	    	document.RadioPost.ck2favorite.value=ck;

	    	if(totalChecked===0){
	    		alert('반드시 하나 이상 선택해주세요')
	    		page = survey02;
	    	}
	    	
	    	//alert(ck)
	    	document.RadioPost.submit()
   			}
    	</script>
    </head>
    
    <body style="background-image: url('${pageContext.request.contextPath}/images/surveyback/svback02.jpg'); 
    			background-size: cover;">
        <nav>
             <!--닫기 버튼 ,사이즈 조절가능 -->
            <button onClick="location.href='${pageContext.request.contextPath}/home/index'" type="button"  
            class="me-5 mt-3 btn btn-outline-dark  position-absolute top-0 end-0 translate-middle-x" 
            style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: 1 rem;">
            닫기 
        </button>
    </nav>
    <div class="boxbox col col-xl-11">
    <div class="container-fluid  text-center" style="margin-top:5%;"  >
    <div class="col col-xl-12 m-auto">
      <div class="row m-0 justyfy-center">
        <div class="header row m-0 p-3">
          <!-- 설문 헤더 -->
          <div class="h1 m-0 p-5 fw-bold">나에게 맞는 향수 찾기</div>
        </div>
        <div class="row m-0">
          <!-- 설문 문항 -->
          <h3 class="m-0 p-5 fw-bold">좋아하는 분류를 선택해주세요</h3>
        </div>
        <div class="row m-0">
          <div class="m-0 p-5">
          <form method="post"   name="RadioPost"
               			action="${pageContext.request.contextPath }/survey/RadioCheckedPro">
               	<input type="hidden" name="page" value="">
             	<input type="hidden" name="ck1gender" value="${ck1gender}">
				<input type="hidden" name="ck2favorite" value="${ck2favorite}">
				<input type="hidden" name="ck3fruit" value="${ck3fruit}">
				<input type="hidden" name="ck3flower" value="${ck3flower}">
				<input type="hidden" name="ck3wood" value="${ck3wood}">
            <!-- 라디오박스 -->
            <div class="check p-3 m-1" style="text-align: center;" >
              <input
                onclick="CountChecked(this)"
                class="btn-check form-check-input"
                type="radio"
                name="ck0"
                id="Radio1"
                value="fruit"
		        />
              <label class="btn btn-outline-danger form-check-label fs-4 fw-bold" for="Radio1"  
                    style="width: 80%; padding: 10px;">
                &nbsp;과일
              </label>
            </div>
            <div class="check p-3 m-1" style="text-align: center;" >
              <input
              onclick="CountChecked(this)"
              class="btn-check form-check-input"
                type="radio"
                name="ck0"
                id="Radio2"
                value="flower"
              />
              <label class="btn btn-outline-success form-check-label fs-4 fw-bold" for="Radio2" 
                      style="width: 80%; padding: 10px;">
                &nbsp;꽃
              </label>
            </div>
            <div class="check p-3 m-1" style="text-align: center;" >
              <input
                onclick="CountChecked(this)"
                class="btn-check form-check-input"
                type="radio"
                name="ck0"
                id="Radio3"
                value="wood"
              />
              <label class="btn btn-outline-secondary form-check-label fs-4 fw-bold" for="Radio3" 
                      style="width: 80%; padding: 10px;">
                &nbsp;나무
              </label>
            </div>
            </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- 이전,다음버튼 -->
  <div class="text-center">
    <div
      class="btn-group" style="margin-top: 4%; margin-bottom:2%; width: 450px;"
    >
   		<a 
          href="#" onclick="pre('survey01')" 
          class="btn btn-outline-dark fs-5"
          >이전</a
          >
        <a
          href="#" onclick="next('survey03')"
          class="btn btn-dark fs-5"
          >다음</a
        >
    </div>
   </div>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>  
    </body>
</html>