<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//파일업로드는 form을 직렬화해서 보낼수 없음
	//다 일일이 불러서 타입별로 포장해줘야됨
	$("#addTeacherBtn").click(function(){
		var formData = new FormData(); 
		formData.append("teacherName", $("input[name=teacherName]").val()); 
		formData.append("teacherNick", $("input[name=teacherNick]").val()); 
		formData.append("teacherFile", $("input[name=teacherFile]")[0].files[0]);
		formData.append("teacherProfile", $("textarea[name=teacherProfile]").val());
		
		/* formData.append("command", "addTeacher");	 */
			$.ajax({
			data: formData, 
			processData: false, 
			contentType: false,
			type:"post",
			dataType:"json",   
			url:"${pageContext.request.contextPath}/DispatcherServlet?command=addTeacher",
			/* data:$("#addTeacherForm").serialize(), */
			success:function(data){
				if(data.flag=="false"){
					alert("뭔가 에러")
				}else{
					alert(data.teacherName+"추가완료!\n리스트를 확인해주세요");
						$("#table_body tr:last").after("<tr><td>"+data.teacherName+"</td>"+
								"<td>"+data.teacherNick+"</td>"+
								"<td>"+data.teacherProfile+"</td>");
					}
				}
				//$("#membody").html(info);
			});//success
		});//ajax
	});
	</script>
<form method="post" action="${pageContext.request.contextPath}/DispatcherServlet?command=addTeacher" enctype="multipart/form-data" id="addTeacherForm">
<input type="hidden" name="command" value="addTeacher">
선생님 이름 입력<input type="text" name="teacherName" required="required" >&nbsp;&nbsp;
선생님 닉네임 입력<input type="text" name="teacherNick" required="required" ><br>
선생님 이미지 파일<input type="file" name="teacherFile"><br>
선생님 프로필 입력<br><textarea name="teacherProfile" rows="20" cols="40" placeholder="선생님 프로필을 입력하세요"></textarea><br>
<!-- 이미지 이름<input type="text" name="teacherImgURL"> -->
<input type="button" id="addTeacherBtn" value="강사등록">
</form>

<div class="container">
<form>
	<table id="table" class="table table-hover">
		<thead id="table_head">
			<tr>
				<th>TeacherName</th>
				<th>TeacherNickName</th>
				<th>Profile</th>
			</tr>
		</thead>
		<tbody id="table_body">
		<c:forEach items="${teacherList}" var="list" >
		<!-- 원래 있던 리스트 -->
		<tr>
		<td>${list.teacherName}</td>
		<td>${list.teacherNick}</td>
		<td>${list.teacherProfile}</td>
		</tr>
		</c:forEach>
			<!-- 데이터 AJAX에서 추가해서 보여준다 -->
		</tbody>
	</table>
</form>
</div>