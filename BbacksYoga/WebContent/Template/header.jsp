<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/header.js"></script>
<!-- 스크립트 별도 폴더에 넣고 import -->
<script type="text/javascript">
/*로그인 ajax로 처리하기~*/
$(document).ready(function(){
$("#logInBtn").click(function(){
		$.ajax({
		type:"post",
		dataType:"json",   
		url:"${pageContext.request.contextPath}/DispatcherServlet",
		data:$("#logInForm").serialize(),
		success:function(data){
			//alert(data.length);
			if(data.flag=="false"){
				$("#loginFail").html("LogIn Fail");
			}else{
				//flag가 true면 메인페이지로 바로 이등~
				location.href="${pageContext.request.contextPath}/index.jsp"
			}
			//$("#membody").html(info);
		}//success
	});//ajax
	});
});
</script>
<!-- header -->
<div class="mask"></div>
	<!-- modal형 로그인 페이지 -->
	<form class="loginForm window" id="logInForm"
		action="${pageContext.request.contextPath}/DispatcherServlet" method="post">
		<input type="hidden" value="LogIn" name="command">
		<div>
			<label for="id">ID:</label> <input type="text" name="userId" required="required" />
		</div>
		<div>
			<label for="password">PASSWORD:</label> <input type="password" required="required" name="userPassword" />
		</div>
		<div id="loginBtn">
			<input type="button" value="LogIn" id="logInBtn"class="btn btn-dark" />
			<label id="loginFail"></label>
		</div>
	</form>
	<!-- header 쪽 로고 -->	
	
	<div class="row">
	    <div class="col-sm-4"></div>
	    <div class="col-sm-4">
		    <h1 id="headerLogo">
				<a href="index.jsp"><img src="${pageContext.request.contextPath}/Image/logo01.png" alt="logo"></a>
			</h1>
	    </div>
	    <div class="col-sm-4" style="background-color:lavender;">
	    	<div id="rightWrap" class="setDiv">
				<ul id="headerRight">
					<c:choose>
						<c:when test="${empty memberVO}">
							<li><span class="showMask">Login</span>
							<li><a href="${pageContext.request.contextPath}/DispatcherServlet?command=RegisterView">Join</a></li>
							<!-- "	-->
						</c:when>
						<c:otherwise>
							<li><span>${memberVO.name}님 환영합니다.</span>
							<li><span><a href="#">My Page</a></span>
							<li><span><a href="${pageContext.request.contextPath}/Member/Logout.jsp">LogOut</a></span>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>	    
	    </div>
 	</div>
	<!-- 메뉴  -->
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navWrap">
				<ul class="nav navbar-nav">
					<li class="dropdown"><a class="dropdown-toggle"	data-toggle="dropdown" href="#">Bbak's</a>
						<ul class="dropdown-menu">
							<li><a href="#">Bbak's 요가소개</a></li>
							<li><a href="${pageContext.request.contextPath}/DispatcherServlet?command=teacherList">강사진소개</a></li>
							<li><a href="#">시설소개</a></li>
						</ul></li>
				</ul>
				<ul class="nav navbar-nav">
					<li class="dropdown"><a class="dropdown-toggle"	data-toggle="dropdown" href="#">Lesson</a>
						<ul class="dropdown-menu">
							<li><a href="#">프로그램 소개</a></li>
							<li><a href="#">강좌시간표</a></li>
							<li><a href="#">강좌 신청</a></li>
						</ul></li>
				</ul>
				<ul class="nav navbar-nav">
					<li class="dropdown"><a class="dropdown-toggle"	data-toggle="dropdown" href="#">Community</a>
						<ul class="dropdown-menu">
							<li><a href="#">FAQ</a></li>
							<li><a href="#">Q&amp;A</a></li>
							<li><a href="${pageContext.request.contextPath}/DispatcherServlet?command=writePostView">(임시) 글쓰기</a></li>
						</ul></li>
				</ul>
				<ul class="nav navbar-nav">
					<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">My Page</a>
						<ul class="dropdown-menu">
							<li><a href="DispatcherServlet?command=page&url=/Member/MyInfoCheck.jsp">내정보 수정</a></li>
							<li><a href="#">수강내역 확인</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
