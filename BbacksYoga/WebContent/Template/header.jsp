<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
    <meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/nav.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- header -->
<header>
	<h1 id="headerLogo"><a href="index.jsp"><img src="../image/logo01.png" alt="logo"></a></h1>
	<div id="rightWrap">
	<ul id="headerRight">
		<li><a href="login.jsp">Login</a></li>
		<li><a href="register.jsp">Join</a></li>
	</ul>
	</div>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
  	<div class="navWrap">
    <ul class="nav navbar-nav">
        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Bbak's</a>
        <ul class="dropdown-menu">
          <li><a href="#">Bbak's 요가소개</a></li>
          <li><a href="#">강사진소개</a></li>
          <li><a href="#">시설소개</a></li>
        </ul>
      </li>
    </ul>
      <ul class="nav navbar-nav">
        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Lesson</a>
        <ul class="dropdown-menu">
          <li><a href="#">프로그램 소개</a></li>
          <li><a href="#">강좌시간표</a></li>
          <li><a href="#">강좌 신청</a></li>
        </ul>
      </li>
    </ul>
      <ul class="nav navbar-nav">
        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Community</a>
        <ul class="dropdown-menu">
          <li><a href="#">FAQ</a></li>
          <li><a href="#">Q&amp;A</a></li>
        </ul>
      </li>
    </ul>
    <ul class="nav navbar-nav">
        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">My Page</a>
        <ul class="dropdown-menu">
          <li><a href="#">내정보 수정</a></li>
          <li><a href="#">수강내역 확인</a></li>
        </ul>
      </li>
    </ul>
    </div>
  </div>
    </nav>
</header>