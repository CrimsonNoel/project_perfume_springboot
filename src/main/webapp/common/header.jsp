<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/* 마우스 오버 시 드롭다운 메뉴 보이게 */
	.dropdown:hover .dropdown-menu {
		display: block;
		margin-top: 0;
	}
</style>
</head>
<body>
	 <nav class="navbar navbar-expand-lg navbar-light shadow">
        <div class="container d-flex justify-content-center align-items-center">
            <a class="navbar-brand text-success logo h1 align-self-center" href="${pageContext.request.contextPath}/home/index">
                <img alt="메인로고" src="${pageContext.request.contextPath}/images/index/logo.png" width="150px">
            </a>
            <button class="navbar-toggler border-0" type="button" 
            data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" 
            aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
                <div class="flex-fill">
                    <ul class="nav navbar-nav d-flex justify-content-evenly mx-lg-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/home/about">ABOUT</a>
                        </li>
                        <li class="nav-item dropdown">
          					<button class="nav-link dropdown-toggle"  role="button" data-bs-toggle="dropdown" aria-expanded="false">
           					SHOP
          					</button>
          				
          					<ul class="dropdown-menu">
          					<li><a class="dropdown-item" 
            					href="${pageContext.request.contextPath}/product/shop">전체 상품</a></li>
            					<li><a class="dropdown-item" 
            					href="${pageContext.request.contextPath}/product/shop?prodans1=wood">우디</a></li>
            					<li><a class="dropdown-item" 
            					href="${pageContext.request.contextPath}/product/shop?prodans1=flower">플로럴</a></li>
            					<li><a class="dropdown-item" 
            					href="${pageContext.request.contextPath}/product/shop?prodans1=fruit">프루티</a></li>
          					</ul>
        				</li>
                        <li class="nav-item dropdown">
          					<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
           					NOTICE
          					</a>
          					<ul class="dropdown-menu">
            					<li><a class="dropdown-item" 
            					href="${pageContext.request.contextPath}/board/boardList?boardid=1">공지사항</a></li>
            					<li><a class="dropdown-item" 
            					href="${pageContext.request.contextPath}/board/boardList?boardid=2">이벤트</a></li>
          					</ul>
        				</li>
        				<!-- 세션 id가 admin이면 MANAGEMENT를, 그 외에는 CART 페이지를 보여줌 -->
        				<c:choose>
        				<c:when test="${id != null && id.equals('admin')}">
        				<li class="nav-item dropdown">
          					<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
           					MANAGEMENT
          					</a>
          					<ul class="dropdown-menu">
            					<li><a class="dropdown-item" 
            					href="${pageContext.request.contextPath}/member/memberList">회원관리</a></li>
            					<li><a class="dropdown-item" 
            					href="${pageContext.request.contextPath}/product/productManagement?prodans1=all&order=prodnum">상품관리</a></li>
            					<li><a class="dropdown-item" 
            					href="${pageContext.request.contextPath}/order/orderManagement">주문관리</a></li>
            					<li><a class="dropdown-item" 
            					href="${pageContext.request.contextPath}/board/commentManagement?pageNum=1">전체댓글관리</a></li>
          					</ul>
        				</li>
                        </c:when>
                        <c:otherwise>
        				<li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/cart/cartList">CART</a>
                        </li>
                        </c:otherwise>
                        </c:choose>
                    </ul>
                </div>
                <div class="navbar align-self-center d-flex">
                	<div class="m-5">
                	<c:if test="${id==null}">
                    <!-- 회원가입, 비 로그인 상태에서 보이게 -->
                    <a class="nav-icon d-none d-lg-inline m-1" href="${pageContext.request.contextPath}/member/joinForm" 
                    data-toggle="tooltip" title="회원가입">
                        <i class="fa-solid fa-user-plus" style="color: #000000;"></i>
                    </a>
                    <!-- 로그인, 비 로그인 상태에서 보이게 -->
                      <a class="nav-icon d-none d-lg-inline m-1" href="${pageContext.request.contextPath}/member/loginForm"
                    data-toggle="tooltip" title="로그인">
                        <i class="fas fa-sign-in-alt" style="color: #000000;"></i>
                    </a>
                    </c:if>
                   
                    <c:if test="${id != null}">
                    <p class="text-sm"><%=session.getAttribute("id")%>님</p> <!-- 현재 로그인 된 id -->
               	    <div class="text-center">
                    <!-- 회원정보, 로그인 시에 회원가입 대신 보이게-->
                    <a class="nav-icon d-none d-lg-inline m-1" href="${pageContext.request.contextPath}/member/memberInfo"
                    data-toggle="tooltip" title="마이페이지">
                        <i class="fa-solid fa-user" style="color: #000000;"></i>
                    </a>

                    <!-- 로그아웃, 로그인 상태에서 보이게-->
                    <a class="nav-icon d-none d-lg-inline m-1" href="${pageContext.request.contextPath}/member/logout"
                    data-toggle="tooltip" title="로그아웃">
                        <i class="fas fa-sign-out" style="color: #000000;"></i>
                    </a>
                    </div>
                   	</c:if>
					</div>
				</div>
			</div>
		</div>
    </nav>
</body>
</html>