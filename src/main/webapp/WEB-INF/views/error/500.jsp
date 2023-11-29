<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>
<% response.setStatus(200);%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<style>
    #error_wrap {
      width: 1400px;
      margin: 0 auto;
    }
    .e500 {
      text-align: center;
    }
    .e500 h2 {
      margin-top: -460px;
    }
    .e500 span {
      font-weight: 700;
      font-size: 1.5em;
      line-height: 350px;
    }
  </style>
</head>
<body>
	<br>
  <br>
  <br>
  <div id="error_wrap">
    <div class="e500">
      <img src="${conPath }/img/500error.png" alt="">
      <h2 style="font-size: 10em">500</h2>
      <span>현재 페이지가 점검중 입니다. 빠른 시일내에 찾아뵙겠습니다.</span>
    </div>
  </div>
  <script>
    setTimeout(function() {
    	location.href="${conPath}/main.do";
    }, 3500);
  </script>
</body>
</html>