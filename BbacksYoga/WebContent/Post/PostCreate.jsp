<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/postEditor.js"></script>
<script type="text/javascript">
function datasubmit()
{
	alert(window.clipboardData);
	form.content.value = dhtmlframe.document.body.innerHTML;
	return confirm('글을 등록하겠음?');
	
}

function handlePaste (e) {
    console.log();
	var clipboardData, pastedData;
 
    // Stop data actually being pasted into div
   // e.stopPropagation();
  //  e.preventDefault();
 
    // Get pasted data via clipboard API
    clipboardData = e.clipboardData || window.clipboardData;
    pastedData = clipboardData.getData('Text');
    
    dhtmlframe.document.open(); 
	dhtmlframe.document.write(clipboardData); 
	dhtmlframe.document.close();
    
    // Do whatever with pasteddata
    alert(pastedData);
}



</script>
<div class="container">
	<div class="row text">
		<div class="col-sm-12 contents">
			<form action="DispatcherServlet" method="post" name="form" class="editorform" onsubmit="return datasubmit()">
				<input type="hidden" name="command" value="postWrite"> 
				<!-- 제목 -->
				글제목 <input type="text" class="title" name="title" required="required"><br> 
				<!-- 에디터 링크 -->
				<div class="editor">
					<a href="javascript:htmledit('cut');">
						<img alt="자르기" src="${pageContext.request.contextPath}/Image/editor/cut.png">
					</a>
					<a href="javascript:htmledit('copy');">
						<img alt="복사" src="${pageContext.request.contextPath}/Image/editor/copy.png">
					</a>
					<a href="javascript:handlePaste();">
						<img alt="붙여넣기" src="${pageContext.request.contextPath}/Image/editor/paste.png">
					</a> 
					<a href="javascript:htmledit('justifyleft');">
						<img alt="좌측정렬" src="${pageContext.request.contextPath}/Image/editor/justifyleft.png">
					</a>
					<a href="javascript:htmledit('justifycenter');">
						<img alt="중앙정렬" src="${pageContext.request.contextPath}/Image/editor/center-alignment.png">
					</a>
					<a href="javascript:htmledit('justifyright');">
						<img alt="우측정렬" src="${pageContext.request.contextPath}/Image/editor/justifyright.png">
					</a>
					<a href="javascript:htmledit('insertunorderedlist');">
						<img alt="리스트" src="${pageContext.request.contextPath}/Image/editor/list.png">
					</a>
					<a href="javascript:htmledit('insertorderedlist');">
						<img alt="숫자리스트" src="${pageContext.request.contextPath}/Image/editor/num_list.png">
					</a>
					<a href="javascript:htmledit('outdent');">
						<img alt="왼쪽들여쓰기" src="${pageContext.request.contextPath}/Image/editor/left-indent.png">
					</a>
					<a href="javascript:htmledit('indent');">
						<img alt="오른쪽들여쓰기" src="${pageContext.request.contextPath}/Image/editor/right-indent.png">
					</a>
					<a href="javascript:htmledit('createlink');">
						<img alt="링크" src="${pageContext.request.contextPath}/Image/editor/link.png">
					</a>
					<div class="dropdown">
  						<img alt="폰트 글꼴" src="${pageContext.request.contextPath}/Image/editor/font.png">
  						<div class="dropdown-content">
						    <a href="javascript:htmledit('fontname','굴림');">굴림</a>
							<a href="javascript:htmledit('fontname','궁서');">궁서</a>
					  </div>
					</div>
					
					<div class="dropdown">
  						<img alt="폰트 사이즈" src="${pageContext.request.contextPath}/Image/editor/fontSize.png">
  						<div class="dropdown-content">
						    <a href="javascript:htmledit('fontSize',2);">2</a>
							<a href="javascript:htmledit('fontSize',4);">4</a>
							<a href="javascript:htmledit('fontSize',6);">6</a>
							<a href="javascript:htmledit('fontSize',8);">8</a>
							<a href="javascript:htmledit('fontSize',10);">10</a>
					  </div>
					</div>
										
					<a href="javascript:htmledit('bold');">
						<img alt="볼드" src="${pageContext.request.contextPath}/Image/editor/bold.png">
					</a>
					<a href="javascript:htmledit('italic');">
						<img alt="이탤릭" src="${pageContext.request.contextPath}/Image/editor/italic.png">					
					</a>
					<a href="javascript:htmledit('underline');">
					<img alt="언더라인" src="${pageContext.request.contextPath}/Image/editor/underLine.png">
					</a>
				</div>
				
				<!-- 쓰기영역 -->
				<br>
				<IFRAME NAME=dhtmlframe id="dhtmlframe" ></IFRAME><br>				
				<!-- 쓰기영역 html -->
				<textarea rows="10" cols="40" class="postContents" name="content">	</textarea>
				<!-- 글 등록 & 취소-->
				<div class="post_button">
					<input id="post_button_bt" type="submit" value="등록">
					<input id="post_button_bt" type="button" value="취소" Onclick="history.back()">
				</div>
			</form>
		</div>
	</div>
</div>
