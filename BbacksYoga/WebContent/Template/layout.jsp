<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!Doctype html>
<html>
<head>
<meta charset="utf-8">

<!--  내부 CSS -->
<link rel="stylesheet" 	href="${pageContext.request.contextPath}/CSS/nav.css">
<link rel="stylesheet"	href="${pageContext.request.contextPath}/CSS/layout.css">
<link rel="stylesheet"	href="${pageContext.request.contextPath}/CSS/TeacherList.css"><!-- 선생님 리스트 css추가 -->
<link rel="stylesheet" 	href="${pageContext.request.contextPath}/CSS/postWrite.css"><!-- 게시글 관련 css 추가 -->

<!-- 부트스트랩용 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>BbacksYoga</title>
</head>

<body>
	<!-- header -->
	
	<header>
		<c:import url="header.jsp"></c:import>
	</header>
	
	<!-- 메인 -->
	<main role="main" class="container">
	<c:if test="${empty url}">
		<c:import url="/Member/Idcheck.jsp"></c:import>
	</c:if>
	<c:if test="${!empty url}">
		<c:import url="${url}"></c:import>
	</c:if>
	</main>
	
	<!-- footer -->
	<footer class="footer">
		<div class="container">
			<c:import url="footer.jsp"></c:import>
		</div>
	</footer>
</body>
</html>