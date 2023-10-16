<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
</head>
<body>

<div class=container>
<form action="${pageContext.request.contextPath}/board/checkCommentDelete"
			 		name="del" method="post" > 
<table class="table table-hover" >

	<thead>
		<tr class="table-dark" align="center"> 
		<th><input type="checkbox" id="chkAll" name="chkAll"/> 전체선택 </th>
		<th scope="col">작성내용</th>                  
		<th scope="col">작성날짜</th>
		<th scope="col"> 
		
		<!-- 코멘트 갯수 -->
		<div class="col-6 card-header bi bi-chat-dots">
    		총 댓글 갯수: <span><c:out value="${fn:length(coname)}" /></span>  
    		Comments
		</div>
		
		</th>
      	</tr>
	</thead>
	
<c:choose>
	<c:when test="${empty coname}"> 	<!-- 작성댓글 없음 -->
		<tbody>
	 	<tr><td colspan="12" class="text-center"><br>작성한 댓글이 없습니다</td></tr>   
		</tbody>
	</c:when>
	
	<c:otherwise>	
										<!-- 작성댓글 존재함 -->
	<c:forEach var="c" items="${coname}">
        
		<tbody>
	 	<tr align="center">
	 	<td><input type="checkbox" name="chk" value="${c.ser}"/></td>
		<td><a href="${pageContext.request.contextPath}/board/boardComment?num=${c.num}"
					style="color: black;">${c.content}</a></td>
		<td> <fmt:formatDate value="${c.regdate}" var="dateValue" pattern="yyyy-MM-dd HH:mm"/>${dateValue} </td>
		<td>
			
				<button type="submit" class="btn btn-sm btn-outline-danger"
				onclick="location.href='${pageContext.request.contextPath}/board/boardCommentDeleteForm?ser=${c.ser}'">삭제</button>  </td>
		</tr>
		</tbody>
	 
	</c:forEach>	 
	</c:otherwise>
</c:choose>
</table>

	<div class="text-center">
	<button type="button" class="btn btn-outline-secondary"
		onclick="location.href='${pageContext.request.contextPath}/board/boardList?PageNum=${pageInt}'">           
		게시글 목록                 
	</button>
	
	<button id="deleteChk" type="submit" class="btn btn-outline-danger">댓글 삭제</button>
	</div>

</form>
</div>


<script>
	$(document).ready(function() {
		$("#chkAll").click(function() {
			if ($("#chkAll").is(":checked"))
				$("input[name=chk]").prop("checked", true);
			else
				$("input[name=chk]").prop("checked", false);
		});
	});
</script>
</body>
</html>