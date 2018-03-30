<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/CSS/nav.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/footer.css">  
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<c:import url="header.jsp"></c:import>
<title>BbacksYoga</title>
<body>
<c:if test="${empty url}">
	<c:import url="${pageContext.servletContext.contextPath}/error.jsp"></c:import>
</c:if>
<c:if test="${!empty url}">
	<c:import url="${url}"></c:import>
</c:if>
<c:import url="footer.jsp"></c:import>
</body>
</html>