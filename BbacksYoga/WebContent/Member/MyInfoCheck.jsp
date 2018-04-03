<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${sessionScope.memberVO.id==null}">
	<script>
		alert("로그인해주세요");
		location.href="index.jsp";
	</script>
</c:if>
<div class="container">
	<div class="col-md-12 contents">
<form action="DispatcherServlet" method="post"> <!-- 단순한 정보체크지만 패스워드를 넣기 때문에 post처리 -->
<input type="hidden" name="command" value="passwordCheck">
패스워드를 입력하세요 <input type="password" name="memberPassword" required="required">
<input type="submit" value="비밀번호 확인">
</form>
</div>
</div>