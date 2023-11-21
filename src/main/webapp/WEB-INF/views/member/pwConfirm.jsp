<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="${conPath }/css/style.css" rel="stylesheet">
	<script src="${conPath }/js/address.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script>
		$(document).ready(function(){
			
		});
	</script>
</head>
<body>
	<c:if test="${not empty pwConfirmResult }">
		<script>
			alert("${pwConfirmResult }");
			history.back();
		</script>
	</c:if>
	<form action="${conPath }/member/pwConfirm.do" method="post">
		<input type="text" name="id" value="${member.id }">
		<input type="text" name="pw">
		<input type="submit" value="확인">
	</form>
</body>
</html>