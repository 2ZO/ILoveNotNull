<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="org.kosta.model.etc.classDay"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
/* 	$("#timetable td").hover(function(){	//<td> 호버 색상 변화 기능
		$(this).css("background","rgba(153, 153, 153, 0.8)");
	},function(){
		$(this).css("background","rgba(224, 224, 209, 0.5)");
	}); */
	   $(".regLink").click(function(){
		   if(${sessionScope.memberVO.id==null}){
			   alert("로그인을 하세요.");
			   return false;
		   }
		      if(${requestScope.userPackage>0}){
		    	 var info=$(this).html().split("<br>");
		         return confirm(info+"를 수강하시겠습니까?");
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
    background-image: url("TimeTable/레드벨벳.jpg");
	background-size: cover;
	font-weight: bold;
	opacity: 0.8;
	padding-left: 150px;
	padding-right: 150px;
}

body {
	margin: 0;
	font-family: sans-serif;
	font-weight: 100;
}

th, td {
	background-color: rgba(224, 224, 209, 0.5);
	text-align: center;
 	border-style: solid; 
	border-width: 1px;
    padding: 8px;
}

a{
	color: black;
	text-decoration: none;
	
}
a:hover{
	color: white;
	text-decoration: none;
}
.fullClass{
	color:red;
}
#back_page{
		margin-top: 10px;
	margin-bottom: 5px;
}
#table_head{
	background-color: black;
	color: white;
}
#today{
	background-color: rgba(255,204,0,0.5);
}
</style>
<%
	pageContext.setAttribute("today", new Date().getDay()-1);	
%>
<div class="col-sm-1" ></div>
<div class="col-sm-10">
	<c:choose>
	<c:when test="${sessionScope.memberVO.id!=null }">
	<input id="back_page" type="button" value="신청 가능 횟수: ${requestScope.userPackage}" >
	</c:when>
	<c:otherwise>
	<input id="back_page" type="button" value="로그인을 하세요." >
	</c:otherwise>
</c:choose>
	<table id="maintable">
		<thead id="table_head">
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
		<tbody id="timetable">
			<c:forEach begin="1" end="8" varStatus="countOfClassTime">
				<tr>
					<td>${countOfClassTime.count }</td>
					<c:forEach begin="0" end="5" varStatus="week">
					<c:choose>
						<c:when test="${week.index eq pageScope.today }">
							<td id="today">
						</c:when>
						<c:otherwise>
							<td>
						</c:otherwise>
					</c:choose>
					<c:forEach items="${timetable_list }" var="list" varStatus="tdNo">
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
<div class="col-sm-1" ></div>