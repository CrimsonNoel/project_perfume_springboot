<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글 수정</title>
</head>
<body>
	<div class="container">
		<form method="post" action="${pageContext.request.contextPath}/board/boardUpdatePro"
		enctype="multipart/form-data" onsubmit="return blankchk();">
			<input type="hidden" name="num" value="${board.num}"> <!-- 글 번호 hidden으로 입력받기 -->
			<input type="hidden" name="image" value="${board.image}"> <!-- 게시글 사진 hidden으로 입력받기 -->

			<div class="mt-3 mb-3">
				<h3 class="text-center mb-3">게시글 수정</h3>
				<select class="form-select" aria-label="게시글 종류 선택" name="boardid" id="boardid">
				  <option value="">게시글 종류 선택</option>
				  <option value="1" <c:if test="${boardid == 1}">selected</c:if>>공지사항</option>
				  <option value="2" <c:if test="${boardid == 2}">selected</c:if>>이벤트</option>
				</select>
			</div>
			<div class="mb-3">
				<label for="subject">제목</label>
				<input type="text" class="form-control" name="subject" value="${board.subject}" id="boardSubject">
			</div>
			<div class="mb-3">
				<label for="content">내용</label>
				<textarea class="form-control" rows="15" name="content" id="boardContent">${board.content}</textarea>
			</div>
			<div class="mb-3">
				<label for="image">첨부사진 [${board.image}]</label>
				<input class="form-control" type="file" name="f">
			</div>
			
			<button type="submit" class="btn btn-outline-primary">
				<i class="fa-solid fa-pencil"></i> 수정
			</button>
			
			<button type="button" class="btn btn-outline-secondary"
			onclick="location.href='${pageContext.request.contextPath}/board/boardComment?num=${board.getNum()}'">
				돌아가기
			</button>
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