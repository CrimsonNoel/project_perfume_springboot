<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <title>로그인</title>
<br><br><br>
<div class="container mt-3">

  <h2  align="center">로그인</h2>
</div><br>
<div class="container mt-3">
<form   action="${pageContext.request.contextPath}/member/loginPro"   method="post">
  <p>
  <label>아이디</label>
  <input class="form-control" type="text"  name="id"> </p>
  <p><br>
  <label>비밀번호</label>
  <input class="form-control" type="password"  name="pass"></p>
  <p>
 <br><br>
  <input class="form-control" type="submit"  value="확인"></p>
</form>
</div>
</body>
</html> 