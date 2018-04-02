<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="table table-hover">
	<tr>
		<th>프로그램 번호</th><th>프로그램 이름</th>
	</tr>
	<c:forEach items="${requestScope.list}" var="list">
	<tr>
		<td><a href="${pageContext.request.contextPath}/DispatcherServlet?command=programDetail&programNo=${list.programNo}">${list.programNo}</a></td>
		<td>${list.programName }</td>
	</tr>
	</c:forEach>
</table>