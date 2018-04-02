<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/postEditor.js"></script>
<style>
#contentDiv{
	height='800px';
}
</style>
<div class="container">
	<div class="row text">
		<div class="col-sm-12">
			<form action="DispatcherServlet" method="post" name="form" class="editorform">
				<input type="hidden" name="command" value="postWrite"> 
				<!-- 제목 -->
				번호: 
				제목: 
				글쓴이:
				작성 날짜:
				<!-- 쓰기영역 -->
				<br>
				<!-- <IFRAME NAME=dhtmlframe></IFRAME><br>			 -->	
				<!-- 쓰기영역 html -->
				<!-- <textarea rows="10" cols="40" class="postContents" name="content" readonly="readonly"> -->	
				<div id="contentDiv">
				<pre>adwjiawjdpi</pre>
				</div>
				<!-- </textarea> -->
				<!-- 글 등록 & 취소-->
				<div class="post_button">
					<input id="post_button_bt" type="submit" value="수정" Onclick="">
					<input id="post_button_bt" type="button" value="확인" Onclick="history.back()">
				</div>
			</form>
		</div>
	</div>
</div>
