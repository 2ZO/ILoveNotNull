<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
	th,td{
		border:1px solid #000;
		text-align: center;
	}
	/*테이블 디자인 다 똑같이 넣어요..*/
</style>
<script>
function getDetailPost(){
	alert("ge");
	location.href="${pageContext.request.contextPath}/DispatcherServlet?command=getDetailPost&postNo=${post.postNo}";
}
</script>
<table class="table table-bordered  table-hover boardlist">
  <thead>
  	<tr>
    	<th>번호</th>
    	<th>제목</th>
    	<th>작성자</th>
    	<th>작성일</th>
    </tr>
  </thead>
  <tbody>
  	<c:forEach items="${requestScope.lvo.list}" var="post">
  		<tr onclick="getDetailPost()">
  			<td>${post.postNo}</td>
  			<td>${post.title}</td>
  			<td>${post.id}</td>
  			<td>${post.regDate}</td>
  		</tr>
  	</c:forEach>	
  </tbody>
</table>
<ul>
	<c:forEach var="paging" begin="${requestScope.lvo.pagingBean.endPageOfPageGroup}" end="${requestScope.lvo.pagingBean.startPageOfPageGroup}"> 
		<c:choose>
			<c:when test="${paging==requestScope.lvo.pagingBean.nowPage}">
				<li>${paging}</li>
			</c:when>
			<c:otherwise>
			<li><a href="DispatcherServlet?command=list&nowPage=${paging}">${paging}</a></li>
			</c:otherwise>
		</c:choose> 	
	</c:forEach>
 </ul>
