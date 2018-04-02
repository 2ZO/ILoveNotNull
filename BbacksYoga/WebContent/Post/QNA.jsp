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
<table>
  <thead>
  	<tr>
    	<th>번호</th>
    	<th>제목</th>
    	<th>작성자</th>
    	<th>작성일</th>
    </tr>
  </thead>
  <tbody>
  	<c:forEach items="${requestScope.list}" var="post">
  		<tr>
  			<td>${post.postNo}</td>
  			<td>${post.title}</td>
  			<td>${post.id}</td>
  			<td>${post.regDate}</td>
  		</tr>
  	</c:forEach>	
  </tbody>
</table>
