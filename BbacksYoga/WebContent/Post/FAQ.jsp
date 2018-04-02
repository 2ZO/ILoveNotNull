<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"	href="${pageContext.request.contextPath}/CSS/faq.css">
<title>FAQ</title>
</head>
<body>
<div class="container">
  <div class="col-md-12">
    <div class="tab-content panels-faq">
      <div class="tab-pane active" id="tab1">
        <div class="panel-group" id="help-accordion-1">
          <div class="panel panel-default panel-help">
            <a href="#opret-produkt" data-toggle="collapse" data-parent="#help-accordion-1">
              <div class="panel-heading">
                <h2>수강료는 어떻게 되나요?</h2>
              </div>
            </a>
            <div id="opret-produkt" class="collapse in">
              <div class="panel-body">
                <p>매달 Bbak's Yoga는 다양한 이벤트를 진행하오니, 본원에 문의해주시기 바랍니다.</p>
                <p><strong>tel: </strong>031-1111-2222</p>
              </div>
            </div>
          </div>
          <div class="panel panel-default panel-help">
            <a href="#rediger-produkt" data-toggle="collapse" data-parent="#help-accordion-1">
              <div class="panel-heading">
                <h2>요가가 처음인데 수강할 수 있나요?</h2>
              </div>
            </a>
            <div id="rediger-produkt" class="collapse">
              <div class="panel-body">
                <p>Bbak's 요가는 수강생들을 수준과 컨디션을 맞춰서 수업을 진행하기 때문에 실력에 상관없이 수강가능합니다.</p>
                <p></p>
              </div>
            </div>
          </div>
          <div class="panel panel-default panel-help">
            <a href="#ret-pris" data-toggle="collapse" data-parent="#help-accordion-1">
              <div class="panel-heading">
                <h2>Question01</h2>
              </div>
            </a>
            <div id="ret-pris" class="collapse">
              <div class="panel-body">
                <p>답변</p>
                <p><strong>Example: </strong>Facere, id excepturi iusto aliquid beatae delectus nemo enim, ad saepe nam et.</p>
              </div>
            </div>
          </div>
          <div class="panel panel-default panel-help">
            <a href="#slet-produkt" data-toggle="collapse" data-parent="#help-accordion-1">
              <div class="panel-heading">
                <h2>Question02</h2>
              </div>
            </a>
            <div id="slet-produkt" class="collapse">
              <div class="panel-body">
                <p>답변</p>
                <p><strong>Example: </strong>Facere, id excepturi iusto aliquid beatae delectus nemo enim, ad saepe nam et.</p>
              </div>
            </div>
          </div>
          <div class="panel panel-default panel-help">
            <a href="#opret-kampagne" data-toggle="collapse" data-parent="#help-accordion-1">
              <div class="panel-heading">
                <h2>Question03</h2>
              </div>
            </a>
            <div id="opret-kampagne" class="collapse">
              <div class="panel-body">
                <p>답변</p>
                <p><strong>Example: </strong>Facere, id excepturi iusto aliquid beatae delectus nemo enim, ad saepe nam et.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
  <!--     <div class="tab-pane" id="tab2">
        <div class="panel-group" id="help-accordion-2">      
          <div class="panel panel-default panel-help">
            <a href="#help-three" data-toggle="collapse" data-parent="#help-accordion-2">
              <div class="panel-heading">
                <h2>Question04</h2>
              </div>
            </a>
            <div id="help-three" class="collapse in">
              <div class="panel-body">
                <p>답변</p>
                <p><strong>Example: </strong>Facere, id excepturi iusto aliquid beatae delectus nemo enim, ad saepe nam et.</p>
              </div>
            </div>
          </div>
        </div>
      </div> -->
    </div>    
  </div>
</div>
</body>
</html>