<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="org.kosta.model.etc.classDay"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	// 수강 희망 시간표 클릭 시 
	   $(".regLink").click(function(){
		   // visitor의 경우 로그인 alert
		   if(${empty memberVO}){
			   alert("로그인을 하세요.");
			   return true;
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
.title {
	background-color: #4E7D55;
	color: white;
	font-size: 1.5em;
	padding: 1rem;
	text-align: center;
	text-transform: uppercase;
}

.table-users {
	border: #4E7D55;
	border-radius: 10px;
	box-shadow: 3px 3px 0 rgba(0, 0, 0, 0.1);
	max-width: calc(100% - 2em);
	margin: 1em auto;
	overflow: hidden;
	width: 100%;
}

table {
	text-align: center;
	border-collapse: collapse;
	width: 100%;
	font-weight: bold;
	opacity: 1;
	padding-left: 150px;
	padding-right: 150px;
}

table:hover tbody td a {
	opacity: .3;
}

table tbody td:hover a {
	opacity: 1;
	font-size: larger;
}

table a {
	color: black;
	text-decoration: none;
}

table a:hover {
	color: #007D12;
	text-decoration: none;
}

body {
	margin: 0;
	font-family: sans-serif;
	font-weight: 100;
}

th {
	background-color: #EDFFF0;
	text-align: center;
	border-style: solid;
	border-width: 1px;
	padding: 8px;
	width: 150px;
	height: 40px;
	color: #4E7D55;
}
/* #table_head {
	background-color: black;
} */
td {
	background-color: white;
	text-align: center;
	border-style: solid;
	border-width: 1px;
	padding: 8px;
	width: 150px;
	height: 90px;
}

#classtime {
	width: 50px;
}

.fullClass {
	color: red;
}

#back_page {
	margin-top: 10px;
	margin-bottom: 5px;
}

#today {
	background-color: #A5FFB1;
}
.past{
	color: yellow;
}
</style>

<!-- body부분 -->
<%
	// 오늘 요일의 정보를 현재 페이지 변수인 pageContext.setAttribute에 저장
	// *Date().getDay() 현재요일의 데이터 값을 일~토 = 0~6으로 받는다.
	// 초기 시간표 구현시 월~토 = 0~5로 구현하여, 'today-1'값을 변수로 저장
	pageContext.setAttribute("today", new Date().getDay() - 1);
%>
<div class="col-sm-1"></div>
<div class="col-sm-10">
	<!-- 로그인 시 회원의 package수 출력 -->
	<c:choose>
		<c:when test="${sessionScope.memberVO.id!=null }">
			<input id="back_page" type="button"
				value="신청 가능 횟수: ${requestScope.userPackage}">
		</c:when>
		<c:otherwise>
			<!-- 비로그인 시 로그인 필요 구문 출력 -->
			<a
				href="${pageContext.request.contextPath}/DispatcherServlet?command=page&url=/Member/Login.jsp">
				<input id="back_page" type="button" value="로그인을 하세요.">
			</a>
		</c:otherwise>
	</c:choose>
	<br>
	<div class="table-users">
		<div class="title">Time Table</div>
		<!-- timetable -->
		<table id="maintable">
			<!-- table head / 요일 입력 -->
			<thead id="table_head">
				<tr>
					<th id="classtime">TIME</th>
					<th>MON</th>
					<th>TUE</th>
					<th>WED</th>
					<th>THU</th>
					<th>FRI</th>
					<th>SAT</th>
				</tr>
			</thead>
			<!-- table body -->
			<tbody id="timetable">
				<c:choose>
					<%-- <c:when test="true"> --%>
					<c:when test="${pageScope.today == -1 }">
						<tr>
							<td class="" colspan="7">다음주 시간표 준비중 입니다.<br> <img
								src="${pageContext.request.contextPath }/TimeTable/settingTime.gif"
								alt=""></td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach begin="1" end="8" varStatus="countOfClassTime">
							<tr>
								<!-- 1열 1~8교시 입력 -->
								<td id="classtime">${countOfClassTime.count }</td>
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
									<c:forEach items="${timetable_list }" var="list"
										varStatus="tdNo">
										<!-- 클래스의 시간, 클래스에 맞는 위치에 클래스 정보 출력 -->
										<c:if
											test="${list.classTime==countOfClassTime.count&&list.classDay==week.index }">
											<!-- 정원와 등록인원이 같을 때 link를 해제한다. -->
											<c:choose>
												<c:when test="${list.capacity==list.count_reg }">
													<span class="fullClass">${list.programName }<br>${list.teacherNick }<br>${list.count_reg }/
														${list.capacity }
													</span>
												</c:when>
												<c:when test="${week.index < pageScope.today }">
													<span class="past">${list.programName }<br>${list.teacherNick }<br>${list.count_reg }/
														${list.capacity }
													</span>
												</c:when>
												<c:otherwise>
													<!-- 클래스 내용을 누르면 수강 신청으로 연결되는 링크 삽입 -->
													<a class="regLink"
														href="${pageContext.request.contextPath}/DispatcherServlet?command=Create_RegisterClass&classNo=${list.classNo }">${list.programName }<br>${list.teacherNick }<br>
														${list.count_reg }/ ${list.capacity }
													</a>
												</c:otherwise>
											</c:choose>
										</c:if>
									</c:forEach>
									</td>
								</c:forEach>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
</div>
<div class="col-sm-1"></div>