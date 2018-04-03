<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    background-color: #4CAF50;
    color: white;
}
	h3{
		text-align: center;
	}
</style>
<script type="text/javascript">
function getDetailPost(postNo){
	location.href="${pageContext.request.contextPath}/DispatcherServlet?command=getDetailPost&postNo="+postNo;
}
function createPost() {
	location.href="${pageContext.request.contextPath}/DispatcherServlet?command=writePostView";
}
</script>
<input type="button" value="글쓰기" onclick="return createPost()">
<h3>Q&amp;A</h3>
<table>
  <thead>
  	<tr class="success">
    	<th>번호</th>
    	<th>제목</th>
    	<th>작성자</th>
    	<th>작성일</th>
    </tr>
  </thead>
  <tbody>
  	<c:forEach items="${requestScope.lvo.list}" var="post">
  		<tr onclick="getDetailPost(${post.postNo})">
  			<td>${post.postNo}</td>
  			<td>${post.title}</td>
  			<td>${post.id}</td>
  			<td>${post.regDate}</td>
  		</tr>
  	</c:forEach>	
  </tbody>
</table>
<br><br>
<div class="pagingInfo">
	<c:set var="pb" value="${requestScope.lvo.pagingBean}"></c:set>
	<ul class="pagination">
	<c:if test="${pb.previousPageGroup}">
		<li><a href="DispatcherServlet?command=postList&nowPage=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
	</c:if>
	<c:forEach var="paging" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}"> 
		<c:choose>
			<c:when test="${pb.nowPage!=paging}">
				<li><a href="DispatcherServlet?command=postList&nowPage=${paging}">${paging}</a></li>
			</c:when>
			<c:otherwise>
				<li class="active"><a href="#">${paging}</a></li>
			</c:otherwise>
		</c:choose> 
	&nbsp;
	</c:forEach>
	<c:if test="${pb.nextPageGroup}">
		<li><a href="DispatcherServlet?command=postList&nowPage=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
	</c:if>
 </ul>
</div>

