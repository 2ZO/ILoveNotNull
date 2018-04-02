<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form action="${pageContext.request.contextPath}/DispatcherServlet">
요가 프로그램: <input type="text" name="programName" required="required"><br>
프로그램 소개<br><br>
<textarea rows="20" cols="50" name="programDetail" required="required"></textarea> <br>
<input type="hidden" name="command" value="createProgram" > <br>
<input type="submit" value="추가하기">
</form>