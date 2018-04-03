
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form method="post" action="${pageContext.request.contextPath}/DispatcherServlet?command=addTeacher" enctype="multipart/form-data">
<!-- <input type="hidden" name="command" value="addTeacher"> -->
선생님 이름 입력<input type="text" name="teacherName" required="required" > <br>
선생님 닉네임 입력<input type="text" name="teacherNick" required="required" ><br>
선생님 프로필 입력<textarea name="teacherProfile" rows="20" cols="40" placeholder="선생님 프로필을 입력하세요"></textarea><br>
<!-- 이미지 이름<input type="text" name="teacherImgURL"> -->
선생님 이미지 파일<input type="file" name="teacherFile">
<input type="submit" value="강사등록">
</form>