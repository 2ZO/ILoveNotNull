<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="org.kosta.model.etc.classDay"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	// 수강 희망 시간표 클릭 시 
	   $(".regLink").click(function(){
		   // visitor의 경우 로그인 alert
		   if(${empty memberVO}){
			   alert("로그인을 하세요.");
			   location.href="${pageContext.request.contextPath}/DispatcherServlet?command=page&url=/Member/Login.jsp";
			   return false;
		   }
		   // 회원 package가 0보다 클 때, 선택한 과목의 정보를 보여주며 confirm
		   // 확인 시 링크가 실행되어 Create_RegisterClassController로 이동
		      if(${requestScope.userPackage>0}){
		    	  // 클릭한 <td> 값의 html 문에서 split을 이용하여 <br>을 기준으로 끊어 출력
		    	 var info=$(this).html().split("<br>");
		         return confirm(info+"를 수강하시겠습니까?");
		       }else{
		    	   // 회원 package가 0일 시 alert
		          alert("수강신청 가능 횟수를 모두 소모하셨습니다.");
		          return false;
		       }
		    }); //click
		 });//ready
	</script>

<!-- CSS -->
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

<!-- body부분 -->

<%
// 오늘 요일의 정보를 현재 페이지 변수인 pageContext.setAttribute에 저장
// *Date().getDay() 현재요일의 데이터 값을 일~토 = 0~6으로 받는다.
// 초기 시간표 구현시 월~토 = 0~5로 구현하여, 'today-1'값을 변수로 저장
	pageContext.setAttribute("today", new Date().getDay()-1);	
%>
<div class="col-sm-1" ></div>
<div class="col-sm-10">
	<!-- 로그인 시 회원의 package수 출력 -->
	<c:choose>
	<c:when test="${sessionScope.memberVO.id!=null }">
	<input id="back_page" type="button" value="신청 가능 횟수: ${requestScope.userPackage}" >
	</c:when>
	<c:otherwise>
	<!-- 비로그인 시 로그인 필요 구문 출력 -->
	<input id="back_page" type="button" value="로그인을 하세요." >
	</c:otherwise>
</c:choose>

<!-- timetable -->
	<table id="maintable">
		<!-- table head / 요일 입력 -->
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
		<!-- table body -->
		<tbody id="timetable">
			<c:forEach begin="1" end="8" varStatus="countOfClassTime">
				<tr>
					<!-- 1열 1~8교시 입력 -->
					<td>${countOfClassTime.count }</td>
					<!-- 요일 데이터변수 week에 0~5 지정 -->
					<c:forEach begin="0" end="5" varStatus="week">
					<!-- week과 today 데이터 값이 같을 때 해당 <td>에 id를 주어 색을 입힌다.(오늘에 해당하는 테이블열) -->
					<c:choose>
						<c:when test="${week.index eq pageScope.today }">
							<td id="today">
						</c:when>
						<c:otherwise>
							<td>
						</c:otherwise>
					</c:choose>
					<!-- 시간표 List 변수 선언 -->
					<c:forEach items="${timetable_list }" var="list" varStatus="tdNo">
							<!-- 클래스의 시간, 클래스에 맞는 위치에 클래스 정보 출력 -->
							<c:if test="${list.classTime==countOfClassTime.count&&list.classDay==week.index }">
								<!-- 정원와 등록인원이 같을 때 link를 해제한다. -->
								<c:choose>
									<c:when test="${list.capacity==list.count_reg }">
										<span class="fullClass">${list.programName }<br>${list.teacherNick }<br>${list.count_reg }/ ${list.capacity }</span>
									</c:when>
									<c:otherwise>
										<!-- 클래스 내용을 누르면 수강 신청으로 연결되는 링크 삽입 -->
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