<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script>
	function wrapWindowByMask() {
		// 화면의 높이와 너비를 변수로 만듭니다.
		var maskHeight = $(document).height();
		var maskWidth = $(window).width();

		// 마스크의 높이와 너비를 화면의 높이와 너비 변수로 설정합니다.
		$('.mask').css({
			'width' : maskWidth,
			'height' : maskHeight
		});

		// fade 애니메이션 : 1초 동안 검게 됐다가 80%의 불투명으로 변합니다.
		/* $('.mask').fadeIn(1000);  */
		$('.mask').fadeTo("fast", 0.6);

		// 레이어 팝업을 가운데로 띄우기 위해 화면의 높이와 너비의 가운데 값과 스크롤 값을 더하여 변수로 만듭니다.
		var left = ($(window).scrollLeft() + ($(window).width() - $('.window').width()) / 2);
		var top = ($(window).scrollTop() + ($(window).height() - $('.window').height()) / 2);

		// css 스타일을 변경합니다.
		$('.window').css({
			'left' : left,
			'top' : top,
			'position' : 'absolute'
		});

		// 레이어 팝업을 띄웁니다.
		$('.window').show();
	}

	$(document).ready(function() {
		// showMask를 클릭시 작동하며 검은 마스크 배경과 레이어 팝업을 띄웁니다.
		$('.showMask').click(function(e) {
			// preventDefault는 href의 링크 기본 행동을 막는 기능입니다.
			e.preventDefault();
			wrapWindowByMask();
		});

		// 닫기(close)를 눌렀을 때 작동합니다.
		$('.window .close').click(function(e) {
			e.preventDefault();
			$('.mask, .window').hide();
		});

		// 뒤 검은 마스크를 클릭시에도 모두 제거하도록 처리합니다.
		$('.mask').click(function() {
			$(this).hide();
			$('.window').hide();
		});
	});
</script>
<!-- header -->

<div class="mask"></div>
	<!-- modal형 로그인 페이지 -->
	<form class="loginForm window"
		action="${pageContext.request.contextPath}/DispatcherServlet" method="post">
		<input type="hidden" value="LogIn" name="command">
		<div>
			<label for="id">ID:</label> <input type="text" name="userId" required="required" />
		</div>
		<div>
			<label for="password">PASSWORD:</label> <input type="password" required="required" name="userPassword" />
		</div>
		<div id="loginBtn">
			<input type="submit" value="LogIn" class="btn btn-dark" />
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
							<li><span><a href="????">My Page</a></span>
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
							<li><a href="#">내정보 수정</a></li>
							<li><a href="#">수강내역 확인</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
