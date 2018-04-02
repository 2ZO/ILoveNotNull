<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--이미지 테스트 <img src="${pageContext.request.contextPath}/Class/img/teacher/시우민.png1" alt="시우민">--%>

<!-- 선생님 리스트  -->
<div class="container">
	<div class="col-md-12">
	      <div class="row teacher-list">
	      	<c:forEach items="${requestScope.teacherList}" var="list">
		      <!-- 선생님 박스  -->
		      <div class="col-md-3">
		      	<section class="profile">
		      		<!-- 사진 영역  -->
		        	<div class="teacher-img-box">
		            	<!-- 강사 사진을 누르면 디테일 페이지로 이동  -->            
		                <a href="${pageContext.request.contextPath}/DispatcherServlet?command=teacherDetail&teacherId=${list.teacherId}" >
		                	<img src="${pageContext.request.contextPath}/Image/teacher/${list.img_url}" alt="${list.img_url}">
		                </a>
		                <a href="${pageContext.request.contextPath}/DispatcherServlet?command=teacherDetail&teacherId=${list.teacherId}" class="detail">
		                	<i class="fa teacherDetail">
		               		<!-- 강사 아이콘박스를 누르면 디테일 페이지로 이동  -->
		                	   	<img src="${pageContext.request.contextPath}/Image/teacher/yoga_teacher_icon.png">
		                    </i>
		               	</a>
		        	</div>
		        	<!-- 이름과 닉네임 영역 -->
		        	<div class="panel-body text-center">
		            	<h4 class="teacherName">${list.teacherName}</h4>
		                <p class="teacherNick">${list.teacherNick}</p>
		           	</div>
		     	</section>
		 	</div>   
	   		</c:forEach>              
	    </div>
	</div>
</div>
