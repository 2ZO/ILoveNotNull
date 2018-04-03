<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- <style type="text/css">
	th,td{
		border:1px solid #000;
		text-align: center;
	}
	/*테이블 디자인 다 똑같이 넣어요..*/
</style> -->
<script>
function getDetailPost(postNo){
	location.href="${pageContext.request.contextPath}/DispatcherServlet?command=getDetailPost&postNo="+postNo;
}
function createPost() {
	location.href="${pageContext.request.contextPath}/DispatcherServlet?command=writePostView";
}
</script>
<input type="button" value="글쓰기" onclick="return createPost()">
<table class="table table-bordered  table-hover boardlist">
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

