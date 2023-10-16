<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 관리 페이지</title>
<style>
li {
	list-style-type:none;
}
</style>
</head>

<body>


		<!-- 제품 이미지 -->
		
 <div class="product text-center  flex-wrap:wrap" style="width:81%; margin:auto;">
 
     <div class="text-lg-end text-center container d-flex justify-content-center">
		<a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/product/productForm" >상품 등록</a>
		</div>		   
		
		
		<!-- 제품 카테고리 -->
		<div class="array mt-5 mb-3 text-center subdivision">
		<p>
		<c:if test="${prodans1 eq 'all'}">
			<a   class="btn btn-dark" href="${pageContext.request.contextPath}/product/productManagement?prodans1=all&order=prodnum">전체상품</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			</c:if>
			<c:if test="${prodans1 ne 'all'}">
			<a  class="btn btn-outline-dark" href="${pageContext.request.contextPath}/product/productManagement?prodans1=all&order=prodnum">전체상품</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			</c:if>
			
			<c:if test="${prodans1 eq 'wood'}">
			<a  class="btn btn-dark"  href="${pageContext.request.contextPath}/product/productManagement?prodans1=wood&order=prodnum">우디</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			</c:if>
			<c:if test="${prodans1 ne 'wood'}">
			<a  class="btn btn-outline-dark" href="${pageContext.request.contextPath}/product/productManagement?prodans1=wood&order=prodnum">우디</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			</c:if>
			
			<c:if test="${prodans1 eq 'flower'}">
			<a class="btn btn-dark"  href="${pageContext.request.contextPath}/product/productManagement?prodans1=flower&order=prodnum">플로럴</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			</c:if>
			<c:if test="${prodans1 ne 'flower'}">
			<a  class="btn btn-outline-dark" href="${pageContext.request.contextPath}/product/productManagement?prodans1=flower&order=prodnum">플로럴</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			</c:if>
			
			<c:if test="${prodans1 eq 'fruit'}">
			<a class="btn btn-dark"  href="${pageContext.request.contextPath}/product/productManagement?prodans1=fruit&order=prodnum">프루티</a>
			</c:if> 
			<c:if test="${prodans1 ne 'fruit'}">
			<a  class="btn btn-outline-dark" href="${pageContext.request.contextPath}/product/productManagement?prodans1=fruit&order=prodnum">프루티</a>
			</c:if> 
			
			 
		</p>
	</div>   
       <input type="hidden"   name="prodans1"   value="${prodans1}"/>      
 	<c:forEach var="p" items="${ma}">
             <!-- C: 반복문 사용 !! -->
 <!--나누기-->
 <ul class="d-inline-flex flex-sm-column m-auto p-5">
 <li class="mt-3">
 	<div class="col-lg-3 com-md-6" style="border-radius: 5px;">
    <div class="card" style="width: 18rem;">
    	<a href="${pageContext.request.contextPath}/product/productDetail?prodnum=${p.prodnum}">
        <img src="${pageContext.request.contextPath}/view/product/images/${p.image}"  class="card-img-top" alt="..." width="200px" height="200px"></a>
        <div class="card-body">
          <h5 class="card-title" style="text-align: center;color: black;">
          <a href="${pageContext.request.contextPath}/product/productDetail?prodnum=${p.prodnum}" style="text-decoration: none; color: black">${p.name}</a>
          </h5>
         
          
            			<!-- 상품 편집 -->
                                  
                                 
                                    
                        <a href="${pageContext.request.contextPath}/product/productUpdateForm?prodnum=${p.prodnum}">          
                        <button class="btn btn-outline-dark" type="button" onclick="" style="float: center;" >
                        수정
                        </button> <!-- 상품 수정탭으로 이동 -->
                        
                        </a>
                        
                        <a href="${pageContext.request.contextPath}/product/productDeleteForm?prodnum=${p.prodnum}">          
                        <button class="btn btn-outline-danger" type="button" onclick="" style="float: center;" >
                        삭제
                        </button><!-- 상품 삭제탭으로 이동 -->
                        
                        </a>
                                                  
                                    
                                   
                                    <!-- 편집기능끝 -->
                                    <hr/>
                                    
                                    <!-- 상품태그 -->
          <p class="card-text" style="text-align: center;">
            <span class="badge bg-dark">
   			
            <c:if test="${p.prodgender eq 1}">  male </c:if>
            <c:if test="${p.prodgender eq 2}">  female </c:if>
            </span>  
            <span class="badge bg-dark">${p.prodans1}</span>
            <span class="badge bg-dark">${p.prodans2}</span>
          </p>
          <div style="text-align: center;">
   
              </div>
            <div class="text-dark" style="text-align: center;">&nbsp;<strong><fmt:formatNumber value='${p.price}' pattern="#,### 원" /></strong></div>
          </div>
          
        </div>
      </div>       
      </li>
      </ul>     
       </c:forEach>  
       <!-- 상품 페이지 표시 -->
	<br>
	<div class="text-center">
		<!-- 이전 버튼 -->
		<c:if test="${start < bottomLine}">
			<a href="#" class="btn btn-sm btn-outline-danger disabled">이전</a>
		</c:if>
		<c:if test="${start > bottomLine}">
			<a
				href="${pageContext.request.contextPath}/product/productManagement?pageNum=${start-bottomLine}&prodans1=${prodans1}&order=prodnum"
				class="btn btn-sm btn-outline-primary">이전</a>
		</c:if>

		<!-- 현재 페이지 표시 -->
		<c:forEach var="p" begin="${start}" end="${end}">
			<a
				href="${pageContext.request.contextPath}/product/productManagement?pageNum=${p}&prodans1=${prodans1}&order=prodnum"
				class="btn <c:if test="${pageInt==p}"> btn-sm btn-outline-secondary </c:if> ml-3 mr-3">${p}</a>
		</c:forEach>

		<!-- 다음 버튼 -->
		<c:if test="${end >= maxPage}">
			<a href="#" class="btn btn-sm btn-outline-danger disabled">다음</a>
		</c:if>
		<c:if test="${end <  maxPage}">
			<a
				href="${pageContext.request.contextPath}/product/productManagement?pageNum=${start+bottomLine}&prodans1=${prodans1}&order=prodnum"
				class="btn btn-sm btn-outline-primary">다음</a>
		</c:if>
	</div>   
</div>

</body>
</html>