<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	$(document).ready(function() {
		// iframe에 이전에 쓴 내용 넣기
		dhtmlframe.document.open(); 
		dhtmlframe.document.write("${postVO.content}"); 
		dhtmlframe.document.close();
	})
	
	    function modify()
    {
    	form.content.value = dhtmlframe.document.body.innerHTML;
    	var check_submit=confirm('글을 수정하겠음?');
    	return check_submit;
    }

</script>
<div class="container">
	<div class="row text">
		<div class="col-sm-12 contents">
			<form action="DispatcherServlet" method="post" name="form" class="editorform" onsubmit="return modify()">
				<input type="hidden" name="command" value="postModify"> 
				<input type="hidden" name="postNo" value="${postVO.postNo}">
				<!-- 제목 -->
				글번호: ${postVO.postNo} 글쓴이: ${postVO.id} 작성 날짜:${postVO.regDate}<br>					
				<!-- 제목 -->
				글제목 <input type="text" class="title" name="title" value="${postVO.title}" required="required"><br> 
				<!-- 에디터 링크 -->
				<c:import url="/Post/editor.jsp"></c:import>				<!-- 쓰기영역 -->
				<br>
				<IFRAME NAME=dhtmlframe id="dhtmlframe" > </IFRAME><br>				
				<!-- 쓰기영역 html -->
				<textarea rows="10" cols="40" class="postContents" name="content">	</textarea>
				<!-- 글 등록 & 취소-->
<<<<<<< HEAD
				<div class="post_button2">
					<input id="submit_post" type="submit" value="등록">
					<input id="cancel_post" type="button" value="취소" Onclick="history.back()">
=======
				<div class="post_button">
					<input id="post_button_bt" type="submit" value="등록" id="submit_button" >
					<<input id="post_button_bt" type="button" value="취소" Onclick="history.back()">
>>>>>>> branch 'master' of https://github.com/2ZO/ILoveNotNull.git
				</div>
			</form>
			<!-- 사진올리기 -->
			<form method="post" enctype="multipart/form-data" id="postImg">
				   <input type="hidden" name="test" value="hidden">
				    <div>
				        <div class="input_wrap">
				            <input name="input_imgs" type="file" id="input_imgs" >			 		
				        </div>
				    </div>				 
				    <div>
				        <div class="imgs_wrap">
				            <img id="img" />
				        </div>
				    </div>
				    <div class="post_button">
		   				<a href="javascript:" class="my_button" onclick="submitAction();">등록</a>
		   				<a href="javascript:" class="my_button" onclick="cancelAction();">취소</a>
		   			</div>
		   </form>	
		</div>
	</div>
</div>
