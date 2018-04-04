<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
/*클래스 입력, 받아오기 ajax로 처리하기~*/
$(document).ready(function(){
$("#addClass").click(function(){
		$.ajax({
		type:"post",
		dataType:"json",   
		url:"${pageContext.request.contextPath}/DispatcherServlet",
		data:$("#addClassForm").serialize(),
		success:function(data){
			if(data.flag=="false"){
				alert("뭔가 에러")
			}else{
				alert(data.programName+"추가완료!\n리스트를 확인해주세요");
					$("#table_body tr:last").after("<tr><td>"+data.programName+"</td>"+
							"<td>"+data.teacherName+"</td>"+
							"<td>"+data.classDay+"</td>"+
							"<td>"+data.classTime+"</td></tr>");
				/* 	$("#table_body").append("<td>"+data.teacherName+"</td>"); 
				    $("#table_body").append("<td>"+data.classTime+"</td>");
					$("#table_body").append("<td>"+data.classDay+"</td>"); */
					/* $("#table_body").append("</tr>");  */
				}
			}
			//$("#membody").html(info);
		});//success
	});//ajax
});
</script>
<form method="post" id="addClassForm"
	action="${pageContext.request.contextPath}/DispatcherServlet">
	<input type="hidden" name="command" value="addclass">
	<!-- 선생님 선택 -->
	<!-- 선생님은 선생님 table에서 값을 불러옴  -->
	<select name="teacherId">
		<option value="none">선생님을 선택하세요</option>
		<c:forEach items="${requestScope.teacherList}" var="list">
			<option value="${list.teacherId}">${list.teacherName}&lt;${list.teacherNick}&gt;</option>
		</c:forEach>
	</select> <select name="programId">
		<option value="none">프로그램을 선택하세요</option>
		<c:forEach items="${requestScope.programList}" var="list2">
			<option value="${list2.programNo}">${list2.programName}</option>
		</c:forEach>
	</select>


	<!-- 요일 선택 -->
	<select name="day">
		<option value="mon" selected="selected">월</option>
		<option value="tue">화</option>
		<option value="wed">수</option>
		<option value="thu">목</option>
		<option value="fri">금</option>
		<option value="sat">토</option>
	</select>

	<!-- 교시 선택 -->
	<select name="time">
		<option value="1" selected="selected">1교시</option>
		<option value="2">2교시</option>
		<option value="3">3교시</option>
		<option value="4">4교시</option>
		<option value="5">5교시</option>
		<option value="6">6교시</option>
		<option value="7">7교시</option>
		<option value="8">8교시</option>
	</select> &nbsp; 정원 입력<input type="number" name="capacity"> <input
		type="button" id="addClass" value="강좌 등록">
</form>
<br>
<br>
<br>
<br>
<br>
<br>

<div class="container">
<form>
	<button name="deleteClass" id="deleteClassBtn">전체 삭제하기</button>
	<table id="table" class="table table-hover">
		<thead id="table_head">
			<tr>
				<th>ProgramName</th>
				<th>TeacherName</th>
				<th>ClassTime</th>
				<th>ClassDay</th>
			</tr>
		</thead>
		<tbody id="table_body">
		<c:forEach items="${classList}" var="list" >
		<!-- 원래 있던 리스트 -->
		<tr>
		<td>${list.getProgram().programName}</td>
		<td>${list.getTeacher().teacherName}</td>
		<td>${list.classTime}</td>
		<td>${list.classDay}</td>
		</tr>
		</c:forEach>
			<!-- 데이터 AJAX에서 추가해서 보여준다 -->
		</tbody>
	</table>
</form>
</div>