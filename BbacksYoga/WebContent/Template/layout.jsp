<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!Doctype html>
<html>
<head>
<meta charset="utf-8">

<!--  내부 CSS -->
<link rel="stylesheet" 	href="${pageContext.request.contextPath}/CSS/nav.css">
<link rel="stylesheet"	href="${pageContext.request.contextPath}/CSS/layout.css">
<link rel="stylesheet"	href="${pageContext.request.contextPath}/CSS/TeacherList.css"><!-- 선생님 리스트 css추가 -->
<link rel="stylesheet" 	href="${pageContext.request.contextPath}/CSS/postWrite.css"><!-- 게시글 관련 css 추가 -->

<!-- 부트스트랩용 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- script url test -->



<!-- 팝업창 js -->
<!-- 이거 js폴더로 옮기고 싶은데 이상하게 옮기면 팝업창 404뜸 -_- 경로문제인듯 제가 내일고칠께욤 -->
<script type="text/javascript">
$(document).ready(function(){
	<%/*팝업 띄울지 말지 쿠키체크  */
		boolean flag= true;
		Cookie[] cookies= request.getCookies();
		for(int i=0;i<cookies.length;i++){
			if(cookies[i].getName().equals("popup")&&cookies[i].getValue().equals("false")){
				flag=false;
				break;
			}
		}
		if(flag==true){%>
	var popUrl = "${pageContext.servletContext.contextPath}/Template/adPopup.jsp"; //팝업창에 출력될 페이지 URL
	var popOption = "width=320, height=370, resizable=no, scrollbars=no, status=no;"; //팝업창 옵션(optoin)
	window.open(popUrl, "", popOption);
	<%}%>
});
</script>

<title>BbacksYoga</title>
</head>

<body>
	<!-- header -->
	
	<header>
		<c:import url="header.jsp"></c:import>
	</header>
	
	<!-- 메인 -->
	<main role="main" class="container">
	<c:if test="${empty url}">
		<c:import url="/Member/Idcheck.jsp"></c:import>
	</c:if>
	<c:if test="${!empty url}">
		<c:import url="${url}"></c:import>
	</c:if>
	</main>
	
	<!-- footer -->
	<footer class="footer">
		<div class="container">
			<c:import url="footer.jsp"></c:import>
		</div>
	</footer>
</body>
</html>