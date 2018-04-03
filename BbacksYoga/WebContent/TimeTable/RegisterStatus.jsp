<%@page import="org.kosta.model.etc.classDay"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	function delete_register(classNo){
		if(confirm("해당 강좌를 취소하시겠습니까?")){
			location.href="DispatcherServlet?command=Delete_Register&classNo="+classNo;
		}
	}
</script>
<style type="text/css">

table {
	text-align: center;
    border-collapse: collapse;
    width: 100%;
}

th, td {
	text-align: center;
	border-style: solid;
	border-width: 1px;
    padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}

</style>
<div class="container">
 <input id="back_page" type="button" value="Back" onclick="history.back()">
	<table>
		<thead>
			<tr>
				<th>강좌명</th>
				<th>강사</th>
				<th>요일</th>
				<th>시간</th>
				<th>등록일시</th>
				<th>비고</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${registerStatus_list }" var="list">
				<tr>
					<td>${list.programName }</td>
					<td>${list.teacherNick }</td>
					<td>
						<c:choose>
							<c:when test="${list.classDay==classDay.MON.getName() }">
								월요일
							</c:when>
							<c:when test="${list.classDay==classDay.TUE.getName() }">
								화요일
							</c:when>
							<c:when test="${list.classDay==classDay.WEN.getName() }">
								수요일
							</c:when>
							<c:when test="${list.classDay==classDay.THU.getName() }">
								목요일
							</c:when>
							<c:when test="${list.classDay==classDay.FRI.getName() }">
								금요일
							</c:when>
							<c:when test="${list.classDay==classDay.SAT.getName() }">
								토요일
							</c:when>
						</c:choose>
					</td>
					<td>${list.classTime }교시</td>
					<td>${list.regDate }</td>
					<td><input type="button" value="수강취소" onclick="delete_register(${list.classNo})"></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>