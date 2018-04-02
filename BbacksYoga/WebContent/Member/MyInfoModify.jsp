<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <head>
        <meta charset="utf-8">
        <!-- meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0"/ -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>회원가입</title>
        <!-- Bootstrap -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="/resources/image/icon/HalfLife.ico" rel="shortcuticon">
        <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->
        <script src="//code.jquery.com/jquery.js"></script>
        <!-- 모든 합쳐진 플러그인을 포함하거나 (아래) 필요한 각각의 파일들을 포함하세요 -->
        <script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <!-- Respond.js 으로 IE8 에서 반응형 기능을 활성화하세요 (https://github.com/scottjehl/Respond) -->
        <script src="/resources/bootstrap/js/respond.js"></script>
        <style type="text/css">
        	h2{
        		width: 120px;
        		margin: 0 auto;
        	}
        </style>
</head>
<body>
	 <div class="container"><!-- 좌우측의 공간 확보 -->
            <!-- 헤더 들어가는 부분 -->
             <h2>회원가입</h2>
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
            <hr/>
                <!-- 본문 들어가는 부분 -->
        <form class="form-horizontal" role="form" method="post" action="javascript:alert( 'success!' );">

            <div class="form-group" id="divId">
                <label for="inputId" class="col-lg-2 control-label">아이디</label>
                <div class="col-lg-8">
                     <input type="text" readonly="readonly" name="" value=" ${requestScope.MemberVO.id}">
                </div>
                <div class="col-lg-2">
                	
                </div>
            </div>
            <div class="form-group" id="divPassword">
                <label for="inputPassword" class="col-lg-2 control-label">패스워드</label>
                <div class="col-lg-10">
                    <input type="password" class="form-control" id="password" name="excludeHangul" data-rule-required="true" placeholder="패스워드" maxlength="30">
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
                    <select class="form-control" id="passwordQuestion">
                        <option value="question1">나의 고향은?</option>
                        <option value="question2">나의 초등학교는?</option>
                        <option value="question3">내가 가장 좋아하는 음식은?</option>
                    </select>
                </div>
            </div>
            <div class="form-group" id="passwordHintCheck">
                <label for="inputPasswordCheck" class="col-lg-2 control-label">패스워드 힌트 답변</label>
                <div class="col-lg-10">
                    <input type="password" class="form-control" id="hintCheck" data-rule-required="true" placeholder="패스워드 힌트 답변" maxlength="30">
                </div>
            </div>
            <div class="form-group" id="divName">
                <label for="inputName" class="col-lg-2 control-label">이름</label>
                <div class="col-lg-10">
                    <input type="text" class="form-control onlyHangul" id="name" data-rule-required="true" placeholder="한글만 입력 가능합니다." maxlength="15">
                </div>
            </div>
             
            <div class="form-group" id="address">
                <label for="inputNickname" class="col-lg-2 control-label">주소</label>
                <div class="col-lg-10">
                    <input type="text" class="form-control" id="nickname" data-rule-required="true" placeholder="주소" maxlength="15">
                </div>
            </div>
             
            <div class="form-group" id="divEmail">
                <label for="inputEmail" class="col-lg-2 control-label">이메일</label>
                <div class="col-lg-8">
                    <input type="email" class="form-control" id="email" data-rule-required="true" placeholder="이메일" maxlength="40">
                </div>
                <div class="col-lg-2">
                	<input type="button" value="중복확인" onclick="checkEmail()">
                </div>
            </div>
            <div class="form-group" id="divPhoneNumber">
                <label for="inputPhoneNumber" class="col-lg-2 control-label">휴대폰 번호</label>
                <div class="col-lg-10">
                    <input type="tel" class="form-control onlyNumber" id="phoneNumber" data-rule-required="true" placeholder="-를 제외하고 숫자만 입력하세요." maxlength="11">
                </div>
            </div>
            <div class="form-group">
                <label for="weekCount" class="col-lg-2 control-label"> 1주일 당 신청 횟수</label>
                <div class="col-lg-10">
                   <input type="text" readonly="readonly" name="" value=" ${requestScope.MemberVO.class_package}">
                </div>
            </div>
            <div class="form-group">
                <div class="col-lg-offset-2 col-lg-10">
                    <button type="submit" class="btn btn-default">Sign in</button>
                </div>
            </div>
        </form>
        </div>
</body>
    