<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--이미지 테스트 <img src="${pageContext.request.contextPath}/Class/img/teacher/시우민.png1" alt="시우민">--%>

<!-- 선생님 리스트  -->
<div class="container">
<div class="col-md-12">
      <section class="panel">
      </section>

      <div class="row teacher-list">
      <c:forEach items="${requestScope.teacherList}" var="list">
      <!-- 선생님 박스  -->
         	
          <div class="col-md-3">
              <section class="profile">
                  <div class="teacher-img-box">
                      <img src="${pageContext.request.contextPath}/Image/teacher/${list.img_url}" alt="">
                      
                      <a href="${pageContext.request.contextPath}/DispatcherServlet?command=teacherDetail&teacherId=${list.teacherId}" class="detail">
                          <i class="fa teacherDetail">
                          	<!-- 강사 로고 누르면 디테일 페이지로 이동  -->
                          	<img src="${pageContext.request.contextPath}/Image/teacher/yoga_teacher_icon.png">
                          </i>
                      </a>
                  </div>

                  <div class="panel-body text-center">
                      <h4>
                          <!-- 강사 이름을 누르면 디테일 페이지로 이동  -->
                          <a href="${pageContext.request.contextPath}/DispatcherServlet?command=teacherDetail&teacherId=${list.teacherId}" class="teacherName">
                              ${list.teacherName}
                          </a>
                      </h4>
                      <p class="teacherNick">${list.teacherNick}</p>
                  </div>
              </section>
          </div>   
      </c:forEach>              
      </div>
  </div>
</div>
