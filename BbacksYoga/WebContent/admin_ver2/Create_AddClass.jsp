<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form method="post" action="${pageContext.request.contextPath}/DispatcherServlet">
<input type="hidden" name="command" value="addclass">


<!-- 선생님 선택 -->
<!-- 선생님은 선생님 table에서 값을 불러옴  -->
<select name="day">
	<option value="none" >선생님을 선택하세요</option>
<c:forEach items="${requestScope.teacherList}" var="list">
	<option value="${list.teacherId}" >${list.teacherName}&lt;${list.teacherNick}&gt;</option>
	<%-- ${list.TeacherVO.teacherId} --%>
</c:forEach>
</select>


<!-- 요일 선택 -->
<select name="day">
  <option value="0" selected="selected">월</option>
  <option value="1">화</option>
  <option value="2">수</option>
  <option value="3">목</option>
  <option value="4">금</option>
  <option value="5">토</option>
</select>

<!-- 교시 선택 -->
<select name="time">
  <option value="0" selected="selected">1교시</option>
  <option value="1">2교시</option>
  <option value="2">3교시</option>
  <option value="3">4교시</option>
  <option value="4">5교시</option>
  <option value="5">6교시</option>
  <option value="4">7교시</option>
  <option value="5">8교시</option>
</select>
&nbsp;
정원 입력<input type="number" name="capacity"> 
</form>