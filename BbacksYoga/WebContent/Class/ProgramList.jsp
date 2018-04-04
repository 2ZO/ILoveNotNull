<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- table css 추가 / QNA.jsp와 동일 css 적용 -->
<style type="text/css">
	table {
    border-collapse: collapse;
    width: 60%;
	margin: 40px auto 0;
}

	th, td {
    text-align: left;
    padding: 8px;
}

	tr:nth-child(even){background-color: #f2f2f2}

	th {
    background-color: #7c8864;
    color: white;
}
</style>
<table >
	<tr>
		<th>프로그램 번호</th><th>프로그램 이름</th>
	</tr>
	<c:forEach items="${requestScope.lvo.list}" var="plist">
	<tr>
		<td><a href="${pageContext.request.contextPath}/DispatcherServlet?command=programDetail&programNo=${plist.programNo}">${plist.programNo}</a></td>
		<td>${plist.programName }</td>
	</tr>
	</c:forEach>
</table>

<div class="pagingInfo">
	<c:set var="pb" value="${requestScope.lvo.pagingBean}"></c:set>
	<ul class="pagination">
	
	<c:if test="${pb.previousPageGroup}">	
		<li><a href="DispatcherServlet?command=programList&pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
	</c:if>
	<c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
	
	<c:choose>
	<c:when test="${pb.nowPage!=i}">
		<li><a href="DispatcherServlet?command=programList&pageNo=${i}">${i}</a></li> 
	</c:when>
	<c:otherwise>
		<li class="active"><a href="#" >${i}</a></li>
	</c:otherwise>
	</c:choose>
	
		&nbsp;
	</c:forEach>
	<c:if test="${pb.nextPageGroup}">	
		<li><a href="DispatcherServlet?command=programList&pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
	</c:if>
	</ul>
</div> 	
