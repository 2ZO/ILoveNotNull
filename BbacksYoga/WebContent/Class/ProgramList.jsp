<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<!-- table css 추가 / QNA.jsp와 동일 css 적용 -->
<style type="text/css">
	table {
    border-collapse: collapse;
    width: 60%;
	margin: 40px auto 0;
}

	th, td {
    text-align: left;
    padding: 8px;
}

	tr:nth-child(even){background-color: #f2f2f2}

	th {
    background-color: #4CAF50;
    color: white;
}
</style>
<script>
/* 	var pno;
	function gotoDetail(pno) {
		location.href="${pageContext.request.contextPath}/DispatcherServlet?command=programDetail&programNo="+pno;
	} */
	$(document).ready(function() {
		$('tr').click(function() {
			var pno = $(this).attr('id'); 
			$('#myModal').on('show.bs.modal', function () {
				$.ajax({
					type : "get",
					url : "${pageContext.request.contextPath}/DispatcherServlet",
					dataType : "json",
					data : "command=programDetail&programNo=" + pno,
					success : function(data) { 
						$("#prgramName").html(data.programName); 
						$("#programDetail").html(data.programDetail); 
					}//success
				})//ajax 				 
			})//show modal
			$('.modal').on('hidden.bs.modal', function () {
	            $(this).removeData('bs.modal');
			});//hide modal
		}); //myModal click
	});
</script>
<!-- 프로그램 리스트 출력 -->
<table>
	<tr>
		<th>프로그램 번호</th><th>프로그램 이름</th>
	</tr>
	<c:forEach items="${requestScope.lvo.list}" var="plist" varStatus="py">
	<tr id="${plist.programNo}" data-toggle="modal"  data-target="#myModal" >
		<c:set var= "sum" value="${(requestScope.lvo.pagingBean.nowPage-1)*5}"/>
		<td class="programNo">${py.index+sum+1}</td>
		<td class="programName">${plist.programName }</td>
	</tr>
	</c:forEach>
</table>
<!-- 페이징 처리 -->
<div class="pagingInfo">
	<c:set var="pb" value="${requestScope.lvo.pagingBean}"></c:set>
	<ul class="pagination">
	
	<c:if test="${pb.previousPageGroup}">	
		<li><a href="DispatcherServlet?command=programList&pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
	</c:if>
	<c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
	
	<c:choose>
	<c:when test="${pb.nowPage!=i}">
		<li><a href="DispatcherServlet?command=programList&pageNo=${i}">${i}</a></li> 
	</c:when>
	<c:otherwise>
		<li class="active"><a href="#" >${i}</a></li>
	</c:otherwise>
	</c:choose>
	
		&nbsp;
	</c:forEach>
	<c:if test="${pb.nextPageGroup}">	
		<li><a href="DispatcherServlet?command=programList&pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
	</c:if>
	</ul>
</div> 	

<div class="modal fade" id="myModal">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">프로그램 소개</h4><hr>
				프로그램 이름: <span id="prgramName"></span><br>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal body -->
			<div class="modal-body">
				<div class="row program_detail">
					<div class="profile-text">
						<div class="profile-description">
							<span id="programDetail"></span>
						</div>
					</div>
				</div>
			</div>
			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

