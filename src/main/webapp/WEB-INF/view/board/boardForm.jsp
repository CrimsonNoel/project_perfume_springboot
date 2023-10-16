<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>

</head>
<body>
	<div class="container">
		<form method="post" action="${pageContext.request.contextPath}/board/boardPro"
		enctype="multipart/form-data" onsubmit="return blankchk();">
			<div class="mt-3 mb-3">
				<!-- 게시글 종류 선택 -->
				<select class="form-select" aria-label="게시글 종류 선택" name="boardid" id="boardid">
				  <option selected>게시글 종류 선택</option>
				  <option value="1">공지사항</option>
				  <option value="2">이벤트</option>
				</select>
			</div>
			<div class="mb-3">			
				<p>
					작성자: ${member.name}
				</p>
			</div>
			<div class="mb-3">
				<label for="subject">제목</label>
				<input type="text" class="form-control" name="subject" id="boardSubject">
			</div>
			<div class="mb-3">
				<label for="content">내용</label>
				<textarea class="form-control" rows="15" name="content" id="boardContent"></textarea>
			</div>
			<div class="mb-3">
				<label for="image">사진 첨부</label>
				<input class="form-control" type="file" name="f" id="boardImage">
			</div>
			
			<div class="text-center">
			<button type="submit" class="btn btn-outline-dark" id="subBtn">
				<i class="fa-solid fa-pencil"></i> 등록
			</button>
			
			<button type="button" class="btn btn-outline-danger"
			onclick="location.href='${pageContext.request.contextPath}/board/boardList'">
				취소
			</button>
			</div>
		</form>
	</div>
	
	<script>
      function blankchk() {
    	if(document.getElementById( 'boardid' ).value != 1 && document.getElementById( 'boardid' ).value != 2 ) {
        	alert("게시글 종류를 선택해주세요.")
          	return false;
        }
    	  
    	if(document.getElementById( 'boardSubject' ).value.trim() == "") {
        	alert("제목을 입력해주세요.")
        	return false;
        }
        else if(document.getElementById( 'boardContent' ).value.trim() == "") {
        	alert("내용을 입력해주세요.")
        	return false;
        }
        else return true;
      }
    </script>
	
</body>
</html>