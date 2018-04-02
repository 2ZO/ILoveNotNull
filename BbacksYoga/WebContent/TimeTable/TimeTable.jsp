<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
$(document).ready(function(){
   $(".regLink").click(function(){
	      if(${requestScope.userPackage>0}){
	          return confirm($(this).text()+"를 수강하시겠습니까?");
	       }else{
	          alert("수강신청 가능 횟수를 모두 소모하셨습니다.");
	          return false;
	       }
	    }); //click
	 });//ready
</script>

<style type="text/css">

table {
	text-align: center;
    border-collapse: collapse;
    width: 100%;
}

th, td {
	border-style: solid;
	border-width: 1px;
    padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}

</style>
<div class="container">
<a href="DispatcherServlet?command=Read_Register">수강내역확인</a>&emsp;신청 가능 횟수: <span id="userPackage">${requestScope.userPackage}</span>
	<table>
		<thead>
			<tr>
				<th>TIME</th>
				<th>MON</th>
				<th>TUE</th>
				<th>WEN</th>
				<th>THU</th>
				<th>FRI</th>
				<th>SAT</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach begin="1" end="8" varStatus="countOfClassTime">
				<tr>
					<td>${countOfClassTime.count }</td>
					<c:forEach begin="0" end="5" varStatus="week">
					<td><c:forEach items="${timetable_list }" var="list" varStatus="tdNo">
							<c:if test="${list.classTime==countOfClassTime.count&&list.classDay==week.index }">
								<c:choose>
									<c:when test="${list.capacity==list.count_reg }">
										<span class="fullClass">${list.programName }<br>${list.teacherNick }<br>${list.count_reg }/ ${list.capacity }</span>
									</c:when>
									<c:otherwise>
										<a class="regLink" href="DispatcherServlet?command=Create_RegisterClass&classNo=${list.classNo }">${list.programName }<br>${list.teacherNick }<br>
										${list.count_reg }/ ${list.capacity }</a>
									</c:otherwise>
								</c:choose>
							</c:if>
						</c:forEach></td>
				</c:forEach>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
