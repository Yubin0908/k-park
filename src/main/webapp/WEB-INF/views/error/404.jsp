<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/style.css" rel="stylesheet">
	<script src="${conPath }/js/address.js"></script>
	<script>
	setTimeout(function() {
	      location.href="${conPath}/main.do";
	    }, 3500);
	</script>
</head>
<body>
	<img src="${conPath }/img/404error.jpg" alt="404에러" class="img">
	<h1>페이지를 찾을수 없습니다!!</h1>
	<p>관리자에게 연락하시기 바랍니다.</p>
</body>
</html>