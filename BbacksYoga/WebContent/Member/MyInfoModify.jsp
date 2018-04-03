<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
h2{
	width: 120px;
   	margin: 0 auto;
}
</style>
 <script type="text/javascript">
 	var num ; 
	/* var num="question2"; */
    $(document).ready(function() {     		
    	$("#passwordQuestion").val(num).prop("selected", true); 
	});
	function checkModify() {
		var check_submit = confirm("개인정보를 변경 하시겠습니까?")
			return check_submit;
	}
	function gobackMain() {
		location.href="${pageContext.request.contextPath}/index.jsp";
	}
 </script>
	<div class="container">
	<div class="col-md-12 contents"><!-- 좌우측의 공간 확보 -->
            <!-- 헤더 들어가는 부분 -->
             <h2>회원 정보 수정</h2>
            <!--// 헤더 들어가는 부분 -->
            <!-- 모달창 -->
            <div class="modal fade" id="defaultModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title">알림</h4>
                        </div>
                        <div class="modal-body">
                            <p class="modal-contents"></p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
            <!--// 모달창 -->
                <!-- 본문 들어가는 부분 -->
        <form class="form-horizontal" role="form" method="post" action="DispatcherServlet" onsubmit="return checkModify()">
		<input type="hidden" name="command" value="updateMyInfo"> 	
            <div class="form-group" id="divId">
                <label for="inputId" class="col-lg-2 control-label">아이디</label>
                <div class="col-lg-8">
                     <input type="text" readonly="readonly" name="id" value="${requestScope.MemberVO.id}">
                </div>
                <div class="col-lg-2">
                	
                </div>
            </div>
            <div class="form-group" id="divPassword">
                <label for="inputPassword" class="col-lg-2 control-label">패스워드</label>
                <div class="col-lg-10">
                    <input type="password" class="form-control" name="password" id="password" name="excludeHangul" data-rule-required="true" placeholder="패스워드" maxlength="30">
                </div>
            </div>
            <div class="form-group" id="divPasswordCheck">
                <label for="inputPasswordCheck" class="col-lg-2 control-label">패스워드 확인</label>
                <div class="col-lg-10">
                    <input type="password" class="form-control" id="passwordCheck" data-rule-required="true" placeholder="패스워드 확인" maxlength="30">
                </div>
            </div>
            <div class="form-group">
                <label for="passwordHint" class="col-lg-2 control-label">패스워드 힌트</label>
                <div class="col-lg-10">
                    <select class="form-control" id="passwordQuestion" name="password_question">
                        <option value="question1" >나의 고향은?</option>
                        <option value="question2" >나의 초등학교는?</option>
                        <option value="question3" >내가 가장 좋아하는 음식은?</option>
                    </select>
                </div>
            </div>
            <div class="form-group" id="passwordHintCheck">
                <label for="inputPasswordCheck" class="col-lg-2 control-label">패스워드 힌트 답변</label>
                <div class="col-lg-10">
                    <input type="text" class="form-control" name="password_answer" id="hintCheck" data-rule-required="true" value="${requestScope.MemberVO.password_answer}" maxlength="30">
                </div>
            </div>
            <div class="form-group" id="divName">
                <label for="inputName" class="col-lg-2 control-label">이름</label>
                <div class="col-lg-10">
                    <input type="text" class="form-control onlyHangul" name="name" id="name" data-rule-required="true" value="${requestScope.MemberVO.name}" maxlength="15">
                </div>
            </div>
             
            <div class="form-group" id="address">
                <label for="inputNickname" class="col-lg-2 control-label">주소</label>
                <div class="col-lg-10">
                    <input type="text" class="form-control" name="address" id="address" data-rule-required="true" value="${requestScope.MemberVO.address}" maxlength="15">
                </div>
            </div>
             
            <div class="form-group" id="divEmail">
                <label for="inputEmail" class="col-lg-2 control-label">이메일</label>
                <div class="col-lg-8">
                    <input type="email" class="form-control" name="email" id="email" data-rule-required="true" value="${requestScope.MemberVO.email}" maxlength="40">
                </div>
                <div class="col-lg-2">
                	<input type="button" value="중복확인" onclick="checkEmail()">
                </div>
            </div>
            <div class="form-group" id="divPhoneNumber">
                <label for="inputPhoneNumber" class="col-lg-2 control-label">휴대폰 번호</label>
                <div class="col-lg-10">
                    <input type="tel" class="form-control onlyNumber" name="phoneNumber" id="phoneNumber" data-rule-required="true" value="${requestScope.MemberVO.phone_number}" maxlength="11">
                </div>
            </div>
            <div class="form-group">
                <label for="weekCount" class="col-lg-2 control-label"> 1주일 당 신청 횟수</label>
                <div class="col-lg-10">
                   <input type="text" readonly="readonly" name="" value="${requestScope.MemberVO.class_package}">
                </div>
            </div>
            <div class="form-group">
                <div class="col-lg-offset-2 col-lg-10">
                   	<input type="submit" value="수정">
                   	<input type="button" value="취소" onclick="gobackMain()">
                </div>
            </div>
        </form>
        </div>
</div>
    