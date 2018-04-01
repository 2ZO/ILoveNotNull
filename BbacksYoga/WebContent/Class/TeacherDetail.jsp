<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <div class="row">
<section class="panel">
      </section>
<div class="col-lg-1"></div>

     <div class="col-lg-4 col-xlg-3 col-md-5">
        <div class="card">
            <div class="card-body">
                <center class="m-t-30"> <img src="${pageContext.request.contextPath}/Image/teacher/${requestScope.teacherInfo.img_url}" class="img-circle" width="150">
                    <h4 class="card-title m-t-10">${requestScope.teacherInfo.teacherName}</h4>
                    <h6 class="card-subtitle">${requestScope.teacherInfo.teacherNick} 선생님</h6>
                </center>
            </div>
            <div>
            <hr> </div>
            <div class="card-body"> 
            <small class="text-muted">현재 수강중인 강좌</small>
                <h6>나중에</h6> 
            <small class="text-muted p-t-30 db">선생님 프로필</small>
                <h6>${requestScope.teacherInfo.teacherProfile}</h6>
                <br>
            </div>
        </div>
    </div>






</div> --%>

<div class="row profile_detail">
  <img class="profile-img" src=${pageContext.request.contextPath}/Image/teacher/${requestScope.teacherInfo.img_url} >
  <div class="profile-text">
		<div class="profile-description">
			<span id="name">${requestScope.teacherInfo.teacherName}</span>&nbsp;
	    	<span id="nick">${requestScope.teacherInfo.teacherNick}</span><br>
	    	<span class="profile-title">"${requestScope.teacherInfo.teacherProfile}"</span>
        </div>
        <div class="profile-description2">
			<div class="profile-des">수강중인 프로그램</div>
			<div class="profile-des">나중에 데이터 받아올 곳</div>
        </div>
  </div>
</div>